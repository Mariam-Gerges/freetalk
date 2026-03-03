import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freetalk/core/di/ingiction.dart';
import 'package:freetalk/core/network/supabase_client.dart';
import 'package:freetalk/core/routing/app_router.dart';
import 'package:freetalk/feature/auth/logic/auth_cubit.dart';
import 'package:freetalk/free_talk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupgetit();
  await SupabaseClientService.init();

  runApp(
    BlocProvider(
      create: (_) => getit<AuthCubit>(),
      child: FreeTalk(
        appRouter: AppRouter(),
      ),
    ),
  );
}