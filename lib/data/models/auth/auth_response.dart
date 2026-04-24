import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "auth_response.freezed.dart";
part "auth_response.g.dart";

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String jwt,
    required User user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, Object?> json) =>
      _$AuthResponseFromJson(json);
}
