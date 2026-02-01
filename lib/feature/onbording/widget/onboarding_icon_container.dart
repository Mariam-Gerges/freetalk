import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingIconContainer extends StatelessWidget {
  final String imagePath;

  const OnboardingIconContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: SvgPicture.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
