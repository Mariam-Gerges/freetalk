import 'package:flutter/material.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final String nextButtonLabel;
  final Color nextButtonColor;
  final bool showPreviousButton;

  const OnboardingNavigationButtons({
    super.key,
    required this.onPrevious,
    required this.onNext,
    this.nextButtonLabel = 'التالي',
    required this.nextButtonColor,
    this.showPreviousButton = true,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: showPreviousButton? [
          SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: nextButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              
              ),
              child: Text(
                nextButtonLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          
          IconButton(
            onPressed: onPrevious,
            icon: const Icon(Icons.arrow_forward),
            color: const Color(0xFF666666),
            iconSize: 34,
          ),
          
        ]:[
          SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F4C81),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                nextButtonLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
