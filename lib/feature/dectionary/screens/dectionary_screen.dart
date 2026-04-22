import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/widget/bottom_navigation_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DectionaryScreen extends StatefulWidget {
  const DectionaryScreen({super.key});

  @override
  State<DectionaryScreen> createState() => _DectionaryScreenState();
}

class _DectionaryScreenState extends State<DectionaryScreen> {
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
      setState(() {});
    });
  }

  Future<void> convertWordToSigns(String word) async {
    resultImages.clear();

    for (int i = 0; i < word.length; i++) {
      String letter = word[i];

      if (selectedLanguage == "en") {
        letter = letter.toLowerCase();
      }

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
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dictionary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              /// search
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      convertWordToSigns(value);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search word',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// result
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: _searchController.text.isEmpty
                        ? const Text(
                            'Search for a word to see sign images',
                            style: TextStyle(color: Colors.grey),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 10,
                              children: resultImages.map((imageUrl) {
                                return Image.network(
                                  imageUrl,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.contain,
                                );
                              }).toList(),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(initialIndex: 1),
    );
  }
}
