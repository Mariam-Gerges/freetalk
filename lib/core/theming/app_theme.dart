import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_text_theme.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "LeagueSpartan",
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.scaffoldBackgroundLight,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.black),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "LeagueSpartan",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white, 
      elevation: 0,
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackgroundLight,
      hintStyle: const TextStyle(color: AppColors.textSecondaryLight),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextTheme.font24BlackRegular,
      displayMedium: AppTextTheme.font13BlackRegular,
      displaySmall: AppTextTheme.font16BlackRegular,
      bodySmall: AppTextTheme.font22BlackRegular,
      titleLarge: AppTextTheme.font24BlackBold,
      titleMedium: AppTextTheme.font24BlackBold,
    ),
  );

  static ThemeData darkMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: "LeagueSpartan",
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      background: AppColors.scaffoldBackgroundDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "LeagueSpartan",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      
      fillColor: AppColors.inputBackgroundDark,
      hintStyle: const TextStyle(color: AppColors.textSecondaryDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextTheme.font24BlackRegular.copyWith(color: AppColors.white),
      displayMedium: AppTextTheme.font13BlackRegular.copyWith(color: AppColors.white),
      displaySmall: AppTextTheme.font16BlackRegular.copyWith(color: AppColors.white),
      bodySmall: AppTextTheme.font22BlackRegular.copyWith(color: AppColors.white),
      titleLarge: AppTextTheme.font24BlackBold.copyWith(color: AppColors.white),
      titleMedium: AppTextTheme.font24BlackBold.copyWith(color: AppColors.white),
    ),
  );
}
