import 'package:flutter/material.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const OnboardingSkipButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: onTap,
            child: const Text(
              'تخطى',
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
