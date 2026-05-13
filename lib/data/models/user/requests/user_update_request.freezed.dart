// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserUpdateRequest {

 String get email; String get firstName; String get lastName; String? get accountHolderName; String? get accountIBAN; DateTime get birthdate;
/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUpdateRequestCopyWith<UserUpdateRequest> get copyWith => _$UserUpdateRequestCopyWithImpl<UserUpdateRequest>(this as UserUpdateRequest, _$identity);

  /// Serializes this UserUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUpdateRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.accountIBAN, accountIBAN) || other.accountIBAN == accountIBAN)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,firstName,lastName,accountHolderName,accountIBAN,birthdate);

@override
String toString() {
  return 'UserUpdateRequest(email: $email, firstName: $firstName, lastName: $lastName, accountHolderName: $accountHolderName, accountIBAN: $accountIBAN, birthdate: $birthdate)';
}


}

/// @nodoc
abstract mixin class $UserUpdateRequestCopyWith<$Res>  {
  factory $UserUpdateRequestCopyWith(UserUpdateRequest value, $Res Function(UserUpdateRequest) _then) = _$UserUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String email, String firstName, String lastName, String? accountHolderName, String? accountIBAN, DateTime birthdate
});




}
/// @nodoc
class _$UserUpdateRequestCopyWithImpl<$Res>
    implements $UserUpdateRequestCopyWith<$Res> {
  _$UserUpdateRequestCopyWithImpl(this._self, this._then);

  final UserUpdateRequest _self;
  final $Res Function(UserUpdateRequest) _then;

/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? firstName = null,Object? lastName = null,Object? accountHolderName = freezed,Object? accountIBAN = freezed,Object? birthdate = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,accountIBAN: freezed == accountIBAN ? _self.accountIBAN : accountIBAN // ignore: cast_nullable_to_non_nullable
as String?,birthdate: null == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserUpdateRequest].
extension UserUpdateRequestPatterns on UserUpdateRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserUpdateRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String firstName,  String lastName,  String? accountHolderName,  String? accountIBAN,  DateTime birthdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
return $default(_that.email,_that.firstName,_that.lastName,_that.accountHolderName,_that.accountIBAN,_that.birthdate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String firstName,  String lastName,  String? accountHolderName,  String? accountIBAN,  DateTime birthdate)  $default,) {final _that = this;
switch (_that) {
case _UserUpdateRequest():
return $default(_that.email,_that.firstName,_that.lastName,_that.accountHolderName,_that.accountIBAN,_that.birthdate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String firstName,  String lastName,  String? accountHolderName,  String? accountIBAN,  DateTime birthdate)?  $default,) {final _that = this;
switch (_that) {
case _UserUpdateRequest() when $default != null:
return $default(_that.email,_that.firstName,_that.lastName,_that.accountHolderName,_that.accountIBAN,_that.birthdate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserUpdateRequest implements UserUpdateRequest {
  const _UserUpdateRequest({required this.email, required this.firstName, required this.lastName, required this.accountHolderName, required this.accountIBAN, required this.birthdate});
  factory _UserUpdateRequest.fromJson(Map<String, dynamic> json) => _$UserUpdateRequestFromJson(json);

@override final  String email;
@override final  String firstName;
@override final  String lastName;
@override final  String? accountHolderName;
@override final  String? accountIBAN;
@override final  DateTime birthdate;

/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserUpdateRequestCopyWith<_UserUpdateRequest> get copyWith => __$UserUpdateRequestCopyWithImpl<_UserUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserUpdateRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.accountIBAN, accountIBAN) || other.accountIBAN == accountIBAN)&&(identical(other.birthdate, birthdate) || other.birthdate == birthdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,firstName,lastName,accountHolderName,accountIBAN,birthdate);

@override
String toString() {
  return 'UserUpdateRequest(email: $email, firstName: $firstName, lastName: $lastName, accountHolderName: $accountHolderName, accountIBAN: $accountIBAN, birthdate: $birthdate)';
}


}

/// @nodoc
abstract mixin class _$UserUpdateRequestCopyWith<$Res> implements $UserUpdateRequestCopyWith<$Res> {
  factory _$UserUpdateRequestCopyWith(_UserUpdateRequest value, $Res Function(_UserUpdateRequest) _then) = __$UserUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String firstName, String lastName, String? accountHolderName, String? accountIBAN, DateTime birthdate
});




}
/// @nodoc
class __$UserUpdateRequestCopyWithImpl<$Res>
    implements _$UserUpdateRequestCopyWith<$Res> {
  __$UserUpdateRequestCopyWithImpl(this._self, this._then);

  final _UserUpdateRequest _self;
  final $Res Function(_UserUpdateRequest) _then;

/// Create a copy of UserUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? firstName = null,Object? lastName = null,Object? accountHolderName = freezed,Object? accountIBAN = freezed,Object? birthdate = null,}) {
  return _then(_UserUpdateRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,accountIBAN: freezed == accountIBAN ? _self.accountIBAN : accountIBAN // ignore: cast_nullable_to_non_nullable
as String?,birthdate: null == birthdate ? _self.birthdate : birthdate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
