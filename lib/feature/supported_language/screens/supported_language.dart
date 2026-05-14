import 'package:flutter/material.dart';
import 'package:freetalk/core/routing/routes.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/feature/supported_language/widget/language_card.dart';

class SupportedLanguage extends StatelessWidget {
  const SupportedLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supported Languages',
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge?.color ??
                      Theme.of(context).colorScheme.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 22),

              LanguageCard(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.translateScreen, arguments: 'en');
                },
                color: AppColors.french,
                title: 'French (LSF)',
                subtitle:
                    'Access lessons and full dictionary for French sign language (LSF)',
                flagUrl: 'https://flagcdn.com/w80/fr.png',
              ),

              const SizedBox(height: 18),

              LanguageCard(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.translateScreen, arguments: 'en');
                    
                  },
                color: AppColors.american,
                title: 'English (ASL)',
                subtitle:
                    'Explore comprehensive English sign language (ASL) Dictionary and lessons',
                flagUrl: 'https://flagcdn.com/w80/us.png',
              ),

              const SizedBox(height: 18),

              LanguageCard(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.translateScreen, arguments: 'ar');
                },
                color: AppColors.egyptian,
                title: 'Arabic',
                subtitle:
                    'Discover resources for Arabic sign language tailored for native speakers',
                flagUrl: 'https://flagcdn.com/w80/sa.png',
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
