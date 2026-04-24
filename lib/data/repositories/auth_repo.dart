import "dart:convert";

import "package:dio/dio.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";
import "package:shared_preferences/shared_preferences.dart";

abstract class AuthRepo {
  Future<String> login(String email, String password);

  Future<bool> authLocally();
}

class AuthRepoImpl implements AuthRepo {
  static const String jwtPrefKey = "jwt";

  @override
  Future<String> login(String email, String password) async {
    final dio = Get.find<Dio>();
    final prefs = Get.find<SharedPreferences>();

    final res = await dio.post<Map<dynamic, dynamic>>(
      "/auth/login",
      data: {"email": email, "password": password},
    );
    final jwt = res.data?["jwt"] as String?;

    if (jwt == null || res.statusCode != 200) {
      return Future.error(Error());
    }

    await prefs.setString(jwtPrefKey, jwt);
    return jwt;
  }

  @override
  Future<bool> authLocally() async {
    final prefs = Get.find<SharedPreferences>();
    final jwt = prefs.getString(jwtPrefKey);
    if (jwt == null || jwt.isEmpty) return false;

    try {
      final payload = jsonDecode(
        utf8.decode(base64Url.decode('${jwt.split('.')[1]}=')),
      );
      final isExpired =
          int.parse(payload["exp"].toString()) <=
          (DateTime.now().millisecondsSinceEpoch / 1000);

      if (isExpired) {
        await prefs.remove(jwtPrefKey);
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
