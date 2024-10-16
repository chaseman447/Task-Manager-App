import 'dart:convert';

class Token {
  final String token;

  const Token({
    required this.token,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }

  Map<String, dynamic> toJson() => {
    'token': token,
  };

  @override
  String toString() => 'Token(token: $token)';

  bool get isEmpty => token.isEmpty;
}

// Extension methods for easy conversion between JSON and Token objects
extension TokenExtensions on Token {
  static Token fromJson(String jsonString) {
    return Token.fromJson(json.decode(jsonString));
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}

