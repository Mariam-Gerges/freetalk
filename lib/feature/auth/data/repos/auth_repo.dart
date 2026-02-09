import 'package:freetalk/core/network/api_error_handler.dart';
import 'package:freetalk/core/network/api_result.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/feature/auth/data/model/login_response.dart';

class AuthRepo {
  final ApiService apiService;
  AuthRepo(this.apiService);
}

Future<ApiResult<LoginResponse>> auth(LoginResponse authresponceModel) async {
  try {
    // final response = await apiService.login(authresponceModel);
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(ErrorHandler.handle(error) as String);
  }
}
