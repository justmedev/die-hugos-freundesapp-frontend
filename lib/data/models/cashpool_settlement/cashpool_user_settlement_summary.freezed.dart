// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_user_settlement_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolUserSettlementSummary {

 int get netUserBalance; int get totalOpenCashpoolWorth;
/// Create a copy of CashpoolUserSettlementSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolUserSettlementSummaryCopyWith<CashpoolUserSettlementSummary> get copyWith => _$CashpoolUserSettlementSummaryCopyWithImpl<CashpoolUserSettlementSummary>(this as CashpoolUserSettlementSummary, _$identity);

  /// Serializes this CashpoolUserSettlementSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolUserSettlementSummary&&(identical(other.netUserBalance, netUserBalance) || other.netUserBalance == netUserBalance)&&(identical(other.totalOpenCashpoolWorth, totalOpenCashpoolWorth) || other.totalOpenCashpoolWorth == totalOpenCashpoolWorth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,netUserBalance,totalOpenCashpoolWorth);

@override
String toString() {
  return 'CashpoolUserSettlementSummary(netUserBalance: $netUserBalance, totalOpenCashpoolWorth: $totalOpenCashpoolWorth)';
}


}

/// @nodoc
abstract mixin class $CashpoolUserSettlementSummaryCopyWith<$Res>  {
  factory $CashpoolUserSettlementSummaryCopyWith(CashpoolUserSettlementSummary value, $Res Function(CashpoolUserSettlementSummary) _then) = _$CashpoolUserSettlementSummaryCopyWithImpl;
@useResult
$Res call({
 int netUserBalance, int totalOpenCashpoolWorth
});




}
/// @nodoc
class _$CashpoolUserSettlementSummaryCopyWithImpl<$Res>
    implements $CashpoolUserSettlementSummaryCopyWith<$Res> {
  _$CashpoolUserSettlementSummaryCopyWithImpl(this._self, this._then);

  final CashpoolUserSettlementSummary _self;
  final $Res Function(CashpoolUserSettlementSummary) _then;

/// Create a copy of CashpoolUserSettlementSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? netUserBalance = null,Object? totalOpenCashpoolWorth = null,}) {
  return _then(_self.copyWith(
netUserBalance: null == netUserBalance ? _self.netUserBalance : netUserBalance // ignore: cast_nullable_to_non_nullable
as int,totalOpenCashpoolWorth: null == totalOpenCashpoolWorth ? _self.totalOpenCashpoolWorth : totalOpenCashpoolWorth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CashpoolUserSettlementSummary].
extension CashpoolUserSettlementSummaryPatterns on CashpoolUserSettlementSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolUserSettlementSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolUserSettlementSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolUserSettlementSummary value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolUserSettlementSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolUserSettlementSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolUserSettlementSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int netUserBalance,  int totalOpenCashpoolWorth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashpoolUserSettlementSummary() when $default != null:
return $default(_that.netUserBalance,_that.totalOpenCashpoolWorth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int netUserBalance,  int totalOpenCashpoolWorth)  $default,) {final _that = this;
switch (_that) {
case _CashpoolUserSettlementSummary():
return $default(_that.netUserBalance,_that.totalOpenCashpoolWorth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int netUserBalance,  int totalOpenCashpoolWorth)?  $default,) {final _that = this;
switch (_that) {
case _CashpoolUserSettlementSummary() when $default != null:
return $default(_that.netUserBalance,_that.totalOpenCashpoolWorth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolUserSettlementSummary implements CashpoolUserSettlementSummary {
  const _CashpoolUserSettlementSummary({required this.netUserBalance, required this.totalOpenCashpoolWorth});
  factory _CashpoolUserSettlementSummary.fromJson(Map<String, dynamic> json) => _$CashpoolUserSettlementSummaryFromJson(json);

@override final  int netUserBalance;
@override final  int totalOpenCashpoolWorth;

/// Create a copy of CashpoolUserSettlementSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolUserSettlementSummaryCopyWith<_CashpoolUserSettlementSummary> get copyWith => __$CashpoolUserSettlementSummaryCopyWithImpl<_CashpoolUserSettlementSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolUserSettlementSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolUserSettlementSummary&&(identical(other.netUserBalance, netUserBalance) || other.netUserBalance == netUserBalance)&&(identical(other.totalOpenCashpoolWorth, totalOpenCashpoolWorth) || other.totalOpenCashpoolWorth == totalOpenCashpoolWorth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,netUserBalance,totalOpenCashpoolWorth);

@override
String toString() {
  return 'CashpoolUserSettlementSummary(netUserBalance: $netUserBalance, totalOpenCashpoolWorth: $totalOpenCashpoolWorth)';
}


}

/// @nodoc
abstract mixin class _$CashpoolUserSettlementSummaryCopyWith<$Res> implements $CashpoolUserSettlementSummaryCopyWith<$Res> {
  factory _$CashpoolUserSettlementSummaryCopyWith(_CashpoolUserSettlementSummary value, $Res Function(_CashpoolUserSettlementSummary) _then) = __$CashpoolUserSettlementSummaryCopyWithImpl;
@override @useResult
$Res call({
 int netUserBalance, int totalOpenCashpoolWorth
});




}
/// @nodoc
class __$CashpoolUserSettlementSummaryCopyWithImpl<$Res>
    implements _$CashpoolUserSettlementSummaryCopyWith<$Res> {
  __$CashpoolUserSettlementSummaryCopyWithImpl(this._self, this._then);

  final _CashpoolUserSettlementSummary _self;
  final $Res Function(_CashpoolUserSettlementSummary) _then;

/// Create a copy of CashpoolUserSettlementSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? netUserBalance = null,Object? totalOpenCashpoolWorth = null,}) {
  return _then(_CashpoolUserSettlementSummary(
netUserBalance: null == netUserBalance ? _self.netUserBalance : netUserBalance // ignore: cast_nullable_to_non_nullable
as int,totalOpenCashpoolWorth: null == totalOpenCashpoolWorth ? _self.totalOpenCashpoolWorth : totalOpenCashpoolWorth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
