import "package:diehugosapp/data/managers/session_manager.dart";
import "package:diehugosapp/data/models/auth/auth_response/auth_response.dart";
import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:dio/dio.dart";

abstract class AuthRepo {
  Future<AuthResponse> login(String email, String password);

  Future<AuthSession?> authLocally();

  Future<AuthSession> tokenRefresh(String refreshToken);
}

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.sessionManager, required this.dio});

  late final SessionManager sessionManager;
  late final Dio dio;

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
    await sessionManager.saveSession(AuthSession.fromAuthResponse(data));
    return data;
  }

  @override
  Future<AuthSession?> authLocally() async {
    return sessionManager.currentSession;
  }

  @override
  Future<AuthSession> tokenRefresh(String refreshToken) async {
    final res = await dio.post<Map<dynamic, dynamic>>(
      "/auth/refresh",
      data: {"refreshToken": refreshToken},
    );
    if (res.data == null || res.statusCode != 200) {
      return Future.error(Exception("Auth Response not 200!"));
    }

    final session = AuthSession.fromAuthResponse(
      AuthResponse.fromJson(
        res.data! as Map<String, Object?>,
      ),
    );
    await sessionManager.saveSession(session);
    return session;
  }
}
