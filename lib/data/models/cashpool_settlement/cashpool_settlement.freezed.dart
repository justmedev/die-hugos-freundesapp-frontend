// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_settlement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolSettlement {

 int get id; User get from; User get to; int get amountCents; String get purpose; DateTime get createdAt;
/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolSettlementCopyWith<CashpoolSettlement> get copyWith => _$CashpoolSettlementCopyWithImpl<CashpoolSettlement>(this as CashpoolSettlement, _$identity);

  /// Serializes this CashpoolSettlement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolSettlement&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,from,to,amountCents,purpose,createdAt);

@override
String toString() {
  return 'CashpoolSettlement(id: $id, from: $from, to: $to, amountCents: $amountCents, purpose: $purpose, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CashpoolSettlementCopyWith<$Res>  {
  factory $CashpoolSettlementCopyWith(CashpoolSettlement value, $Res Function(CashpoolSettlement) _then) = _$CashpoolSettlementCopyWithImpl;
@useResult
$Res call({
 int id, User from, User to, int amountCents, String purpose, DateTime createdAt
});


$UserCopyWith<$Res> get from;$UserCopyWith<$Res> get to;

}
/// @nodoc
class _$CashpoolSettlementCopyWithImpl<$Res>
    implements $CashpoolSettlementCopyWith<$Res> {
  _$CashpoolSettlementCopyWithImpl(this._self, this._then);

  final CashpoolSettlement _self;
  final $Res Function(CashpoolSettlement) _then;

/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? from = null,Object? to = null,Object? amountCents = null,Object? purpose = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as User,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as User,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get from {
  
  return $UserCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get to {
  
  return $UserCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashpoolSettlement].
extension CashpoolSettlementPatterns on CashpoolSettlement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolSettlement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolSettlement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolSettlement value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolSettlement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolSettlement value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolSettlement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User from,  User to,  int amountCents,  String purpose,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashpoolSettlement() when $default != null:
return $default(_that.id,_that.from,_that.to,_that.amountCents,_that.purpose,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User from,  User to,  int amountCents,  String purpose,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CashpoolSettlement():
return $default(_that.id,_that.from,_that.to,_that.amountCents,_that.purpose,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User from,  User to,  int amountCents,  String purpose,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CashpoolSettlement() when $default != null:
return $default(_that.id,_that.from,_that.to,_that.amountCents,_that.purpose,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolSettlement implements CashpoolSettlement {
  const _CashpoolSettlement({required this.id, required this.from, required this.to, required this.amountCents, required this.purpose, required this.createdAt});
  factory _CashpoolSettlement.fromJson(Map<String, dynamic> json) => _$CashpoolSettlementFromJson(json);

@override final  int id;
@override final  User from;
@override final  User to;
@override final  int amountCents;
@override final  String purpose;
@override final  DateTime createdAt;

/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolSettlementCopyWith<_CashpoolSettlement> get copyWith => __$CashpoolSettlementCopyWithImpl<_CashpoolSettlement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolSettlementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolSettlement&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,from,to,amountCents,purpose,createdAt);

@override
String toString() {
  return 'CashpoolSettlement(id: $id, from: $from, to: $to, amountCents: $amountCents, purpose: $purpose, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CashpoolSettlementCopyWith<$Res> implements $CashpoolSettlementCopyWith<$Res> {
  factory _$CashpoolSettlementCopyWith(_CashpoolSettlement value, $Res Function(_CashpoolSettlement) _then) = __$CashpoolSettlementCopyWithImpl;
@override @useResult
$Res call({
 int id, User from, User to, int amountCents, String purpose, DateTime createdAt
});


@override $UserCopyWith<$Res> get from;@override $UserCopyWith<$Res> get to;

}
/// @nodoc
class __$CashpoolSettlementCopyWithImpl<$Res>
    implements _$CashpoolSettlementCopyWith<$Res> {
  __$CashpoolSettlementCopyWithImpl(this._self, this._then);

  final _CashpoolSettlement _self;
  final $Res Function(_CashpoolSettlement) _then;

/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? from = null,Object? to = null,Object? amountCents = null,Object? purpose = null,Object? createdAt = null,}) {
  return _then(_CashpoolSettlement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as User,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as User,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get from {
  
  return $UserCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of CashpoolSettlement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get to {
  
  return $UserCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}

// dart format on
