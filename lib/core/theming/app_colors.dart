import 'package:flutter/material.dart';

abstract class AppColors {
  // Light Theme Colors
  static const Color scaffoldBackgroundLight = Color(0xffffffff);
  static const Color cardLight = Color(0xffffffff);
  static const Color textPrimaryLight = Color(0xff000000);
  static const Color textSecondaryLight = Color(0xff6B7280);
  static const Color dividerLight = Color(0xffE5E7EB);
  static const Color inputBackgroundLight = Color(0xfff3f4f6);

  // Dark Theme Colors
  static const Color scaffoldBackgroundDark = Color(0xff190E38);
  static const Color cardDark = Color(0xff2A2A5E);
  static const Color textPrimaryDark = Color(0xffffffff);
  static const Color textSecondaryDark = Color(0xff9CA3AF);
  static const Color dividerDark = Color(0xff374151);
  static const Color inputBackgroundDark = Color(0xff2A2A5E); // Indigo tint for inputs

  // Common Colors
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color transparent = Colors.transparent;
  static const Color primary = Color(0xff6B46C1);
  static const Color primaryDark = Color(0xff8F5EFF);
  static const Color secondary = Color(0xff522AAF);
  static const Color success = Color(0xff10b981);
  static const Color error = Color(0xffef4444);
  static const Color warning = Color(0xfff59e0b);
  static const Color french = Color(0xff191D77);
  static const Color american = Color(0xff3A3E83);
  static const Color egyptian = Color(0xff125C0B);
  static const Color grey = Color(0xffDFDFDF);

  // Theme-aware getters
  static Color scaffoldBackground(bool isDark) =>
      isDark ? scaffoldBackgroundDark : scaffoldBackgroundLight;

  static Color cardColor(bool isDark) => isDark ? cardDark : cardLight;

  static Color textPrimary(bool isDark) =>
      isDark ? textPrimaryDark : textPrimaryLight;

  static Color textSecondary(bool isDark) =>
      isDark ? textSecondaryDark : textSecondaryLight;

  static Color divider(bool isDark) => isDark ? dividerDark : dividerLight;

  static Color inputBackground(bool isDark) =>
      isDark ? inputBackgroundDark : inputBackgroundLight;
}