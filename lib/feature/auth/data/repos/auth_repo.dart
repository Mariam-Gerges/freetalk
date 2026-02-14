import 'package:freetalk/core/network/api_error_handler.dart';
import 'package:freetalk/core/network/api_result.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/feature/auth/data/model/login_request_body.dart';
import 'package:freetalk/feature/auth/data/model/login_response.dart';
import 'package:freetalk/feature/auth/data/model/register_request_body.dart';

class AuthRepo {
  final ApiService _apiService;
  AuthRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LoginResponse>> register(
  RegisterRequestBody registerRequestBody,
) async {
  try {
    final response = await _apiService.register(registerRequestBody);
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(ErrorHandler.handle(error));
  }
}
}
