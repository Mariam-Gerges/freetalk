import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/core/routing/app_router.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_theme.dart';
import 'package:freetalk/feature/settings/logic/theme_cubit.dart';

class FreeTalk extends StatelessWidget {
  const FreeTalk({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.splashScreen,
        );
      },
    );
  }
}
