import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/feature/account/data/repo/profile_repo.dart';
import 'package:freetalk/feature/account/logic/cubit/profile_state.dart';
import 'package:dio/dio.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repo;

  ProfileCubit(this.repo) : super(const ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    try {
      final user = await repo.getProfile();
      emit(ProfileState.success(user));
    } catch (e) {
      emit(ProfileState.error(_handleError(e)));
    }
  }

  String _handleError(dynamic error) {
    if (error is DioException) {
      final response = error.response;
      if (response != null && response.data != null) {
        final data = response.data;
        if (data is Map) {
          final message = data["message"];
          if (message is String) return message;
          if (message is List) return message.first.toString();
        }
      }
      return "حدث خطأ في الاتصال بالخادم";
    }
    return "حدث خطأ غير متوقع";
  }
}
