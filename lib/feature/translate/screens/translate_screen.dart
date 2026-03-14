import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/widget/bottom_sheet.dart';
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

  /// list of images that will appear on screen
  List<String> resultImages = [];

  /// selected language (غيريها حسب اللغة اللي جاية من صفحة الاختيار)
  String selectedLanguage = "en";

  /// get image url from Supabase
  Future<String?> getSignImage(String letter, String language) async {
    final response = await Supabase.instance.client
        .from('sign_letters')
        .select('image_url')
        .eq('letter', letter)
        .eq('language', language)
        .maybeSingle();

    return response?['image_url'];
  }

  /// convert word to sign images
  Future<void> convertWordToSigns(String word) async {
  resultImages.clear();

  print("word: $word");

  for (int i = 0; i < word.length; i++) {
    String letter = word[i].trim().toLowerCase();

    print("letter: $letter");

    String? image = await getSignImage(letter, selectedLanguage);

    print("image: $image");

    if (image != null) {
      resultImages.add(image);
    }
  }

  print("resultImages: $resultImages");

  setState(() {});
}

  /// speech to text
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

      // هنا بعدين ممكن تشغلي AI model
      // recognizeSign(selectedImage!);
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
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Translate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),

              /// text input
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
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      /// camera button
                      IconButton(
                        tooltip: 'Camera input',
                        icon: const Icon(
                          Icons.camera_alt,
                          color: AppColors.primary,
                        ),
                        onPressed: () {
                          pickImageFromCamera();
                        },
                      ),

                      /// mic button
                      IconButton(
                        icon: Icon(
                          isListening ? Icons.mic : Icons.mic_none,
                          color: AppColors.primary,
                        ),
                        onPressed: () {
                          if (isListening) {
                            stopListening();
                          } else {
                            startListening();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// result area
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: _textController.text.isEmpty
                        ? const Text(
                            'Sign language images will appear here',
                            style: TextStyle(color: Colors.grey),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
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

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomSheet(),
    );
  }
}