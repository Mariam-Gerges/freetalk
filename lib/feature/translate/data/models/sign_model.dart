class SignModel {
  final int? id;
  final String? imageUrl;
  final String? language;
  final String? letter;

  SignModel({
    this.id,
    this.imageUrl,
    this.language,
    this.letter,
  });

  factory SignModel.fromJson(Map<String, dynamic> json) {
    return SignModel(
      id: json['id'] as int?,
      imageUrl: json['image_url'] as String?,
      language: json['language'] as String?,
      // We use trim() here to clean up trailing spaces/newlines like "s\n" or "c\n" or " 1" 
      // from the Supabase response, so it correctly matches user input!
      letter: json['letter']?.toString().trim(),
    );
  }
}
