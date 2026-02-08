import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/feature/onbording/widget/dotsIndicator.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_content.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_icon_container.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_navigation_buttons.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_skip_button.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Column(
          children: [
            OnboardingSkipButton(onTap: () => Navigator.of(context).pushNamed(Routes.signupScreen)),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnboardingIconContainer(
                    imagePath: 'assets/images/onbording3.svg',
                    // iconColor: Color(0xFF14B8A6),
                  ),
                  const SizedBox(height: 40),
                  const OnboardingContent(
                    title: 'Connect Easily',
                    description:
                        'Break communication barriers and connect with confidence.',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                DotsIndicator(currentDotIndex: 2),
                OnboardingNavigationButtons(
                  onPrevious: () => Navigator.of(
                    context,
                  ).pushNamed(Routes.onboardingScreen2),
                  onNext: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(Routes.signupScreen),
                  nextButtonLabel: 'Get Started',
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
