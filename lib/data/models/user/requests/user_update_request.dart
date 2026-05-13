import "package:freezed_annotation/freezed_annotation.dart";

part "user_update_request.freezed.dart";
part "user_update_request.g.dart";

@freezed
abstract class UserUpdateRequest with _$UserUpdateRequest {
  const factory UserUpdateRequest({
    required String email,
    required String firstName,
    required String lastName,
    required String? accountHolderName,
    required String? accountIBAN,
    required DateTime birthdate,
  }) = _UserUpdateRequest;

  factory UserUpdateRequest.fromJson(
    Map<String, Object?> json,
  ) => _$UserUpdateRequestFromJson(json);
}
