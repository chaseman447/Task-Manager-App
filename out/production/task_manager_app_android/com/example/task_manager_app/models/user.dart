import 'dart:convert';

class User {
  final String name;
  final String username;
  final String password;

  const User({
    required this.name,
    required this.username,
    this.password = '', // Optional password field
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'username': username,
    'password': password, // Only include password if it's not empty
  };

  @override
  String toString() => 'User(name: $name, username: $username, password: $password)';
}

// Extension methods for easy conversion between JSON and User objects
extension UserExtensions on User {
  static User fromJson(String jsonString) {
    return User.fromJson(json.decode(jsonString));
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}