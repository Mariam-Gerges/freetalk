import '../model/user_model.dart';
import '../../../core/network/api_service.dart';

class AuthRepo {
  final ApiService apiService;
  AuthRepo(this.apiService);

  Future<UserModel> login(
    String email,
    String password,
  ) async {
    final response = await apiService.dio.post(
      'Auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return UserModel.fromJson(response.data);
  }
}
