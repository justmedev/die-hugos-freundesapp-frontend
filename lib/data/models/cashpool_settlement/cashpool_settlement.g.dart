// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_settlement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolSettlement _$CashpoolSettlementFromJson(Map<String, dynamic> json) =>
    _CashpoolSettlement(
      id: (json['id'] as num).toInt(),
      from: User.fromJson(json['from'] as Map<String, dynamic>),
      to: User.fromJson(json['to'] as Map<String, dynamic>),
      amountCents: (json['amountCents'] as num).toInt(),
      purpose: json['purpose'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CashpoolSettlementToJson(_CashpoolSettlement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'amountCents': instance.amountCents,
      'purpose': instance.purpose,
      'createdAt': instance.createdAt.toIso8601String(),
    };
