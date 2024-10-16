import 'dart:convert';

class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String accessToken;
  final String refreshToken;
  final String password; // Optional password field

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
    this.password = '', // Optional password field
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? '',
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'gender': gender,
    'image': image,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'password': password, // Only include password if it's not empty
  };


  @override
  String toString() => '''
User(
  id: $id,
  username: $username,
  email: $email,
  firstName: $firstName,
  lastName: $lastName,
  gender: $gender,
  image: $image,
  accessToken: $accessToken,
  refreshToken: $refreshToken,
  password: $password
)
''';

  static User fromJjson(String jsonString) {
    return User.fromJjson(json.decode(jsonString));
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}