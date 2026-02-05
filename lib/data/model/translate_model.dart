class TranslateRequest {
  final String text;
  final String sourceLanguage;
  final String targetLanguage;

  TranslateRequest({
    required this.text,
    required this.sourceLanguage,
    required this.targetLanguage,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'sourceLanguage': sourceLanguage,
      'targetLanguage': targetLanguage,
    };
  }
}

class TranslateResponse {
  final String originalText;
  final String translatedText;
  final String sourceLanguage;
  final String targetLanguage;
  final DateTime translatedAt;

  TranslateResponse({
    required this.originalText,
    required this.translatedText,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.translatedAt,
  });

  factory TranslateResponse.fromJson(Map<String, dynamic> json) {
    return TranslateResponse(
      originalText: json['originalText'] ?? '',
      translatedText: json['translatedText'] ?? '',
      sourceLanguage: json['sourceLanguage'] ?? '',
      targetLanguage: json['targetLanguage'] ?? '',
      translatedAt:
          DateTime.tryParse(json['translatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}

class Language {
  final String code;
  final String name;
  final String? flag;

  Language({required this.code, required this.name, this.flag});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      flag: json['flag'],
    );
  }
}
