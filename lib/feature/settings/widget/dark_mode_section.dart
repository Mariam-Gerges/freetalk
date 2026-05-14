import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/feature/settings/logic/theme_cubit.dart';

class DarkModeSection extends StatelessWidget {
  const DarkModeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.dark_mode),
              const SizedBox(width: 12),
              const Text('Dark Mode'),
              const Spacer(),
              Switch(
                value: isDarkMode,
                onChanged: (_) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}