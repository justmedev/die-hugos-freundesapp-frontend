import "package:diehugosapp/data/models/auth/auth_response/auth_response.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "auth_state.freezed.dart";
part "auth_state.g.dart";

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required String jwt,
    required User user,
  }) = _AuthState;

  factory AuthState.fromAuthResponse(AuthResponse res) =>
      AuthState(jwt: res.jwt, user: res.user);

  factory AuthState.fromJson(Map<String, Object?> json) =>
      _$AuthStateFromJson(json);
}
