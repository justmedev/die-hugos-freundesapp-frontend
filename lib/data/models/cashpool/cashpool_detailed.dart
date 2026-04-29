import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_detailed.freezed.dart";
part "cashpool_detailed.g.dart";

@freezed
abstract class CashpoolDetailed with _$CashpoolDetailed {
  const factory CashpoolDetailed({
    required int id,
    required DateTime createdAt,

    required String title,
    required String description,
    required bool isOpened,
    required User owner,
  }) = _CashpoolDetailed;

  factory CashpoolDetailed.fromJson(Map<String, Object?> json) =>
      _$CashpoolDetailedFromJson(json);
}
