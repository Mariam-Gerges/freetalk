import 'package:bloc/bloc.dart';
import 'package:freetalk/core/network/api_result.dart';
import 'package:freetalk/feature/auth/data/model/login_response.dart';
import 'package:freetalk/feature/auth/data/repos/auth_repo.dart';
import 'package:freetalk/feature/auth/data/repos/auth_repo.dart' as _authRepo;
import 'package:freetalk/feature/auth/logic/auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super( AuthCubitState.initial());

  void emitauthstate(LoginResponse authrequestbody) async {
    emit(const AuthCubitState.loading());
    final Response = await _authRepo.auth(authrequestbody);

    Response.when(success: (response) {
      emit(AuthCubitState.success(response));
    }, failure: (error) {
      emit(AuthCubitState.error(error: error));
    });

  

  }
}
