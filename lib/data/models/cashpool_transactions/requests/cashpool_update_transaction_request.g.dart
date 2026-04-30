// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_update_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolTransactionUpdateRequest _$CashpoolTransactionUpdateRequestFromJson(
  Map<String, dynamic> json,
) => _CashpoolTransactionUpdateRequest(
  label: json['label'] as String,
  amountCents: (json['amountCents'] as num).toInt(),
);

Map<String, dynamic> _$CashpoolTransactionUpdateRequestToJson(
  _CashpoolTransactionUpdateRequest instance,
) => <String, dynamic>{
  'label': instance.label,
  'amountCents': instance.amountCents,
};
