import 'package:freetalk/core/network/api_endpoints.dart';
import 'package:freetalk/core/network/api_service.dart';
import 'package:freetalk/data/model/auth_model.dart';

class AccountRepository {
  final ApiService apiService;

  AccountRepository(this.apiService);

  // ========== Get User Profile ==========
  Future<UserData> getUserProfile() async {
    final user = await apiService.get<UserData>(
      endpoint: ApiEndpoints.userProfile,
      fromJson: (json) => UserData.fromJson(json),
    );

    return user;
  }

  // ========== Update Profile ==========
  Future<UserData> updateProfile({
    String? name,
    String? phoneNumber,
    String? profileImage,
    String? preferredLanguage,
  }) async {
    final user = await apiService.put<UserData>(
      endpoint: ApiEndpoints.updateProfile,
      data: {
        if (name != null) 'name': name,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (profileImage != null) 'profileImage': profileImage,
        if (preferredLanguage != null) 'preferredLanguage': preferredLanguage,
      },
      fromJson: (json) => UserData.fromJson(json),
    );

    return user;
  }

  // ========== Change Password ==========
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await apiService.post<Map<String, dynamic>>(
      endpoint: ApiEndpoints.changePassword,
      data: {'oldPassword': oldPassword, 'newPassword': newPassword},
      fromJson: (json) => json,
    );
  }

  // ========== Delete Account ==========
  Future<void> deleteAccount() async {
    await apiService.delete<Map<String, dynamic>>(
      endpoint: ApiEndpoints.deleteAccount,
      fromJson: (json) => json,
    );
  }
}
