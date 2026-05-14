import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(width: 8),
          Text("Typing..."),
        ],
      ),
    );
  }
}