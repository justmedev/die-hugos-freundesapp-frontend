// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_update_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolTransactionUpdateRequest {

 String get label; int get amountCents;
/// Create a copy of CashpoolTransactionUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolTransactionUpdateRequestCopyWith<CashpoolTransactionUpdateRequest> get copyWith => _$CashpoolTransactionUpdateRequestCopyWithImpl<CashpoolTransactionUpdateRequest>(this as CashpoolTransactionUpdateRequest, _$identity);

  /// Serializes this CashpoolTransactionUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolTransactionUpdateRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amountCents);

@override
String toString() {
  return 'CashpoolTransactionUpdateRequest(label: $label, amountCents: $amountCents)';
}


}

/// @nodoc
abstract mixin class $CashpoolTransactionUpdateRequestCopyWith<$Res>  {
  factory $CashpoolTransactionUpdateRequestCopyWith(CashpoolTransactionUpdateRequest value, $Res Function(CashpoolTransactionUpdateRequest) _then) = _$CashpoolTransactionUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String label, int amountCents
});




}
/// @nodoc
class _$CashpoolTransactionUpdateRequestCopyWithImpl<$Res>
    implements $CashpoolTransactionUpdateRequestCopyWith<$Res> {
  _$CashpoolTransactionUpdateRequestCopyWithImpl(this._self, this._then);

  final CashpoolTransactionUpdateRequest _self;
  final $Res Function(CashpoolTransactionUpdateRequest) _then;

/// Create a copy of CashpoolTransactionUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amountCents = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CashpoolTransactionUpdateRequest].
extension CashpoolTransactionUpdateRequestPatterns on CashpoolTransactionUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolTransactionUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolTransactionUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolTransactionUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolTransactionUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolTransactionUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolTransactionUpdateRequest() when $default != null:
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
case _CashpoolTransactionUpdateRequest() when $default != null:
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
case _CashpoolTransactionUpdateRequest():
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
case _CashpoolTransactionUpdateRequest() when $default != null:
return $default(_that.label,_that.amountCents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolTransactionUpdateRequest implements CashpoolTransactionUpdateRequest {
  const _CashpoolTransactionUpdateRequest({required this.label, required this.amountCents});
  factory _CashpoolTransactionUpdateRequest.fromJson(Map<String, dynamic> json) => _$CashpoolTransactionUpdateRequestFromJson(json);

@override final  String label;
@override final  int amountCents;

/// Create a copy of CashpoolTransactionUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolTransactionUpdateRequestCopyWith<_CashpoolTransactionUpdateRequest> get copyWith => __$CashpoolTransactionUpdateRequestCopyWithImpl<_CashpoolTransactionUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolTransactionUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolTransactionUpdateRequest&&(identical(other.label, label) || other.label == label)&&(identical(other.amountCents, amountCents) || other.amountCents == amountCents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amountCents);

@override
String toString() {
  return 'CashpoolTransactionUpdateRequest(label: $label, amountCents: $amountCents)';
}


}

/// @nodoc
abstract mixin class _$CashpoolTransactionUpdateRequestCopyWith<$Res> implements $CashpoolTransactionUpdateRequestCopyWith<$Res> {
  factory _$CashpoolTransactionUpdateRequestCopyWith(_CashpoolTransactionUpdateRequest value, $Res Function(_CashpoolTransactionUpdateRequest) _then) = __$CashpoolTransactionUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String label, int amountCents
});




}
/// @nodoc
class __$CashpoolTransactionUpdateRequestCopyWithImpl<$Res>
    implements _$CashpoolTransactionUpdateRequestCopyWith<$Res> {
  __$CashpoolTransactionUpdateRequestCopyWithImpl(this._self, this._then);

  final _CashpoolTransactionUpdateRequest _self;
  final $Res Function(_CashpoolTransactionUpdateRequest) _then;

/// Create a copy of CashpoolTransactionUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amountCents = null,}) {
  return _then(_CashpoolTransactionUpdateRequest(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amountCents: null == amountCents ? _self.amountCents : amountCents // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
