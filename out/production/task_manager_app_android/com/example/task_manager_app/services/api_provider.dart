import 'package:http/http.dart' as http;
import 'dart:convert';


import '../config/config.dart';
import '../models/token.dart';


class ApiProvider {
  Future<String> authenticate(String username, String password) async {
    final loginUrl = '${AppConfig.api_url}/api-token-auth/';
    final body = {"username": username, "password": password};
    final response = await http.post(loginUrl as Uri, body: body);
    if (response.statusCode == 200) {
      final parse = json.decode(response.body);
      final String token = Token.fromJson(parse).token;
      return token;
    }
    else{
      throw Exception("Invalid username or password");
    }
  }
}
