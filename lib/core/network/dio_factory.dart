import 'package:dio/dio.dart';
import 'package:freetalk/core/network/api_constans.dart';
import 'package:freetalk/core/network/secure_storage.dart';

class DioFactory {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.getToken();

          if (token != null &&
              !options.path.contains(ApiConstants.login) &&
              !options.path.contains(ApiConstants.register)
          // !options.path.contains("/auth/verify") &&
          // !options.path.contains("/auth/resend-verification")
          ) {
            options.headers["Authorization"] = "Bearer $token";
          }

          handler.next(options);
        },

        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await SecureStorage.deleteToken();
          }

          handler.next(error);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}
