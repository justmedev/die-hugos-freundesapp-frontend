// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_suggested_settlement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolSuggestedSettlement _$CashpoolSuggestedSettlementFromJson(
  Map<String, dynamic> json,
) => _CashpoolSuggestedSettlement(
  from: User.fromJson(json['from'] as Map<String, dynamic>),
  to: User.fromJson(json['to'] as Map<String, dynamic>),
  amountCents: (json['amountCents'] as num).toInt(),
);

Map<String, dynamic> _$CashpoolSuggestedSettlementToJson(
  _CashpoolSuggestedSettlement instance,
) => <String, dynamic>{
  'from': instance.from,
  'to': instance.to,
  'amountCents': instance.amountCents,
};
