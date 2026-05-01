import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/widget/bottom_navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final TextEditingController _textController = TextEditingController();

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
      globalSelectedLanguage =
          selectedLanguage; // حفظ اللغة المختارة على مستوى التطبيق
    } else {
      selectedLanguage =
          globalSelectedLanguage; // استرجاع اللغة في المرات القادمة
    }

    loadLetters();
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

  late SpeechToText speech;
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    initSpeechtotext();
  }

  Future<void> initSpeechtotext() async {
    speech = SpeechToText();
    bool available = await speech.initialize();

    if (!available) {
      setState(() {
        isListening = false;
      });
    }
  }

  void startListening() async {
    bool available = await speech.initialize();

    if (available) {
      setState(() {
        isListening = true;
      });

      speech.listen(
        onResult: (result) {
          setState(() {
            _textController.text = result.recognizedWords;

            _textController.selection = TextSelection.fromPosition(
              TextPosition(offset: _textController.text.length),
            );
          });

          convertWordToSigns(_textController.text);
        },
      );
    }
  }

  void stopListening() {
    if (isListening) {
      speech.stop();

      setState(() {
        isListening = false;
      });
    }
  }

  /// camera
  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImageFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });

      // AI model بعدين
    }
  }

  @override
  void dispose() {
    _textController.dispose();
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
                'Translate',
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge?.color ??
                      Theme.of(context).colorScheme.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              /// input
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          onChanged: (value) {
                            convertWordToSigns(value);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Type or speak to translate',
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: pickImageFromCamera,
                      ),

                      IconButton(
                        icon: Icon(
                          isListening ? Icons.mic : Icons.mic_none,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          isListening ? stopListening() : startListening();
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// result
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: _textController.text.isEmpty
                        ? Text(
                            'Sign language images will appear here',
                            style: TextStyle(color: Theme.of(context).hintColor),
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
      bottomNavigationBar: const CustomBottomNavigationBar(initialIndex: 0),
    );
  }
}
