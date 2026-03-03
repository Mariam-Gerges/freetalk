import 'package:freezed_annotation/freezed_annotation.dart';


part 'login_request_body.g.dart';
@JsonSerializable()
class LoginRequestBody {
  
  final String usernameOrEmail;
  final String password;

  LoginRequestBody({required this.usernameOrEmail, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}


