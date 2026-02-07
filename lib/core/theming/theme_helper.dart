// import 'package:flutter/material.dart';
// import 'package:freetalk/core/theming/theme_provider.dart';
// import 'package:provider/provider.dart';

// class ThemeHelper {
//   /// التحقق من وضع المظهر الحالي
//   static bool isDarkMode(BuildContext context) {
//     return context.read<ThemeProvider>().isDarkMode;
//   }

//   // / تبديل المظهر
//   static void toggleTheme(BuildContext context) {
//     context.read<ThemeProvider>().toggleTheme();
//   }

//   /// تعيين المظهر (مباشر)
//   static void setDarkMode(BuildContext context, bool isDark) {
//     context.read<ThemeProvider>().setDarkMode(isDark);
//   }

//   /// مراقب تغيير المظهر
//   static void listenToThemeChanges(
//     BuildContext context,
//     Function(bool isDark) callback,
//   ) {
//     context.read<ThemeProvider>().addListener(() {
//       callback(context.read<ThemeProvider>().isDarkMode);
//     });
//   }
// }
