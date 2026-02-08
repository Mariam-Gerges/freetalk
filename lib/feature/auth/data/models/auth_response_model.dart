

class AuthResponseModel {
  final String token;
  final String email;
  final String name;

  AuthResponseModel([
    this.token = '',
    this.email = '',
    this.name = '',
  ]);

  FactoryauthResponseModelFromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      json['token'] ?? '',
      json['email'] ?? '',
      json['name'] ?? '',
    );
  }
}
