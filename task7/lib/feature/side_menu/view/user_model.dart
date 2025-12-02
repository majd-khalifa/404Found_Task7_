// 
class User {
  int id;
  String username;
  String email;
  String password;
  String avatar;
  String? firstName;
  String? lastName;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.avatar,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: '', 
      
      avatar: 'https://i.pravatar.cc/150?img=${json['id'] ?? 1}',
      firstName: json['name']?['firstname'],
      lastName: json['name']?['lastname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? avatar,
    String? firstName,
    String? lastName,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  String getFullName() {
    if ((firstName?.isNotEmpty ?? false) || (lastName?.isNotEmpty ?? false)) {
      return "${firstName ?? ''} ${lastName ?? ''}".trim();
    }
    return username;
  }
}
