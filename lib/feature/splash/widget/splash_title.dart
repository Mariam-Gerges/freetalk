import 'package:flutter/material.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          "FREE TALK",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "It was never more easy",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
