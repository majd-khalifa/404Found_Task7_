class SignupResponse {
  final int id;
  final String username;
  final String email;
  final String token;

  SignupResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      token: json['token'],
    );
  }
}
