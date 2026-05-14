import 'package:flutter/material.dart';

class TranslateResult extends StatelessWidget {
  final TextEditingController controller;
  final List<String> resultImages;

  const TranslateResult({
    super.key,
    required this.controller,
    required this.resultImages,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: controller.text.isEmpty
              ? Text(
                  'Sign language images will appear here',
                  style: TextStyle(color: Theme.of(context).hintColor),
                )
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: resultImages.map((e) {
                      return Image.network(
                        e,
                        width: 70,
                        height: 70,
                        fit: BoxFit.contain,
                      );
                    }).toList(),
                  ),
                ),
        ),
      ),
    );
  }
}