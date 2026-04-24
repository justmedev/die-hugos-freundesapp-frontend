// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  birthdate: DateTime.parse(json['birthdate'] as String),
  isAdmin: json['is_admin'] as bool,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'birthdate': instance.birthdate.toIso8601String(),
  'is_admin': instance.isAdmin,
};
