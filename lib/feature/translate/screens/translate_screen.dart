import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_colors.dart';
import 'package:freetalk/core/widget/bottom_sheet.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final TextEditingController _textController = TextEditingController();

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
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              // Search Input Field
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Hello',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: AppColors.primary,
                    ),
                    onPressed: () {},
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Sign Language Display
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _textController.text.isEmpty
                              ? 'Enter text'
                              : _textController.text,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: _textController.text.isEmpty
                              ? const Text(
                                  'Sign language images will appear here',
                                  style: TextStyle(color: Colors.grey),
                                )
                              : Image.asset(
                                  'assets/images/sign_language.png',
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Floating Action Button
              Center(
                child: FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  onPressed: () {},
                  child: const Icon(Icons.chat, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomSheet(),
    );
  }
}
