// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolMember {

 int get id; User get user; DateTime get createdAt;
/// Create a copy of CashpoolMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolMemberCopyWith<CashpoolMember> get copyWith => _$CashpoolMemberCopyWithImpl<CashpoolMember>(this as CashpoolMember, _$identity);

  /// Serializes this CashpoolMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolMember&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,createdAt);

@override
String toString() {
  return 'CashpoolMember(id: $id, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CashpoolMemberCopyWith<$Res>  {
  factory $CashpoolMemberCopyWith(CashpoolMember value, $Res Function(CashpoolMember) _then) = _$CashpoolMemberCopyWithImpl;
@useResult
$Res call({
 int id, User user, DateTime createdAt
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$CashpoolMemberCopyWithImpl<$Res>
    implements $CashpoolMemberCopyWith<$Res> {
  _$CashpoolMemberCopyWithImpl(this._self, this._then);

  final CashpoolMember _self;
  final $Res Function(CashpoolMember) _then;

/// Create a copy of CashpoolMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of CashpoolMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashpoolMember].
extension CashpoolMemberPatterns on CashpoolMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolMember value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolMember value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User user,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashpoolMember() when $default != null:
return $default(_that.id,_that.user,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User user,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CashpoolMember():
return $default(_that.id,_that.user,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User user,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CashpoolMember() when $default != null:
return $default(_that.id,_that.user,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolMember implements CashpoolMember {
  const _CashpoolMember({required this.id, required this.user, required this.createdAt});
  factory _CashpoolMember.fromJson(Map<String, dynamic> json) => _$CashpoolMemberFromJson(json);

@override final  int id;
@override final  User user;
@override final  DateTime createdAt;

/// Create a copy of CashpoolMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolMemberCopyWith<_CashpoolMember> get copyWith => __$CashpoolMemberCopyWithImpl<_CashpoolMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolMember&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,createdAt);

@override
String toString() {
  return 'CashpoolMember(id: $id, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CashpoolMemberCopyWith<$Res> implements $CashpoolMemberCopyWith<$Res> {
  factory _$CashpoolMemberCopyWith(_CashpoolMember value, $Res Function(_CashpoolMember) _then) = __$CashpoolMemberCopyWithImpl;
@override @useResult
$Res call({
 int id, User user, DateTime createdAt
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$CashpoolMemberCopyWithImpl<$Res>
    implements _$CashpoolMemberCopyWith<$Res> {
  __$CashpoolMemberCopyWithImpl(this._self, this._then);

  final _CashpoolMember _self;
  final $Res Function(_CashpoolMember) _then;

/// Create a copy of CashpoolMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? createdAt = null,}) {
  return _then(_CashpoolMember(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of CashpoolMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
