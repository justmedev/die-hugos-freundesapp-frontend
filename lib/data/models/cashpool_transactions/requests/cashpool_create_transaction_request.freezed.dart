// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_create_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolTransactionCreateRequest {

 String get label; int get amountCents;
/// Create a copy of CashpoolTransactionCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolTransactionCreateRequestCopyWith<CashpoolTransactionCreateRequest> get copyWith => _$CashpoolTransactionCreateRequestCopyWithImpl<CashpoolTransactionCreateRequest>(this as CashpoolTransactionCreateRequest, _$identity);

  /// Serializes this CashpoolTransactionCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolTransactionCreateRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amountCents);

@override
String toString() {
  return 'CashpoolTransactionCreateRequest(label: $label, amountCents: $amountCents)';
}


}

/// @nodoc
abstract mixin class $CashpoolTransactionCreateRequestCopyWith<$Res>  {
  factory $CashpoolTransactionCreateRequestCopyWith(CashpoolTransactionCreateRequest value, $Res Function(CashpoolTransactionCreateRequest) _then) = _$CashpoolTransactionCreateRequestCopyWithImpl;
@useResult
$Res call({
 String label, int amountCents
});




}
/// @nodoc
class _$CashpoolTransactionCreateRequestCopyWithImpl<$Res>
    implements $CashpoolTransactionCreateRequestCopyWith<$Res> {
  _$CashpoolTransactionCreateRequestCopyWithImpl(this._self, this._then);

  final CashpoolTransactionCreateRequest _self;
  final $Res Function(CashpoolTransactionCreateRequest) _then;

/// Create a copy of CashpoolTransactionCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amountCents = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CashpoolTransactionCreateRequest].
extension CashpoolTransactionCreateRequestPatterns on CashpoolTransactionCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolTransactionCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolTransactionCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolTransactionCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolTransactionCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolTransactionCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolTransactionCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  int amountCents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashpoolTransactionCreateRequest() when $default != null:
return $default(_that.label,_that.amountCents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  int amountCents)  $default,) {final _that = this;
switch (_that) {
case _CashpoolTransactionCreateRequest():
return $default(_that.label,_that.amountCents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  int amountCents)?  $default,) {final _that = this;
switch (_that) {
case _CashpoolTransactionCreateRequest() when $default != null:
return $default(_that.label,_that.amountCents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolTransactionCreateRequest implements CashpoolTransactionCreateRequest {
  const _CashpoolTransactionCreateRequest({required this.label, required this.amountCents});
  factory _CashpoolTransactionCreateRequest.fromJson(Map<String, dynamic> json) => _$CashpoolTransactionCreateRequestFromJson(json);

@override final  String label;
@override final  int amountCents;

/// Create a copy of CashpoolTransactionCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolTransactionCreateRequestCopyWith<_CashpoolTransactionCreateRequest> get copyWith => __$CashpoolTransactionCreateRequestCopyWithImpl<_CashpoolTransactionCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolTransactionCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolTransactionCreateRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amountCents);

@override
String toString() {
  return 'CashpoolTransactionCreateRequest(label: $label, amountCents: $amountCents)';
}


}

/// @nodoc
abstract mixin class _$CashpoolTransactionCreateRequestCopyWith<$Res> implements $CashpoolTransactionCreateRequestCopyWith<$Res> {
  factory _$CashpoolTransactionCreateRequestCopyWith(_CashpoolTransactionCreateRequest value, $Res Function(_CashpoolTransactionCreateRequest) _then) = __$CashpoolTransactionCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String label, int amountCents
});




}
/// @nodoc
class __$CashpoolTransactionCreateRequestCopyWithImpl<$Res>
    implements _$CashpoolTransactionCreateRequestCopyWith<$Res> {
  __$CashpoolTransactionCreateRequestCopyWithImpl(this._self, this._then);

  final _CashpoolTransactionCreateRequest _self;
  final $Res Function(_CashpoolTransactionCreateRequest) _then;

/// Create a copy of CashpoolTransactionCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amountCents = null,}) {
  return _then(_CashpoolTransactionCreateRequest(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
