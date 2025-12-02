class LoginResponse {
  final int id;
  final String username;
  final String token;

  LoginResponse({
    required this.id,
    required this.username,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
      username: json['username'],
      token: json['accessToken'],
    );
  }
}
