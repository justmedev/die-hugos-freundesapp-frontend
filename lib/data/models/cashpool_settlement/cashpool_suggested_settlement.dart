import "package:diehugosapp/data/models/user/user.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_suggested_settlement.freezed.dart";
part "cashpool_suggested_settlement.g.dart";

@freezed
abstract class CashpoolSuggestedSettlement with _$CashpoolSuggestedSettlement {
  const factory CashpoolSuggestedSettlement({
    required User from,
    required User to,
    required int amountCents,
  }) = _CashpoolSuggestedSettlement;

  factory CashpoolSuggestedSettlement.fromJson(Map<String, Object?> json) =>
      _$CashpoolSuggestedSettlementFromJson(json);
}
