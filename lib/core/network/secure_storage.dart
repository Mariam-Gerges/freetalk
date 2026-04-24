import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = "auth_token";
  static const _themeKey = "is_dark_mode";

  // Token methods
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // Theme methods
  static Future<void> saveTheme(bool isDarkMode) async {
    await _storage.write(key: _themeKey, value: isDarkMode.toString());
  }

  static Future<bool> getTheme() async {
    final value = await _storage.read(key: _themeKey);
    return value == 'false';
  }
}
