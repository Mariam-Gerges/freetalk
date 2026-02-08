/*import 'package:dio/dio.dart';
import 'package:freetalk/feature/auth/data/repos/auth_repo.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
Future<void> setupgetit() async {
  //dio & api service
  Dio dio = await DioFactory.getDio();
  getit.registerSingleton<ApiService>(() => ApiService(dio));
  //auth
  getit.registerFactory<AuthRepo>(() => AuthRepo(getit()));
  getit.registerFactory<AuthCubitCubit>(() => AuthCubitCubit(getit()));

  //other repos and cubits
}*/
