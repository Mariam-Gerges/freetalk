import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/app_router.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final themeProvider = ThemeProvider();
  // await themeProvider.initializeTheme();
  runApp(FreeTalk(appRouter: AppRouter()));
}

class FreeTalk extends StatelessWidget {
  const FreeTalk({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.splashScreen,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
    );
  }
}
