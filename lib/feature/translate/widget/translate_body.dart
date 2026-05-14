import 'package:flutter/material.dart';
import 'package:freetalk/core/widget/bottom_navigation_bar.dart';
import 'package:freetalk/feature/translate/logic/translate_controller.dart';
import 'translate_input.dart';
import 'translate_result.dart';

class TranslateBody extends StatefulWidget {
  const TranslateBody({super.key});

  @override
  State<TranslateBody> createState() => _TranslateBodyState();
}

class _TranslateBodyState extends State<TranslateBody> {
  final TextEditingController _textController = TextEditingController();
  final TranslateController controllerLogic = TranslateController();

  List<String> resultImages = [];

  @override
  void initState() {
    super.initState();
    controllerLogic.initSpeech();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as String?;
    controllerLogic.setLanguage(args);

    controllerLogic.loadLetters().then((_) {
      setState(() {});
    });
  }

  void convertWordToSigns(String word) {
    setState(() {
      resultImages = controllerLogic.convert(word);
    });
  }

  void startListening() {
    controllerLogic.startListening((text) {
      setState(() {
        _textController.text = text;
        resultImages = controllerLogic.convert(text);
      });
    });
  }

  void stopListening() {
    controllerLogic.stopListening();
    setState(() {});
  }

  void pickImageFromCamera() async {

  await controllerLogic.pickImage();

  setState(() {

    _textController.text =
        controllerLogic.detectedText;

    resultImages = controllerLogic.convert(
      controllerLogic.detectedText,
    );
  });
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Translate', style: Theme.of(context).textTheme.titleLarge),

              const SizedBox(height: 8),

              TranslateInput(
                controller: _textController,
                isListening: controllerLogic.isListening,
                onChanged: convertWordToSigns,
                onMicTap: () =>
                    controllerLogic.isListening ? stopListening() : startListening(),
                onCameraTap: pickImageFromCamera,
              ),

              const SizedBox(height: 20),

              TranslateResult(
                controller: _textController,
                resultImages: resultImages,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar:
          const CustomBottomNavigationBar(initialIndex: 0),
    );
  }
}