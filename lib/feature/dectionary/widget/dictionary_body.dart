import 'package:flutter/material.dart';
import 'package:freetalk/core/widget/bottom_navigation_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dictionary_search.dart';
import 'dictionary_result.dart';
import 'dictionary_title.dart';

class DictionaryBody extends StatefulWidget {
  const DictionaryBody({super.key});

  @override
  State<DictionaryBody> createState() => _DictionaryBodyState();
}

class _DictionaryBodyState extends State<DictionaryBody> {
  final TextEditingController _searchController = TextEditingController();

  List<String> resultImages = [];
  static String globalSelectedLanguage = "ar";
  String selectedLanguage = globalSelectedLanguage;
  Map<String, String> lettersMap = {};

  Future<void> loadLetters() async {
    final response = await Supabase.instance.client
        .from('sign_letters')
        .select()
        .eq('language', selectedLanguage);

    lettersMap.clear();

    for (var item in response) {
      lettersMap[item['letter']] = item['image_url'];
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null) {
      selectedLanguage = args as String;
      globalSelectedLanguage = selectedLanguage;
    } else {
      selectedLanguage = globalSelectedLanguage;
    }

    loadLetters().then((_) {
      if (mounted) setState(() {});
    });
  }

  void convertWordToSigns(String word) {
    resultImages.clear();

    for (int i = 0; i < word.length; i++) {
      String letter = word[i];

      if (selectedLanguage == "en") {
        letter = letter.toLowerCase();
      }

      if (letter.trim().isEmpty) continue;

      if (lettersMap.containsKey(letter)) {
        resultImages.add(lettersMap[letter]!);
      }
    }

    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DictionaryTitle(),
              const SizedBox(height: 8),

              DictionarySearch(
                controller: _searchController,
                onChanged: convertWordToSigns,
              ),

              const SizedBox(height: 20),

              DictionaryResult(
                controller: _searchController,
                resultImages: resultImages,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(initialIndex: 1),
    );
  }
}