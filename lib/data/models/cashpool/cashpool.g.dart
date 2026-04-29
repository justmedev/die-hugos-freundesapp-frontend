// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cashpool _$CashpoolFromJson(Map<String, dynamic> json) => _Cashpool(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  title: json['title'] as String,
  description: json['description'] as String,
  isOpened: json['isOpened'] as bool,
  owner: User.fromJson(json['owner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CashpoolToJson(_Cashpool instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'title': instance.title,
  'description': instance.description,
  'isOpened': instance.isOpened,
  'owner': instance.owner,
};
