import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_settlement.freezed.dart";
part "cashpool_settlement.g.dart";

@freezed
abstract class CashpoolSettlement with _$CashpoolSettlement {
  const factory CashpoolSettlement({
    required int id,
    required User from,
    required User to,
    required int amountCents,
    required String purpose,
    required DateTime createdAt,
  }) = _CashpoolSettlement;

  factory CashpoolSettlement.fromJson(Map<String, Object?> json) =>
      _$CashpoolSettlementFromJson(json);
}
