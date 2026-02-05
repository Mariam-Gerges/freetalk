import 'package:freetalk/core/network/api_endpoints.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/data/model/translate_model.dart';

class TranslateRepository {
  final ApiService apiService;

  TranslateRepository(this.apiService);

  // ========== Translate Text ==========
  Future<TranslateResponse> translateText({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
  }) async {
    final response = await apiService.post<TranslateResponse>(
      endpoint: ApiEndpoints.translate,
      data: TranslateRequest(
        text: text,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
      ).toJson(),
      fromJson: (json) => TranslateResponse.fromJson(json),
    );

    return response;
  }

  // ========== Get Supported Languages ==========
  Future<List<Language>> getSupportedLanguages() async {
    final languages = await apiService.get<List<Language>>(
      endpoint: ApiEndpoints.getSupportedLanguages,
      fromJson: (json) {
        if (json is List) {
          return json.map((e) => Language.fromJson(e)).toList();
        }
        return [];
      },
    );

    return languages;
  }

  // ========== Get Translation History ==========
  Future<List<TranslateResponse>> getTranslationHistory({
    int page = 1,
    int limit = 20,
  }) async {
    final history = await apiService.get<List<TranslateResponse>>(
      endpoint: ApiEndpoints.getTranslationHistory,
      queryParams: {'page': page, 'limit': limit},
      fromJson: (json) {
        if (json is List) {
          return json.map((e) => TranslateResponse.fromJson(e)).toList();
        }
        return [];
      },
    );

    return history;
  }
}
