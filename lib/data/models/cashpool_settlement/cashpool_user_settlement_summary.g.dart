// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_user_settlement_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolUserSettlementSummary _$CashpoolUserSettlementSummaryFromJson(
  Map<String, dynamic> json,
) => _CashpoolUserSettlementSummary(
  netUserBalance: (json['netUserBalance'] as num).toInt(),
  totalOpenCashpoolWorth: (json['totalOpenCashpoolWorth'] as num).toInt(),
);

Map<String, dynamic> _$CashpoolUserSettlementSummaryToJson(
  _CashpoolUserSettlementSummary instance,
) => <String, dynamic>{
  'netUserBalance': instance.netUserBalance,
  'totalOpenCashpoolWorth': instance.totalOpenCashpoolWorth,
};
