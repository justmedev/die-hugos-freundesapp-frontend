// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolTransaction _$CashpoolTransactionFromJson(Map<String, dynamic> json) =>
    _CashpoolTransaction(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      label: json['label'] as String,
      amountCents: (json['amountCents'] as num).toInt(),
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CashpoolTransactionToJson(
  _CashpoolTransaction instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'label': instance.label,
  'amountCents': instance.amountCents,
  'owner': instance.owner,
};
