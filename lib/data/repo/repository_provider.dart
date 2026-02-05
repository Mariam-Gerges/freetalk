import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/data/repo/account_repository.dart';
import 'package:freetalk/data/repo/auth_repository.dart';
import 'package:freetalk/data/repo/chat_repository.dart';
import 'package:freetalk/data/repo/dictionary_repository.dart';
import 'package:freetalk/data/repo/translate_repository.dart';

class RepositoryProvider {
  static final RepositoryProvider _instance = RepositoryProvider._internal();
  late ApiService _apiService;

  factory RepositoryProvider() {
    return _instance;
  }

  RepositoryProvider._internal() {
    _apiService = ApiService();
  }

  // ========== Repositories ==========
  AuthRepository get authRepository => AuthRepository(_apiService);
  ChatRepository get chatRepository => ChatRepository(_apiService);
  TranslateRepository get translateRepository =>
      TranslateRepository(_apiService);
  DictionaryRepository get dictionaryRepository =>
      DictionaryRepository(_apiService);
  AccountRepository get accountRepository => AccountRepository(_apiService);

  // ========== API Service ==========
  ApiService get apiService => _apiService;
}

// استخدم هكذا في أي مكان بالتطبيق:
// final authRepo = RepositoryProvider().authRepository;
