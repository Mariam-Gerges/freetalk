import 'package:flutter/material.dart';
import 'package:freetalk/core/widget/bottom_navigation_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:freetalk/feature/translate/data/models/sign_model.dart';
import 'package:freetalk/feature/translate/logic/translate_controller.dart';
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
  String selectedLanguage = TranslateController.globalSelectedLanguage;
  Map<String, String> lettersMap = {};

  Future<void> loadLetters() async {
    final response = await Supabase.instance.client
        .from('sign_letters')
        .select()
        .eq('language', selectedLanguage);

    lettersMap.clear();

    for (var item in response) {
      final sign = SignModel.fromJson(item);
      if (sign.letter != null && sign.letter!.isNotEmpty && sign.imageUrl != null) {
        lettersMap[sign.letter!] = sign.imageUrl!;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null) {
      selectedLanguage = args as String;
      TranslateController.globalSelectedLanguage = selectedLanguage;
    } else {
      selectedLanguage = TranslateController.globalSelectedLanguage;
    }

    loadLetters().then((_) {
      if (mounted) setState(() {});
    });
  }

  void convertWordToSigns(String text) {
    resultImages.clear();

    if (text.trim().isEmpty) {
      setState(() {});
      return;
    }

    // Split text into words based on spaces
    List<String> words = text.trim().split(RegExp(r'\s+'));

    for (int w = 0; w < words.length; w++) {
      String word = words[w];

      if (selectedLanguage == "en") {
        word = word.toLowerCase();
      }

      // 1. Try to find an image for the whole word
      if (lettersMap.containsKey(word)) {
        resultImages.add(lettersMap[word]!);
      } else {
        // 2. Fallback: split the word into individual letters
        for (int i = 0; i < word.length; i++) {
          String letter = word[i];
          if (lettersMap.containsKey(letter)) {
            resultImages.add(lettersMap[letter]!);
          }
        }
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