import 'package:flutter/material.dart';

class DictionaryTitle extends StatelessWidget {
  const DictionaryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Dictionary',
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge?.color ??
            Theme.of(context).colorScheme.onSurface,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}