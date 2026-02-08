//import 'package:bloc/bloc.dart';
//import 'package:dio/dio.dart';
//import 'package:freetalk/feature/auth/data/repos/auth_repo.dart';
//import 'package:freetalk/feature/auth/logic/auth_cubit_state.dart';


/*class AuthCubitCubit extends Cubit<AuthCubitState> {
  final AuthRepo _authRepo;
  AuthCubitCubit(this._authRepo) : super(const AuthCubitState.initial());
  void emitauthState(AuthRequest authRequest) async{
    emit(const AuthCubitState.loading());
    final response = await _authRepo.auth(authRequest);
    response.when(
      success: (authresponce) => emit(AuthCubitState.success(authresponce)),
      failure: (error) => emit(AuthCubitState.error(error: error.apiErrorModel.message??'')),
    );
  }
}*/
