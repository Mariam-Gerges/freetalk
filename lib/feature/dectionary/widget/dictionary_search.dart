import 'package:flutter/material.dart';

class DictionarySearch extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const DictionarySearch({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: 'Search word',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}