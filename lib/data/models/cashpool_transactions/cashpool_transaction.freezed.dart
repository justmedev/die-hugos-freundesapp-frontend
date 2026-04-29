// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolTransaction {

 int get id; DateTime get createdAt; String get label; int get amountCents; User get owner;
/// Create a copy of CashpoolTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolTransactionCopyWith<CashpoolTransaction> get copyWith => _$CashpoolTransactionCopyWithImpl<CashpoolTransaction>(this as CashpoolTransaction, _$identity);

  /// Serializes this CashpoolTransaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.label, label) || other.label == label)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,label,amountCents,owner);

@override
String toString() {
  return 'CashpoolTransaction(id: $id, createdAt: $createdAt, label: $label, amountCents: $amountCents, owner: $owner)';
}


}

/// @nodoc
abstract mixin class $CashpoolTransactionCopyWith<$Res>  {
  factory $CashpoolTransactionCopyWith(CashpoolTransaction value, $Res Function(CashpoolTransaction) _then) = _$CashpoolTransactionCopyWithImpl;
@useResult
$Res call({
 int id, DateTime createdAt, String label, int amountCents, User owner
});


$UserCopyWith<$Res> get owner;

}
/// @nodoc
class _$CashpoolTransactionCopyWithImpl<$Res>
    implements $CashpoolTransactionCopyWith<$Res> {
  _$CashpoolTransactionCopyWithImpl(this._self, this._then);

  final CashpoolTransaction _self;
  final $Res Function(CashpoolTransaction) _then;

/// Create a copy of CashpoolTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? label = null,Object? amountCents = null,Object? owner = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of CashpoolTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get owner {
  
  return $UserCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashpoolTransaction].
extension CashpoolTransactionPatterns on CashpoolTransaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolTransaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolTransaction value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolTransaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolTransaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  String label,  int amountCents,  User owner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashpoolTransaction() when $default != null:
return $default(_that.id,_that.createdAt,_that.label,_that.amountCents,_that.owner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  String label,  int amountCents,  User owner)  $default,) {final _that = this;
switch (_that) {
case _CashpoolTransaction():
return $default(_that.id,_that.createdAt,_that.label,_that.amountCents,_that.owner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime createdAt,  String label,  int amountCents,  User owner)?  $default,) {final _that = this;
switch (_that) {
case _CashpoolTransaction() when $default != null:
return $default(_that.id,_that.createdAt,_that.label,_that.amountCents,_that.owner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolTransaction implements CashpoolTransaction {
  const _CashpoolTransaction({required this.id, required this.createdAt, required this.label, required this.amountCents, required this.owner});
  factory _CashpoolTransaction.fromJson(Map<String, dynamic> json) => _$CashpoolTransactionFromJson(json);

@override final  int id;
@override final  DateTime createdAt;
@override final  String label;
@override final  int amountCents;
@override final  User owner;

/// Create a copy of CashpoolTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolTransactionCopyWith<_CashpoolTransaction> get copyWith => __$CashpoolTransactionCopyWithImpl<_CashpoolTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.label, label) || other.label == label)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,label,amountCents,owner);

@override
String toString() {
  return 'CashpoolTransaction(id: $id, createdAt: $createdAt, label: $label, amountCents: $amountCents, owner: $owner)';
}


}

/// @nodoc
abstract mixin class _$CashpoolTransactionCopyWith<$Res> implements $CashpoolTransactionCopyWith<$Res> {
  factory _$CashpoolTransactionCopyWith(_CashpoolTransaction value, $Res Function(_CashpoolTransaction) _then) = __$CashpoolTransactionCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime createdAt, String label, int amountCents, User owner
});


@override $UserCopyWith<$Res> get owner;

}
/// @nodoc
class __$CashpoolTransactionCopyWithImpl<$Res>
    implements _$CashpoolTransactionCopyWith<$Res> {
  __$CashpoolTransactionCopyWithImpl(this._self, this._then);

  final _CashpoolTransaction _self;
  final $Res Function(_CashpoolTransaction) _then;

/// Create a copy of CashpoolTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? label = null,Object? amountCents = null,Object? owner = null,}) {
  return _then(_CashpoolTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of CashpoolTransaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get owner {
  
  return $UserCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
