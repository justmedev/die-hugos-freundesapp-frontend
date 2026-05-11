// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_settlement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolSettlement _$CashpoolSettlementFromJson(Map<String, dynamic> json) =>
    _CashpoolSettlement(
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      to: User.fromJson(json['to'] as Map<String, dynamic>),
      amountCents: (json['amountCents'] as num).toInt(),
    );

Map<String, dynamic> _$CashpoolSettlementToJson(_CashpoolSettlement instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'amountCents': instance.amountCents,
    };
