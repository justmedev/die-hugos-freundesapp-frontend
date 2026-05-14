// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_suggested_settlement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolSuggestedSettlement {

 User get from; User get to; int get amountCents;
/// Create a copy of CashpoolSuggestedSettlement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolSuggestedSettlementCopyWith<CashpoolSuggestedSettlement> get copyWith => _$CashpoolSuggestedSettlementCopyWithImpl<CashpoolSuggestedSettlement>(this as CashpoolSuggestedSettlement, _$identity);

  /// Serializes this CashpoolSuggestedSettlement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolSuggestedSettlement&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,amountCents);

@override
String toString() {
  return 'CashpoolSuggestedSettlement(from: $from, to: $to, amountCents: $amountCents)';
}


}

/// @nodoc
abstract mixin class $CashpoolSuggestedSettlementCopyWith<$Res>  {
  factory $CashpoolSuggestedSettlementCopyWith(CashpoolSuggestedSettlement value, $Res Function(CashpoolSuggestedSettlement) _then) = _$CashpoolSuggestedSettlementCopyWithImpl;
@useResult
$Res call({
 User from, User to, int amountCents
});


$UserCopyWith<$Res> get from;$UserCopyWith<$Res> get to;

}
/// @nodoc
class _$CashpoolSuggestedSettlementCopyWithImpl<$Res>
    implements $CashpoolSuggestedSettlementCopyWith<$Res> {
  _$CashpoolSuggestedSettlementCopyWithImpl(this._self, this._then);

  final CashpoolSuggestedSettlement _self;
  final $Res Function(CashpoolSuggestedSettlement) _then;

/// Create a copy of CashpoolSuggestedSettlement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? amountCents = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as User,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as User,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CashpoolSuggestedSettlement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get from {
  
  return $UserCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of CashpoolSuggestedSettlement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get to {
  
  return $UserCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashpoolSuggestedSettlement].
extension CashpoolSuggestedSettlementPatterns on CashpoolSuggestedSettlement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolSuggestedSettlement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolSuggestedSettlement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolSuggestedSettlement value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolSuggestedSettlement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolSuggestedSettlement value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolSuggestedSettlement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User from,  User to,  int amountCents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashpoolSuggestedSettlement() when $default != null:
return $default(_that.from,_that.to,_that.amountCents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User from,  User to,  int amountCents)  $default,) {final _that = this;
switch (_that) {
case _CashpoolSuggestedSettlement():
return $default(_that.from,_that.to,_that.amountCents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User from,  User to,  int amountCents)?  $default,) {final _that = this;
switch (_that) {
case _CashpoolSuggestedSettlement() when $default != null:
return $default(_that.from,_that.to,_that.amountCents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolSuggestedSettlement implements CashpoolSuggestedSettlement {
  const _CashpoolSuggestedSettlement({required this.from, required this.to, required this.amountCents});
  factory _CashpoolSuggestedSettlement.fromJson(Map<String, dynamic> json) => _$CashpoolSuggestedSettlementFromJson(json);

@override final  User from;
@override final  User to;
@override final  int amountCents;

/// Create a copy of CashpoolSuggestedSettlement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolSuggestedSettlementCopyWith<_CashpoolSuggestedSettlement> get copyWith => __$CashpoolSuggestedSettlementCopyWithImpl<_CashpoolSuggestedSettlement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolSuggestedSettlementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolSuggestedSettlement&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,from,to,amountCents);

@override
String toString() {
  return 'CashpoolSuggestedSettlement(from: $from, to: $to, amountCents: $amountCents)';
}


}

/// @nodoc
abstract mixin class _$CashpoolSuggestedSettlementCopyWith<$Res> implements $CashpoolSuggestedSettlementCopyWith<$Res> {
  factory _$CashpoolSuggestedSettlementCopyWith(_CashpoolSuggestedSettlement value, $Res Function(_CashpoolSuggestedSettlement) _then) = __$CashpoolSuggestedSettlementCopyWithImpl;
@override @useResult
$Res call({
 User from, User to, int amountCents
});


@override $UserCopyWith<$Res> get from;@override $UserCopyWith<$Res> get to;

}
/// @nodoc
class __$CashpoolSuggestedSettlementCopyWithImpl<$Res>
    implements _$CashpoolSuggestedSettlementCopyWith<$Res> {
  __$CashpoolSuggestedSettlementCopyWithImpl(this._self, this._then);

  final _CashpoolSuggestedSettlement _self;
  final $Res Function(_CashpoolSuggestedSettlement) _then;

/// Create a copy of CashpoolSuggestedSettlement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? amountCents = null,}) {
  return _then(_CashpoolSuggestedSettlement(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as User,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as User,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CashpoolSuggestedSettlement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get from {
  
  return $UserCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of CashpoolSuggestedSettlement
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
