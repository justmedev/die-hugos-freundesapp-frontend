// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    _UserUpdateRequest(
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      accountHolderName: json['accountHolderName'] as String?,
      accountIBAN: json['accountIBAN'] as String?,
      birthdate: DateTime.parse(json['birthdate'] as String),
    );

Map<String, dynamic> _$UserUpdateRequestToJson(_UserUpdateRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'accountHolderName': instance.accountHolderName,
      'accountIBAN': instance.accountIBAN,
      'birthdate': instance.birthdate.toIso8601String(),
    };
