import 'package:flutter/material.dart';

class OnboardingIconContainer extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double? iconSize;

  const OnboardingIconContainer({
    super.key,
    required this.icon,
    this.iconColor = const Color(0xFF0F4C81),
    this.iconSize = 70,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        
        boxShadow: [
          BoxShadow(
            color: iconColor.withAlpha(90),
            blurRadius: 50,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
