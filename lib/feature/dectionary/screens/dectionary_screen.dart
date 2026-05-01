import 'package:flutter/material.dart';
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

  /// تحميل الحروف من Supabase
  Future<void> loadLetters() async {
    final response = await Supabase.instance.client
        .from('sign_letters')
        .select()
        .eq('language', selectedLanguage);

    lettersMap.clear();

    for (var item in response) {
      lettersMap[item['letter']] = item['image_url'];
    }

    print("Loaded letters: $lettersMap"); // DEBUG
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

    /// مهم جدًا: نستنى الداتا قبل ما نستخدمها
    loadLetters().then((_) {
      setState(() {});
    });
  }

  /// تحويل الكلمة لصور
  void convertWordToSigns(String word) {
    resultImages.clear();

    for (int i = 0; i < word.length; i++) {
      String letter = word[i];

      // lowercase للإنجليزي
      if (selectedLanguage == "en") {
        letter = letter.toLowerCase();
      }

      // تجاهل المسافات
      if (letter.trim().isEmpty) continue;

      if (lettersMap.containsKey(letter)) {
        resultImages.add(lettersMap[letter]!);
      } else {
        print("❌ Not found: $letter"); // DEBUG
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
              Text(
                'Dictionary',
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge?.color ??
                      Theme.of(context).colorScheme.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              /// SEARCH
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _searchController,
                    onChanged: convertWordToSigns, // نفس translate
                    decoration: const InputDecoration(
                      hintText: 'Search word',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// RESULT
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: _searchController.text.isEmpty
                        ? Text(
                            'Sign language images will appear here',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                            ),
                          )
                        : resultImages.isEmpty
                            ? Text(
                                'No signs found',
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                ),
                              )
                            : Padding(
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
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.error);
                                        },
                                      ),
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