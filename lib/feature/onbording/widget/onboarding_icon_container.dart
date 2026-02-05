import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freetalk/core/theming/app_colors.dart';

class OnboardingIconContainer extends StatelessWidget {
  final String imagePath;

  const OnboardingIconContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SvgPicture.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
