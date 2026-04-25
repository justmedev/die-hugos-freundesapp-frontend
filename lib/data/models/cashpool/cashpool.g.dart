// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cashpool _$CashpoolFromJson(Map<String, dynamic> json) => _Cashpool(
  id: (json['id'] as num).toInt(),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  title: json['title'] as String,
  description: json['description'] as String,
  isOpened: json['is_opened'] as bool,
  ownerId: (json['owner_id'] as num).toInt(),
);

Map<String, dynamic> _$CashpoolToJson(_Cashpool instance) => <String, dynamic>{
  'id': instance.id,
  'updated_at': instance.updatedAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'title': instance.title,
  'description': instance.description,
  'is_opened': instance.isOpened,
  'owner_id': instance.ownerId,
};
