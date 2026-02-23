import 'package:flutter/material.dart';
import 'package:freetalk/core/di/ingiction.dart';
import 'package:freetalk/core/network/supabase_client.dart';
import 'package:freetalk/core/routing/app_router.dart';
import 'package:freetalk/free_talk.dart';

void main() async {
  setupgetit();
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseClientService.init();
  runApp(FreeTalk(appRouter: AppRouter()));
}
