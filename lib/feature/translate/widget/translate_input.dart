import 'package:flutter/material.dart';

class TranslateInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isListening;
  final Function(String) onChanged;
  final VoidCallback onMicTap;
  final VoidCallback onCameraTap;

  const TranslateInput({
    super.key,
    required this.controller,
    required this.isListening,
    required this.onChanged,
    required this.onMicTap,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Type or speak to translate',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: onCameraTap,
          ),
          IconButton(
            icon: Icon(isListening ? Icons.mic : Icons.mic_none),
            onPressed: onMicTap,
          ),
        ],
      ),
    );
  }
}