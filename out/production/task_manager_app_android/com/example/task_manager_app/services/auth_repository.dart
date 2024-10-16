
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'api_provider.dart';

class AuthRepository {
  final storage = FlutterSecureStorage();
  final ApiProvider apiProvider = ApiProvider();

  Future<String> authenticate({required String username, required String password}) =>
      apiProvider.authenticate(username, password);

  Future<void> persistToken(String token) async{
    storage.write(key: "authToken", value: token);
  }

  Future<bool>hasToken() async{
    String? token = await storage.read(key: "authToken");
    bool result = token != null ? true : false;
    return result;
  }

  Future<void> deleteToken() async{
    await storage.delete(key: "authToken");
  }

}
