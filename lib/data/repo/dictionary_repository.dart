import 'package:freetalk/core/network/api_endpoints.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/data/model/dictionary_model.dart';

class DictionaryRepository {
  final ApiService apiService;

  DictionaryRepository(this.apiService);

  // ========== Search Word ==========
  Future<DictionaryResponse> searchWord(String word) async {
    final response = await apiService.get<DictionaryResponse>(
      endpoint: ApiEndpoints.searchWord,
      queryParams: {'word': word},
      fromJson: (json) => DictionaryResponse.fromJson(json),
    );

    return response;
  }

  // ========== Get Word Details ==========
  Future<Word> getWordDetails(String wordId) async {
    final word = await apiService.get<Word>(
      endpoint: '${ApiEndpoints.getWordDetails}/$wordId',
      fromJson: (json) => Word.fromJson(json),
    );

    return word;
  }

  // ========== Get Favorite Words ==========
  Future<List<Word>> getFavoriteWords({int page = 1, int limit = 50}) async {
    final words = await apiService.get<List<Word>>(
      endpoint: ApiEndpoints.getFavoriteWords,
      queryParams: {'page': page, 'limit': limit},
      fromJson: (json) {
        if (json is List) {
          return json.map((e) => Word.fromJson(e)).toList();
        }
        return [];
      },
    );

    return words;
  }

  // ========== Add to Favorites ==========
  Future<void> addToFavorites(String wordId) async {
    await apiService.post<Map<String, dynamic>>(
      endpoint: ApiEndpoints.addToFavorites,
      data: {'wordId': wordId},
      fromJson: (json) => json,
    );
  }

  // ========== Remove from Favorites ==========
  Future<void> removeFromFavorites(String wordId) async {
    await apiService.delete<Map<String, dynamic>>(
      endpoint: '${ApiEndpoints.removeFromFavorites}/$wordId',
      fromJson: (json) => json,
    );
  }
}
