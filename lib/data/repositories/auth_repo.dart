import "dart:convert";

import "package:diehugosapp/data/models/auth/auth_response/auth_response.dart";
import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:dio/dio.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";
import "package:shared_preferences/shared_preferences.dart";

abstract class AuthRepo {
  Future<AuthResponse> login(String email, String password);

  Future<AuthState?> authLocally();

  Future<void> logout();
}

class AuthRepoImpl implements AuthRepo {
  static const String statePrefKey = "authState";

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

    final data = AuthResponse.fromJson(res.data! as Map<String, Object?>);
    await prefs.setString(
      statePrefKey,
      jsonEncode(AuthState.fromAuthResponse(data)),
    );
    return data;
  }

  @override
  Future<AuthState?> authLocally() async {
    final prefs = Get.find<SharedPreferences>();
    final stringified = prefs.getString(statePrefKey);
    if (stringified == null) return null;
    final state = AuthState.fromJson(
      jsonDecode(stringified) as Map<String, Object?>,
    );

    try {
      final payload = jsonDecode(
        utf8.decode(base64Url.decode('${state.jwt.split('.')[1]}=')),
      );
      final isExpired =
          int.parse(payload["exp"].toString()) <=
          (DateTime.now().millisecondsSinceEpoch / 1000);

      if (isExpired) {
        await prefs.remove(statePrefKey);
        return null;
      }

      final encodedStoredState = await prefs.getString(statePrefKey);
      if (encodedStoredState == null) {
        print("when a jwt is present, a user should also be present!");
        return null;
      }
      final decodedState = jsonDecode(encodedStoredState);

      return AuthState.fromJson(decodedState as Map<String, Object?>);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    final prefs = Get.find<SharedPreferences>();
    await prefs.remove(statePrefKey);
  }
}
