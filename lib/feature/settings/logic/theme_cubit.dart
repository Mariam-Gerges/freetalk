import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/core/network/secure_storage.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDarkMode = await SecureStorage.getTheme();
    emit(isDarkMode);
  }

  Future<void> toggleTheme() async {
    final newValue = !state;
    await SecureStorage.saveTheme(newValue);
    emit(newValue);
  }

  Future<void> setTheme(bool isDarkMode) async {
    await SecureStorage.saveTheme(isDarkMode);
    emit(isDarkMode);
  }
}