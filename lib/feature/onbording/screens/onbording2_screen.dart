import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/feature/onbording/widget/dotsIndicator.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_content.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_icon_container.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_navigation_buttons.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_skip_button.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Column(
          children: [
            OnboardingSkipButton(
              onTap: () => Navigator.of(
                context,
              ).pushNamed(Routes.signupScreen),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnboardingIconContainer(
                    imagePath: 'assets/images/onbordoing2.svg',
                    // iconColor: Color(0xFF2563EB),
                  ),
                  const SizedBox(height: 40),
                  const OnboardingContent(
                    title: "Learn & Translate",
                    description:
                        'Translate sign language and learn signs easily using AI.',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                DotsIndicator(currentDotIndex: 1),
                OnboardingNavigationButtons(
                  onPrevious: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(Routes.onboardingScreen1),
                  onNext: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(Routes.onboardingScreen3),
                  nextButtonColor: const Color(0xFF2563EB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
