// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class ThemeProvider extends ChangeNotifier {
//   static final ThemeProvider _instance = ThemeProvider._internal();

//   late bool _isDarkMode;
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();
//   static const String _themeKey = 'theme_mode';

//   factory ThemeProvider() {
//     return _instance;
//   }

//   ThemeProvider._internal() {
//     _isDarkMode = false;
//   }

//   bool get isDarkMode => _isDarkMode;

//   Future<void> initializeTheme() async {
//     try {
//       final savedTheme = await _storage.read(key: _themeKey);
//       _isDarkMode = savedTheme == 'dark';
//     } catch (e) {
//       _isDarkMode = false;
//     }
//     notifyListeners();
//   }

//   Future<void> toggleTheme() async {
//     _isDarkMode = !_isDarkMode;
//     try {
//       await _storage.write(
//         key: _themeKey,
//         value: _isDarkMode ? 'dark' : 'light',
//       );
//     } catch (e) {
//       print('Error saving theme: $e');
//     }
//     notifyListeners();
//   }

//   Future<void> setDarkMode(bool isDark) async {
//     if (_isDarkMode == isDark) return;
//     _isDarkMode = isDark;
//     try {
//       await _storage.write(
//         key: _themeKey,
//         value: _isDarkMode ? 'dark' : 'light',
//       );
//     } catch (e) {
//       print('Error saving theme: $e');
//     }
//     notifyListeners();
//   }
// }
