import 'package:bloc/bloc.dart';
import 'package:freetalk/core/network/api_result.dart';
import 'package:freetalk/feature/auth/data/model/login_request_body.dart';
import 'package:freetalk/feature/auth/data/model/register_request_body.dart';
import 'package:freetalk/feature/auth/data/repos/auth_repo.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit_state.dart';
import 'package:freetalk/core/network/secure_storage.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(const AuthCubitState.initial());

  /// Login with email and password
  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const AuthCubitState.loading());
    final response = await authRepo.login(loginRequestBody);

    response.when(
      success: (response) async {
        if (response.token != null) {
          await SecureStorage.saveToken(response.token!);
        }
        emit(AuthCubitState.success(response));
      },
      failure: (errorHandler) {
        emit(AuthCubitState.failure(errorHandler));
      },
    );
  }

  /// Register with email and password
Future<void> register(RegisterRequestBody registerRequestBody) async {
  emit(const AuthCubitState.loading());
  final response = await authRepo.register(registerRequestBody);

  response.when(
    success: (response) async {
      if (response.token != null) {
        await SecureStorage.saveToken(response.token!);
      }
      emit(AuthCubitState.success(response));
    },
    failure: (errorHandler) {
      emit(AuthCubitState.failure(errorHandler));
    },
  );
}

  /// Keep old method name for backward compatibility
  // void emitauthstate(LoginRequestBody loginRequestBody) {
  //   login(loginRequestBody);
  // }
}
