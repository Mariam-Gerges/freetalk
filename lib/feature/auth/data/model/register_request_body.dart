import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String username;
  final String email;
  final String password;
  final String confirmPassword; 

  RegisterRequestBody({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}

// {
//   "username": "string",
//   "email": "user@example.com",
//   "password": "string",
//   "confirmPassword": "string"
// }