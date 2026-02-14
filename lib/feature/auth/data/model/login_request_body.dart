import 'package:freezed_annotation/freezed_annotation.dart';


part 'login_request_body.g.dart';
@JsonSerializable()
class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
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