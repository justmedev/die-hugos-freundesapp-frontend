import "package:diehugosapp/data/models/auth/auth_response/auth_response.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "auth_state.freezed.dart";
part "auth_state.g.dart";

@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) = _AuthSession;

  factory AuthSession.fromAuthResponse(AuthResponse res) => AuthSession(
    accessToken: res.accessToken,
    refreshToken: res.refreshToken,
    user: res.user,
  );

  factory AuthSession.fromJson(Map<String, Object?> json) =>
      _$AuthSessionFromJson(json);
}
