import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freetalk/core/di/ingiction.dart';
import 'package:freetalk/core/network/supabase_client.dart';
import 'package:freetalk/core/routing/app_router.dart';
import 'package:freetalk/feature/account/logic/cubit/profile_cubit.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit.dart';
import 'package:freetalk/feature/settings/logic/theme_cubit.dart';
import 'package:freetalk/free_talk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupgetit();
  await SupabaseClientService.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(create: (_) => getit<AuthCubit>()),
            BlocProvider<ProfileCubit>(create: (_) => getit<ProfileCubit>()),
            BlocProvider<ThemeCubit>(create: (_) => getit<ThemeCubit>()),
          ],
          child: FreeTalk(appRouter: AppRouter()),
        );
      },
    ),
  );
}
