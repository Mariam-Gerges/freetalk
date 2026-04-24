import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/feature/settings/logic/theme_cubit.dart';

/// Extension on BuildContext to easily access theme-aware colors
extension ThemeExtension on BuildContext {
  bool get isDarkMode => BlocProvider.of<ThemeCubit>(this).state;

  Color get scaffoldBackground =>
      AppColors.scaffoldBackground(isDarkMode);

  Color get cardColor => AppColors.cardColor(isDarkMode);

  Color get textPrimary => AppColors.textPrimary(isDarkMode);

  Color get textSecondary => AppColors.textSecondary(isDarkMode);

  Color get divider => AppColors.divider(isDarkMode);

  Color get inputBackground => AppColors.inputBackground(isDarkMode);
}

/// Widget that rebuilds when theme changes
class ThemeConsumer extends StatelessWidget {
  final Widget Function(BuildContext context, bool isDarkMode) builder;

  const ThemeConsumer({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) => builder(context, isDarkMode),
    );
  }
}

/// Helper class for theme-aware colors
abstract class ThemeHelper {
  static Color background(BuildContext context) =>
      context.scaffoldBackground;

  static Color card(BuildContext context) => context.cardColor;

  static Color textPrimary(BuildContext context) => context.textPrimary;

  static Color textSecondary(BuildContext context) => context.textSecondary;

  static Color divider(BuildContext context) => context.divider;

  static Color inputBg(BuildContext context) => context.inputBackground;
}