import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';
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
      Navigator.of(context).pushNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
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
                  OnboardingIconContainer(
                    imagePath: 'assets/images/onbording1.svg',
                  ),
                  const SizedBox(height: 40),
                  const OnboardingContent(
                    title: "Welcome to FreeTalk",
                    description:
                        'A smart app that helps you communicate using sign language.',
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
                  nextButtonColor: AppColors.primaryDark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
