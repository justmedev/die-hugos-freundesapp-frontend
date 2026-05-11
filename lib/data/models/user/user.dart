import "package:freezed_annotation/freezed_annotation.dart";

part "user.freezed.dart";
part "user.g.dart";

@freezed
abstract class User with _$User {
  const User._();

  const factory User({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    required DateTime birthdate,
    required bool isAdmin,
    required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  String get fullName => "$firstName $lastName";
}
