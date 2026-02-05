class ApiEndpoints {
  // ========== Auth Endpoints ==========
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String logout = 'auth/logout';
  static const String refreshToken = 'auth/refresh-token';
  static const String verifyOtp = 'auth/verify-otp';
  static const String sendOtp = 'auth/send-otp';

  // ========== User/Account Endpoints ==========
  static const String userProfile = 'account/profile';
  static const String updateProfile = 'account/profile/update';
  static const String changePassword = 'account/change-password';
  static const String deleteAccount = 'account/delete';

  // ========== Chat Endpoints ==========
  static const String chatHistory = 'chat/history';
  static const String sendMessage = 'chat/send';
  static const String deleteMessage = 'chat/message/delete';
  static const String editMessage = 'chat/message/edit';
  static const String getChatConversations = 'chat/conversations';

  // ========== Translate Endpoints ==========
  static const String translate = 'translate';
  static const String getSupportedLanguages = 'translate/languages';
  static const String getTranslationHistory = 'translate/history';

  // ========== Dictionary Endpoints ==========
  static const String searchWord = 'dictionary/search';
  static const String getWordDetails = 'dictionary/word';
  static const String getFavoriteWords = 'dictionary/favorites';
  static const String addToFavorites = 'dictionary/favorites/add';
  static const String removeFromFavorites = 'dictionary/favorites/remove';

  // ========== Settings Endpoints ==========
  static const String getUserSettings = 'settings';
  static const String updateSettings = 'settings/update';
  static const String getSupportedLanguagesList = 'settings/languages';
}
