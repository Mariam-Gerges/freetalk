import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
