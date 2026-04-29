// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_create_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolTransactionCreateRequest _$CashpoolTransactionCreateRequestFromJson(
  Map<String, dynamic> json,
) => _CashpoolTransactionCreateRequest(
  label: json['label'] as String,
  amountCents: (json['amountCents'] as num).toInt(),
);

Map<String, dynamic> _$CashpoolTransactionCreateRequestToJson(
  _CashpoolTransactionCreateRequest instance,
) => <String, dynamic>{
  'label': instance.label,
  'amountCents': instance.amountCents,
};
