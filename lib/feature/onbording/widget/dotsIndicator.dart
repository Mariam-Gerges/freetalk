import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  
  final int currentDotIndex;

  const DotsIndicator({
    super.key,
    
    required this.currentDotIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentDotIndex == index ? 12 : 8,
              height: currentDotIndex == index ? 12 : 8,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),
    );
  }
}