import 'package:freetalk/core/constant/app_constant.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[AppConstant.id] ?? '',
      username: json[AppConstant.username] ?? '',
      email: json[AppConstant.email] ?? '',
      token: json[AppConstant.token] ?? '',
    );
  }
}
