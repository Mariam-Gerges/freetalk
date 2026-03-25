import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/feature/account/data/model/profile_model.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository(this.apiService);


  Future<ProfileModel> getProfile() => apiService.getProfile();

}
