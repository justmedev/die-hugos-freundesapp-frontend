import "package:freezed_annotation/freezed_annotation.dart";

part "cashpool_user_settlement_summary.freezed.dart";
part "cashpool_user_settlement_summary.g.dart";

@freezed
abstract class CashpoolUserSettlementSummary with _$CashpoolUserSettlementSummary {
  const factory CashpoolUserSettlementSummary({
    required int netUserBalance,
    required int totalOpenCashpoolWorth,
  }) = _CashpoolUserSettlementSummary;

  factory CashpoolUserSettlementSummary.fromJson(Map<String, Object?> json) =>
      _$CashpoolUserSettlementSummaryFromJson(json);
}
