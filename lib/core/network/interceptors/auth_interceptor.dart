import "package:diehugosapp/core/utils/jwt_utils.dart";
import "package:diehugosapp/data/managers/session_manager.dart";
import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:diehugosapp/data/repositories/auth_repo.dart";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:get/get.dart";

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  AuthRepo get _authRepo => Get.find<AuthRepo>();
  SessionManager get _sessionManager => Get.find<SessionManager>();

  static Future<AuthSession>? _refreshFuture;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final session = _sessionManager.currentSession;
    if (session != null) {
      if (_isTokenExpiringSoon(session.accessToken)) {
        try {
          final AuthSession newSession;
          if (_refreshFuture != null) {
            newSession = await _refreshFuture!;
          } else {
            debugPrint("performing a token refresh");
            _refreshFuture = _authRepo.tokenRefresh(session.refreshToken);
            newSession = await _refreshFuture!;
            _refreshFuture = null;
          }

          options.headers["Authorization"] = "Bearer ${newSession.accessToken}";
        } on Exception catch (e) {
          _refreshFuture = null;
          await _sessionManager.clearSession();
          return handler.reject(
            DioException(requestOptions: options, error: "Session expired: $e"),
          );
        }
      } else {
        // Token is fine, attach it
        options.headers["Authorization"] = "Bearer ${session.accessToken}";
      }
    }

    return handler.next(options);
  }

  bool _isTokenExpiringSoon(String token) {
    final exp = getJWTExpirationDate(token);
    if (exp == null) return true;

    final timeUntilExpiry = exp.difference(DateTime.now());
    return timeUntilExpiry.inMinutes < 1;
  }
}
