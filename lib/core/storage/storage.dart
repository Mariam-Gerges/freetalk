import 'dart:io';

import 'package:freetalk/core/network/supabase_client.dart';

Future<String> uploadImage(File file, String fileName) async {
  final client = SupabaseClientService.client;

  await client.storage
      .from('sign-images')
      .upload(fileName, file);

  final imageUrl = client.storage
      .from('sign-images')
      .getPublicUrl(fileName);

  return imageUrl;
}