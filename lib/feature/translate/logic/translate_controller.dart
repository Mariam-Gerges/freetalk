import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:freetalk/feature/translate/data/models/sign_model.dart';
import 'dart:developer';

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
      final sign = SignModel.fromJson(item);
      if (sign.letter != null && sign.letter!.isNotEmpty && sign.imageUrl != null) {
        lettersMap[sign.letter!] = sign.imageUrl!;
      }
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
  List<String> convert(String text) {
    log("==================================================");
    log("=> Start translating text to sign language images");
    log("=> Original Text: '$text'");
    
    resultImages.clear();

    if (text.trim().isEmpty) {
      return resultImages;
    }

    // Split the input text into words
    List<String> words = text.trim().split(RegExp(r'\s+'));

    for (int w = 0; w < words.length; w++) {
      String word = words[w];

      if (selectedLanguage == "en") {
        word = word.toLowerCase();
      }

      log("=> Processing word [${w + 1}/${words.length}]: '$word'");

      // 1. Try to find an image for the whole word (e.g., 'hi', 'bathroom')
      if (lettersMap.containsKey(word)) {
        resultImages.add(lettersMap[word]!);
        log("   -> Match found! Added image for whole word '$word'");
      } else {
        log("   -> Whole word '$word' not found. Splitting into individual letters.");
        
        // 2. Fallback: split the word into individual letters
        for (int i = 0; i < word.length; i++) {
          String letter = word[i];

          if (lettersMap.containsKey(letter)) {
            resultImages.add(lettersMap[letter]!);
            log("      -> Match found! Added image for letter '$letter'");
          } else {
            log("      -> No sign language image found for character: '$letter'");
          }
        }
      }
    }
    
    log("=> Finished converting. Total images generated: ${resultImages.length}");
    log("==================================================");

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
  log("==================================================");
  log("=> Starting image upload process...");
  log("=> Image path: ${imageFile.path}");

  try {
    String apiUrl;

    if (selectedLanguage == "en") {
      apiUrl = 'https://you-sef-sign-api.hf.space/predict/arabic';
    } else {
      apiUrl = 'https://you-sef-sign-api.hf.space/predict/english';
    }

    log("=> Selected Language: $selectedLanguage");
    log("=> API URL: $apiUrl");

    final uri = Uri.parse(apiUrl);
    var request = http.MultipartRequest('POST', uri);

    // Extract file extension dynamically
    String extension = imageFile.path.split('.').last.toLowerCase();
    String mimeType = 'jpeg'; // default
    if (['png', 'jpg', 'jpeg', 'webp', 'gif', 'bmp'].contains(extension)) {
      mimeType = extension == 'jpg' ? 'jpeg' : extension;
    }
    
    log("=> Detected image format: $extension (MIME type: image/$mimeType)");

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType: MediaType('image', mimeType),
      ),
    );

    log("=> Sending request to API...");
    var response = await request.send();
    log("=> Received response with status code: ${response.statusCode}");

    final responseBody = await response.stream.bytesToString();
    log("=> Response body: $responseBody");

    if (response.statusCode == 200) {
      final data = jsonDecode(responseBody);
      final prediction = data['prediction'];

      if (prediction is String) {
        detectedText = prediction;
      } else if (prediction is Map) {
        detectedText = prediction['label'].toString();
      } else {
        detectedText = prediction.toString();
      }

      log("=> Successfully detected text: $detectedText");
    } else {
      log("=> Error: Failed to predict text. Server returned ${response.statusCode}");
      detectedText = 'Error';
    }
  } catch (e) {
    log("=> Exception occurred while sending image: $e");
    detectedText = 'Error';
  }
  
  log("==================================================");
}
}