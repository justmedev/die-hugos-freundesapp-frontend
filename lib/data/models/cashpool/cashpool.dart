import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool.freezed.dart";
part "cashpool.g.dart";

@freezed
abstract class Cashpool with _$Cashpool {
  const factory Cashpool({
    required int id,
    required DateTime createdAt,

    required String title,
    required String description,
    required bool isOpened,
    required User owner,
  }) = _Cashpool;

  factory Cashpool.fromJson(Map<String, Object?> json) =>
      _$CashpoolFromJson(json);
}
