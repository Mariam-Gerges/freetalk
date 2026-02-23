import '../../../../core/network/supabase_client.dart';

class SignsRemoteDataSource {
  final _client = SupabaseClientService.client;

  Future<List<Map<String, dynamic>>> fetchSigns() async {
    final response = await _client
        .from('signs')
        .select();

    return List<Map<String, dynamic>>.from(response);
  }
}