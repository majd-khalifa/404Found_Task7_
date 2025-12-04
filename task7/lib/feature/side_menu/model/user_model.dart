class User {
  final int id;
  final String username;
  final String email;
  final String image;
  final String? firstName;
  final String? lastName;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      image:
          json['image'] ??
          'https://ui-avatars.com/api/?name=${json['username'] ?? 'User'}',
      firstName: json['firstName'] ?? json['name']?['firstname'],
      lastName: json['lastName'] ?? json['name']?['lastname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'image': image,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? image,
    String? firstName,
    String? lastName,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      image: image ?? this.image,
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
