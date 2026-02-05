class Word {
  final String id;
  final String word;
  final String meaning;
  final String? pronunciation;
  final List<String> examples;
  final String? imageUrl;
  final String language;
  final bool isFavorite;

  Word({
    required this.id,
    required this.word,
    required this.meaning,
    this.pronunciation,
    required this.examples,
    this.imageUrl,
    required this.language,
    this.isFavorite = false,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'] ?? '',
      word: json['word'] ?? '',
      meaning: json['meaning'] ?? '',
      pronunciation: json['pronunciation'],
      examples: List<String>.from(json['examples'] ?? []),
      imageUrl: json['imageUrl'],
      language: json['language'] ?? 'ar',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
      'pronunciation': pronunciation,
      'examples': examples,
      'imageUrl': imageUrl,
      'language': language,
      'isFavorite': isFavorite,
    };
  }
}

class DictionaryResponse {
  final String word;
  final List<WordDefinition> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  DictionaryResponse({
    required this.word,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  factory DictionaryResponse.fromJson(Map<String, dynamic> json) {
    return DictionaryResponse(
      word: json['word'] ?? '',
      definitions:
          (json['definitions'] as List?)
              ?.map((e) => WordDefinition.fromJson(e))
              .toList() ??
          [],
      synonyms: List<String>.from(json['synonyms'] ?? []),
      antonyms: List<String>.from(json['antonyms'] ?? []),
    );
  }
}

class WordDefinition {
  final String partOfSpeech;
  final String definition;
  final List<String> examples;

  WordDefinition({
    required this.partOfSpeech,
    required this.definition,
    required this.examples,
  });

  factory WordDefinition.fromJson(Map<String, dynamic> json) {
    return WordDefinition(
      partOfSpeech: json['partOfSpeech'] ?? '',
      definition: json['definition'] ?? '',
      examples: List<String>.from(json['examples'] ?? []),
    );
  }
}
