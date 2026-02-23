import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/app_router.dart';
import 'package:freetalk/core/routing/routes.dart';

class FreeTalk extends StatelessWidget {
  const FreeTalk({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}
