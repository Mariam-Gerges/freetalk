import 'package:flutter/material.dart';

class DictionaryResult extends StatelessWidget {
  final TextEditingController controller;
  final List<String> resultImages;

  const DictionaryResult({
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
              ? _buildHint(context, 'Sign language images will appear here')
              : resultImages.isEmpty
                  ? _buildHint(context, 'No signs found')
                  : _buildImages(),
        ),
      ),
    );
  }

  Widget _buildHint(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(color: Theme.of(context).hintColor),
    );
  }

  Widget _buildImages() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: resultImages.map((imageUrl) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}