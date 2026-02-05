import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  late Dio dio;
  static const String baseUrl =
      'https://api.freetalk.com/api/'; // غير الرابط بتوعك
  static const int connectionTimeout = 30;
  static const int receiveTimeout = 30;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: connectionTimeout),
        receiveTimeout: const Duration(seconds: receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // إضافة Interceptors
    dio.interceptors.add(_createInterceptor());
  }

  InterceptorsWrapper _createInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // إضافة الـ Token إلى الـ Headers
        final token = await _getToken();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        // التعامل مع أخطاء الـ API
        _handleApiError(error);
        return handler.next(error);
      },
    );
  }

  Future<String> _getToken() async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'auth_token');
      return token ?? '';
    } catch (e) {
      return '';
    }
  }

  void _handleApiError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        print('❌ Connection Timeout');
        break;
      case DioExceptionType.receiveTimeout:
        print('❌ Receive Timeout');
        break;
      case DioExceptionType.badResponse:
        print('❌ Bad Response: ${error.response?.statusCode}');
        break;
      case DioExceptionType.cancel:
        print('❌ Request Cancelled');
        break;
      case DioExceptionType.unknown:
        print('❌ Unknown Error: ${error.message}');
        break;
      default:
        print('❌ Error: ${error.message}');
    }
  }

  // ========== GET Request ==========
  Future<T> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams);
      return fromJson(response.data);
    } on DioException catch (e) {
      throw _formatError(e);
    }
  }

  // ========== POST Request ==========
  Future<T> post<T>({
    required String endpoint,
    required dynamic data,
    Map<String, dynamic>? queryParams,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParams,
      );
      return fromJson(response.data);
    } on DioException catch (e) {
      throw _formatError(e);
    }
  }

  // ========== PUT Request ==========
  Future<T> put<T>({
    required String endpoint,
    required dynamic data,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return fromJson(response.data);
    } on DioException catch (e) {
      throw _formatError(e);
    }
  }

  // ========== DELETE Request ==========
  Future<T> delete<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await dio.delete(endpoint);
      return fromJson(response.data);
    } on DioException catch (e) {
      throw _formatError(e);
    }
  }

  String _formatError(DioException error) {
    if (error.response?.data != null) {
      return error.response?.data['message'] ?? 'حدث خطأ ما';
    }
    return error.message ?? 'حدث خطأ ما';
  }
}
