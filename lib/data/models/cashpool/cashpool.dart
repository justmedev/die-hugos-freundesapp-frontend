import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool.freezed.dart";
part "cashpool.g.dart";

@freezed
abstract class Cashpool with _$Cashpool {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Cashpool({
    required int id,
    required DateTime updatedAt,
    required DateTime createdAt,

    required String title,
    required String description,
    required bool isOpened,
    required int ownerId,
  }) = _Cashpool;

  factory Cashpool.fromJson(Map<String, Object?> json) =>
      _$CashpoolFromJson(json);
}
