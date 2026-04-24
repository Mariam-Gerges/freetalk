import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_text_theme.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "LeagueSpartan",
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
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
    fontFamily: "LeagueSpartan",
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primary,
    textTheme: TextTheme(
      displayLarge: AppTextTheme.font24BlackRegular.copyWith(
        color: AppColors.white,
      ),
      displayMedium: AppTextTheme.font13BlackRegular.copyWith(
        color: AppColors.white,
      ),
      displaySmall: AppTextTheme.font16BlackRegular.copyWith(
        color: AppColors.white,
      ),
      bodySmall: AppTextTheme.font22BlackRegular.copyWith(
        color: AppColors.white,
      ),

      titleLarge: AppTextTheme.font24BlackBold.copyWith(color: AppColors.white),
      titleMedium: AppTextTheme.font24BlackBold.copyWith(
        color: AppColors.white,
      ),
    ),
  );
}
