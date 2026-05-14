// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_settlement_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolSettlementCreateRequest _$CashpoolSettlementCreateRequestFromJson(
  Map<String, dynamic> json,
) => _CashpoolSettlementCreateRequest(
  fromId: (json['fromId'] as num).toInt(),
  toId: (json['toId'] as num).toInt(),
  amountCents: (json['amountCents'] as num).toInt(),
  purpose: json['purpose'] as String,
);

Map<String, dynamic> _$CashpoolSettlementCreateRequestToJson(
  _CashpoolSettlementCreateRequest instance,
) => <String, dynamic>{
  'fromId': instance.fromId,
  'toId': instance.toId,
  'amountCents': instance.amountCents,
  'purpose': instance.purpose,
};
