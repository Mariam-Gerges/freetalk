import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? token;
  @JsonKey(name: 'user') UserData? user;
  String? message;

  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

class UserData {
  int? id;
  @JsonKey(name: 'username')
  String? userName;
  String? email;
  DateTime? createdAt;

  UserData({this.userName, this.email, this.createdAt, this.id});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}


/*

{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEwMDgiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoic3RkZHJpbmciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ1c2VkZHJAZXhhbXBsZS5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwianRpIjoiNzBkYzViNGItMzRmNi00NzRhLTg3MDAtNmE1OGJlNmI5NzBiIiwiZXhwIjoxNzcxNjIyOTczLCJpc3MiOiJTaWduTGFuZ3VhZ2VBUEkiLCJhdWQiOiJTaWduTGFuZ3VhZ2VDbGllbnQifQ.Q8VK8CwxzKPxtE066LxvvsEWYjY88yD1eqXd2FZtr0s",
  "user": {
    "id": 1008,
    "username": "stddring",
    "email": "useddr@example.com",
    "createdAt": "2026-02-13T21:16:56.2605273"
  },
  "message": "Login successful"
}

 */