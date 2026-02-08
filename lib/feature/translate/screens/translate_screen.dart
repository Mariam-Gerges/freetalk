import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/widget/bottom_sheet.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final TextEditingController _textController = TextEditingController();
  // late stt.SpeechToText _speech;
  bool isListening = false;
  // String _lastWords = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }



  // void _startListening() async {
  //   bool available = await _speech.initialize();
  //   if (!available) return;
  //   setState(() => _isListening = true);
  //   _speech.listen(
  //     onResult: (val) {
  //       setState(() {
  //         _lastWords = val.recognizedWords;
  //         _textController.text = _lastWords;
  //       });
  //     },
  //   );
  // }

  // void _stopListening() {
  //   _speech.stop();
  //   setState(() => _isListening = false);
  // }

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

                          decoration: InputDecoration(
                            hintText: 'Type or speak to translate',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Camera input',
                        icon: const Icon(
                          Icons.camera_alt,
                          color: AppColors.primary,
                        ),
                        onPressed: () {},
                      ),
                      GestureDetector(
                        // onLongPress: _startListening,
                        // onLongPressUp: _stopListening,
                        child: IconButton(
                          icon: Icon(
                            isListening ? Icons.mic : Icons.mic_none,
                            color: AppColors.primary,
                          ),
                          onPressed: () {
                            // if (_isListening) {
                            //   _stopListening();
                            // } else {
                            //   _startListening();
                            // }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Sign Language / Result Display
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.all(16.0)),
                      Expanded(
                        child: Center(
                          child: _textController.text.isEmpty
                              ? const Text(
                                  'Sign language images will appear here',
                                  style: TextStyle(color: Colors.grey),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    _textController.text,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                        ),
                      ),
                    ],
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
