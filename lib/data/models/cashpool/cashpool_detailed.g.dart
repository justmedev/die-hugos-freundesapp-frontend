// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolDetailed _$CashpoolDetailedFromJson(Map<String, dynamic> json) =>
    _CashpoolDetailed(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      isOpened: json['isOpened'] as bool,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CashpoolDetailedToJson(_CashpoolDetailed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'isOpened': instance.isOpened,
      'owner': instance.owner,
    };
