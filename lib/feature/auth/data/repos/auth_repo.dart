/*class AuthRepo {
  final ApiService _apiService;

  AuthRepo(this._apiService);

  Future<ApiRESULT<AuthUser>> login(LoginRequestBody body) async {
    try {
      final response = await _apiService.login(body);
      return ApiRESULT.success(response);
    } catch (error) {
      return ApiRESULT.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiRESULT<AuthUser>> signup(SignupRequestBody body) async {
    try {
      final response = await _apiService.signup(body);
      return ApiRESULT.success(response);
    } catch (error) {
      return ApiRESULT.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiRESULT<void>> forgotPassword(ForgotPasswordRequestBody body) async {
    try {
      await _apiService.forgotPassword(body);
      return const ApiRESULT.success(null);
    } catch (error) {
      return ApiRESULT.failure(ErrorHandler.handle(error));
    }
  }
}*/



