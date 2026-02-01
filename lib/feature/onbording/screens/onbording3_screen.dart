import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/feature/onbording/widget/dotsIndicator.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_content.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_icon_container.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_navigation_buttons.dart';
import 'package:freetalk/feature/onbording/widget/onboarding_skip_button.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            OnboardingSkipButton(onTap: () => context.go(Routes.signupScreen)),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const OnboardingIconContainer(
                    icon: Icons.trending_up,
                    iconColor: Color(0xFF14B8A6),
                  ),
                  const SizedBox(height: 40),
                  const OnboardingContent(
                    title: 'تقارير شاملة ومفصلة',
                    description:
                        'احصل على تقارير شاملة عن جميع الأصول مع إمكانية التصدير والمشاركة',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                DotsIndicator(currentDotIndex: 2),
                OnboardingNavigationButtons(
                  onPrevious: () => Navigator.of(context).pushReplacementNamed(Routes.onboardingScreen2),
                  onNext: () => Navigator.of(context).pushReplacementNamed(Routes.signupScreen),
                  nextButtonLabel: 'إبدأ الآن',
                  nextButtonColor: const Color(0xFF14B8A6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
