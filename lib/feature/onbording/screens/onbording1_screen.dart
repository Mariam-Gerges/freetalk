import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/feature/onbording/widget/dotsIndicator.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_content.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_icon_container.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_navigation_buttons.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_skip_button.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void _navigateToRoute(String route) {
    try {
      context.go(route);
    } catch (e) {
      Navigator.of(context).pushReplacementNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            OnboardingSkipButton(
              onTap: () => _navigateToRoute(Routes.signupScreen),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const OnboardingIconContainer(
                    icon: Icons.assignment_turned_in_outlined,
                    iconColor: Color(0xFF0F4C81),
                  ),
                  const SizedBox(height: 40),
                  const OnboardingContent(
                    title: 'مرحبا في تطبيق الجرد',
                    description:
                        'نظام متكامل لتتبع وإدارة الأصول الحكومية بكل سهولة وفعالية',
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(currentDotIndex: 0),
                OnboardingNavigationButtons(
                  onPrevious: () => _navigateToRoute(Routes.splashScreen),
                  onNext: () => _navigateToRoute(Routes.onboardingScreen2),
                  showPreviousButton: false,
                  nextButtonColor: const Color(0xFF0F4C81),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
