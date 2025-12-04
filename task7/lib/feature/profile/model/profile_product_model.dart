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

  String getFullName() {
    if ((firstName?.isNotEmpty ?? false) || (lastName?.isNotEmpty ?? false)) {
      return "${firstName ?? ''} ${lastName ?? ''}".trim();
    }
    return username;
  }
}
