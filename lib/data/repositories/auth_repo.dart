import "dart:convert";

import "package:diehugosapp/data/models/auth/auth_response.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:dio/dio.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";
import "package:shared_preferences/shared_preferences.dart";

abstract class AuthRepo {
  Future<AuthResponse> login(String email, String password);

  Future<User?> authLocally();
}

class AuthRepoImpl implements AuthRepo {
  static const String jwtPrefKey = "jwt";
  static const String userPrefKey = "user";

  @override
  Future<AuthResponse> login(String email, String password) async {
    final dio = Get.find<Dio>();
    final prefs = Get.find<SharedPreferences>();

    final res = await dio.post<Map<dynamic, dynamic>>(
      "/auth/login",
      data: {"email": email, "password": password},
    );
    if (res.data == null || res.statusCode != 200) {
      return Future.error(Exception("Auth Response not 200!"));
    }

    final data = AuthResponse.fromJson(res.data as Map<String, Object?>);
    await prefs.setString(jwtPrefKey, data.jwt);
    await prefs.setString(userPrefKey, jsonEncode(data.user));
    return data;
  }

  @override
  Future<User?> authLocally() async {
    final prefs = Get.find<SharedPreferences>();
    final jwt = prefs.getString(jwtPrefKey);
    if (jwt == null || jwt.isEmpty) return null;

    try {
      final payload = jsonDecode(
        utf8.decode(base64Url.decode('${jwt.split('.')[1]}=')),
      );
      final isExpired =
          int.parse(payload["exp"].toString()) <=
          (DateTime.now().millisecondsSinceEpoch / 1000);

      if (isExpired) {
        await prefs.remove(jwtPrefKey);
        return null;
      }

      final encodedStoredUser = await prefs.getString(userPrefKey);
      if (encodedStoredUser == null) {
        print("when a jwt is present, a user should also be present!");
        return null;
      }
      final decodedUser = jsonDecode(encodedStoredUser);

      return User.fromJson(decodedUser as Map<String, Object?>);
    } catch (e) {
      return null;
    }
  }
}
