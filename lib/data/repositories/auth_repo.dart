import "dart:convert";

import "package:diehugosapp/core/utils/jwt_utils.dart";
import "package:diehugosapp/data/models/auth/auth_response/auth_response.dart";
import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:dio/dio.dart";
import "package:shared_preferences/shared_preferences.dart";

abstract class AuthRepo {
  Future<AuthResponse> login(String email, String password);

  Future<AuthState?> authLocally();

  Future<void> saveAuthState(AuthState state);

  Future<AuthState?> loadAuthState();

  Future<void> clearAuthState();
}

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.prefs, required this.dio});

  late final SharedPreferences prefs;
  late final Dio dio;

  static const String _statePrefKey = "authState";

  @override
  Future<AuthResponse> login(String email, String password) async {
    final res = await dio.post<Map<dynamic, dynamic>>(
      "/auth/login",
      data: {"email": email, "password": password},
    );
    if (res.data == null || res.statusCode != 200) {
      return Future.error(Exception("Auth Response not 200!"));
    }

    final data = AuthResponse.fromJson(res.data! as Map<String, Object?>);
    await saveAuthState(AuthState.fromAuthResponse(data));
    return data;
  }

  @override
  Future<AuthState?> authLocally() async {
    try {
      final state = await loadAuthState();
      if (state == null) return null;

      final expiry = getJWTExpirationDate(state.accessToken);
      if (expiry!.isBefore(DateTime.now())) {
        await prefs.remove(_statePrefKey);
        return null;
      }

      return state;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveAuthState(AuthState state) async {
    await prefs.setString(
      _statePrefKey,
      jsonEncode(state),
    );
  }

  @override
  Future<AuthState?> loadAuthState() async {
    final stringified = prefs.getString(_statePrefKey);
    if (stringified == null) return null;
    return AuthState.fromJson(
      jsonDecode(stringified) as Map<String, Object?>,
    );
  }

  @override
  Future<void> clearAuthState() async {
    await prefs.remove(_statePrefKey);
  }
}
