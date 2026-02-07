// import 'package:flutter/material.dart';
// import 'package:freetalk/core/theming/theme_helper.dart';

// class ThemeSwitchButton extends StatelessWidget {
//   final Color? foregroundColor;
//   final double? size;

//   const ThemeSwitchButton({super.key, this.foregroundColor, this.size = 24});

//   @override
//   Widget build(BuildContext context) {
//     final isDark = ThemeHelper.isDarkMode(context);

//     return IconButton(
//       onPressed: () {
//         ThemeHelper.toggleTheme(context);
//       },
//       icon: Icon(
//         isDark ? Icons.light_mode : Icons.dark_mode,
//         size: size,
//         color: foregroundColor,
//       ),
//       tooltip: isDark ? 'تفعيل الوضع الفاتح' : 'تفعيل الوضع الداكن',
//     );
//   }
// }

// class ThemeSwitchListTile extends StatelessWidget {
//   const ThemeSwitchListTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isDark = ThemeHelper.isDarkMode(context);

//     return ListTile(
//       leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
//       title: const Text('المظهر'),
//       subtitle: Text(isDark ? 'وضع داكن' : 'وضع فاتح'),
//       trailing: Switch(
//         value: isDark,
//         onChanged: (value) {
//           ThemeHelper.setDarkMode(context, value);
//         },
//       ),
//     );
//   }
// }
