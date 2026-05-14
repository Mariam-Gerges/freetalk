import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TranslateController {
  List<String> resultImages = [];
  Map<String, String> lettersMap = {};

  static String globalSelectedLanguage = "ar";
  String selectedLanguage = globalSelectedLanguage;

  late SpeechToText speech;
  bool isListening = false;

  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  String detectedText = '';

  /// init speech
  Future<void> initSpeech() async {
    speech = SpeechToText();
    await speech.initialize();
  }

  /// load from supabase
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

  /// language
  void setLanguage(String? args) {
    if (args != null) {
      selectedLanguage = args;
      globalSelectedLanguage = args;
    } else {
      selectedLanguage = globalSelectedLanguage;
    }
  }

  /// convert text → images
  List<String> convert(String word) {
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

    return resultImages;
  }

  /// speech
  Future<void> startListening(Function(String) onResult) async {
    bool available = await speech.initialize();

    if (available) {
      isListening = true;

      speech.listen(
        onResult: (result) {
          onResult(result.recognizedWords);
        },
      );
    }
  }

  void stopListening() {
    speech.stop();
    isListening = false;
  }

  /// camera
  Future<File?> pickImage() async {

  final image = await picker.pickImage(
    source: ImageSource.camera,
  );

  if (image != null) {

    selectedImage = File(image.path);

    await sendImageToApi(selectedImage!);
  }

  return selectedImage;
}
Future<void> sendImageToApi(File imageFile) async {

String apiUrl;

if (selectedLanguage == "ar") {

  apiUrl =
      'https://you-sef-sign-api.hf.space/predict/arabic';

} else {

  apiUrl =
      'https://you-sef-sign-api.hf.space/predict/english';
}

final uri = Uri.parse(apiUrl);

  var request = http.MultipartRequest(
    'POST',
    uri,
  );

  request.files.add(
   await http.MultipartFile.fromPath(
  'file',
  imageFile.path,
  contentType: http.MediaType('image', 'jpeg'),

    ),
  );

  var response = await request.send();

  if (response.statusCode == 200) {

    final responseBody =
        await response.stream.bytesToString();

    final data = jsonDecode(responseBody);

    final prediction = data['prediction'];

if (prediction is String) {
  detectedText = prediction;
} else if (prediction is Map) {
  detectedText = prediction['label'].toString();
}

    print(detectedText);

  }  else {

  print(response.statusCode);

  final responseBody =
      await response.stream.bytesToString();

  print(responseBody);

  detectedText = 'Error';

}
}
}