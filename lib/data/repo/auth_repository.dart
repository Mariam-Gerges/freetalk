import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freetalk/core/network/api_endpoints.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/data/model/auth_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  // ========== Login ==========
  Future<AuthResponse> login(String email, String password) async {
    final response = await apiService.post<AuthResponse>(
      endpoint: ApiEndpoints.login,
      data: LoginRequest(email: email, password: password).toJson(),
      fromJson: (json) => AuthResponse.fromJson(json),
    );

    // حفظ الـ Token
    await _saveToken(response.token);
    await _saveRefreshToken(response.refreshToken);

    return response;
  }

  // ========== Register ==========
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    final response = await apiService.post<AuthResponse>(
      endpoint: ApiEndpoints.register,
      data: RegisterRequest(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      ).toJson(),
      fromJson: (json) => AuthResponse.fromJson(json),
    );

    await _saveToken(response.token);
    await _saveRefreshToken(response.refreshToken);

    return response;
  }

  // ========== Logout ==========
  Future<void> logout() async {
    try {
      await apiService.post<Map<String, dynamic>>(
        endpoint: ApiEndpoints.logout,
        data: {},
        fromJson: (json) => json,
      );
    } finally {
      await _clearTokens();
    }
  }

  // ========== Get Saved Token ==========
  Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'auth_token');
  }

  // ========== Refresh Token ==========
  Future<void> refreshToken() async {
    try {
      const storage = FlutterSecureStorage();
      final refreshToken = await storage.read(key: 'refresh_token');

      if (refreshToken == null) return;

      final response = await apiService.post<Map<String, dynamic>>(
        endpoint: ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
        fromJson: (json) => json,
      );

      final newToken = response['token'];
      if (newToken != null) {
        await _saveToken(newToken);
      }
    } catch (e) {
      await _clearTokens();
      rethrow;
    }
  }

  // ========== Private Methods ==========
  Future<void> _saveToken(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'auth_token', value: token);
  }

  Future<void> _saveRefreshToken(String refreshToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<void> _clearTokens() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'auth_token');
    await storage.delete(key: 'refresh_token');
  }
}
