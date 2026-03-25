import 'package:dio/dio.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/core/network/dio_factory.dart';
import 'package:freetalk/feature/account/data/repo/profile_repo.dart';
import 'package:freetalk/feature/account/logic/cubit/profile_cubit.dart';
import 'package:freetalk/feature/auth/data/repos/auth_repo.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';
final getit = GetIt.instance;
Future<void> setupgetit() async {
  //dio & api service
  Dio dio = DioFactory.createDio();
  getit.registerLazySingleton<ApiService>(() => ApiService(dio));
  //auth
  getit.registerLazySingleton<AuthRepo>(() => AuthRepo(getit()));

  getit.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(getit<ApiService>()),
  );
  getit.registerLazySingleton<AuthCubit>(() => AuthCubit(getit()));
  getit.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getit()));

  //other repos and cubits
}
