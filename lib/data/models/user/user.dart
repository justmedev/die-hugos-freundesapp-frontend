import "package:freezed_annotation/freezed_annotation.dart";

part "user.freezed.dart";
part "user.g.dart";

@freezed
abstract class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory User({
    required int id,
    required DateTime? updatedAt,
    required DateTime createdAt,
    required String email,
    required String firstName,
    required String lastName,
    required DateTime birthdate,
    required bool isAdmin,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
