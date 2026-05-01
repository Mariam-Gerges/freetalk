import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/feature/splash/widget/splash_loader.dart';
import 'package:freetalk/feature/splash/widget/splash_logo.dart';
import 'package:freetalk/feature/splash/widget/splash_title.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      try {
        context.go(Routes.onboardingScreen1);
      } catch (e) {
        // Handle GoRouter not found error
        Navigator.of(context).pushReplacementNamed(Routes.supportedlanguageScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
             
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogo(),
            const SplashTitle(),
            SplashLoader(),
          ],
        ),
      ),
    );
  }
}
