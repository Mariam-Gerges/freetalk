import 'package:freetalk/feature/sign_language/data/model/sign_model.dart';

import 'signs_remote_data_source.dart';

class SignsRepository {
  final SignsRemoteDataSource _remote;

  SignsRepository(this._remote);

  Future<List<SignModel>> getSigns() async {
    final data = await _remote.fetchSigns();

    return data.map((e) => SignModel.fromJson(e)).toList();
  }
}