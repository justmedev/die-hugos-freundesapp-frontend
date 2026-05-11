// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashpool_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashpoolMember _$CashpoolMemberFromJson(Map<String, dynamic> json) =>
    _CashpoolMember(
      id: (json['id'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CashpoolMemberToJson(_CashpoolMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
    };
