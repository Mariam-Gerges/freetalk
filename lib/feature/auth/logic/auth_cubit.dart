import 'package:bloc/bloc.dart';
import 'package:freetalk/core/network/api_result.dart';
import 'package:freetalk/feature/auth/data/model/login_request_body.dart';
import 'package:freetalk/feature/auth/data/repos/auth_repo.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthCubitState.initial());

  void emitauthstate(LoginRequestBody loginRequestBody) async {
    emit(const AuthCubitState.loading());
    final Response = await authRepo.login(loginRequestBody);

    Response.when(
      success: (response) {
        emit(AuthCubitState.success(response));
      },
      failure: (errorhandler) {
        emit(AuthCubitState.failure(errorhandler));
      },
    );
  }
}
