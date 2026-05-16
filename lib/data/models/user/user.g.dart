// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  accountHolderName: json['accountHolderName'] as String?,
  accountIBAN: json['accountIBAN'] as String?,
  birthdate: DateTime.parse(json['birthdate'] as String),
  isAdmin: json['isAdmin'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'accountHolderName': instance.accountHolderName,
  'accountIBAN': instance.accountIBAN,
  'birthdate': serializeDateOnly(instance.birthdate),
  'isAdmin': instance.isAdmin,
  'createdAt': instance.createdAt.toIso8601String(),
};
