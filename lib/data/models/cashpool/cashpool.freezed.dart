// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cashpool {

 int get id; DateTime get updatedAt; DateTime get createdAt; String get title; String get description; bool get isOpened; int get ownerId;
/// Create a copy of Cashpool
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolCopyWith<Cashpool> get copyWith => _$CashpoolCopyWithImpl<Cashpool>(this as Cashpool, _$identity);

  /// Serializes this Cashpool to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cashpool&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isOpened, isOpened) || other.isOpened == isOpened)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,updatedAt,createdAt,title,description,isOpened,ownerId);

@override
String toString() {
  return 'Cashpool(id: $id, updatedAt: $updatedAt, createdAt: $createdAt, title: $title, description: $description, isOpened: $isOpened, ownerId: $ownerId)';
}


}

/// @nodoc
abstract mixin class $CashpoolCopyWith<$Res>  {
  factory $CashpoolCopyWith(Cashpool value, $Res Function(Cashpool) _then) = _$CashpoolCopyWithImpl;
@useResult
$Res call({
 int id, DateTime updatedAt, DateTime createdAt, String title, String description, bool isOpened, int ownerId
});




}
/// @nodoc
class _$CashpoolCopyWithImpl<$Res>
    implements $CashpoolCopyWith<$Res> {
  _$CashpoolCopyWithImpl(this._self, this._then);

  final Cashpool _self;
  final $Res Function(Cashpool) _then;

/// Create a copy of Cashpool
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? updatedAt = null,Object? createdAt = null,Object? title = null,Object? description = null,Object? isOpened = null,Object? ownerId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isOpened: null == isOpened ? _self.isOpened : isOpened // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Cashpool].
extension CashpoolPatterns on Cashpool {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cashpool value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cashpool() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cashpool value)  $default,){
final _that = this;
switch (_that) {
case _Cashpool():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cashpool value)?  $default,){
final _that = this;
switch (_that) {
case _Cashpool() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime updatedAt,  DateTime createdAt,  String title,  String description,  bool isOpened,  int ownerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cashpool() when $default != null:
return $default(_that.id,_that.updatedAt,_that.createdAt,_that.title,_that.description,_that.isOpened,_that.ownerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime updatedAt,  DateTime createdAt,  String title,  String description,  bool isOpened,  int ownerId)  $default,) {final _that = this;
switch (_that) {
case _Cashpool():
return $default(_that.id,_that.updatedAt,_that.createdAt,_that.title,_that.description,_that.isOpened,_that.ownerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime updatedAt,  DateTime createdAt,  String title,  String description,  bool isOpened,  int ownerId)?  $default,) {final _that = this;
switch (_that) {
case _Cashpool() when $default != null:
return $default(_that.id,_that.updatedAt,_that.createdAt,_that.title,_that.description,_that.isOpened,_that.ownerId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Cashpool implements Cashpool {
  const _Cashpool({required this.id, required this.updatedAt, required this.createdAt, required this.title, required this.description, required this.isOpened, required this.ownerId});
  factory _Cashpool.fromJson(Map<String, dynamic> json) => _$CashpoolFromJson(json);

@override final  int id;
@override final  DateTime updatedAt;
@override final  DateTime createdAt;
@override final  String title;
@override final  String description;
@override final  bool isOpened;
@override final  int ownerId;

/// Create a copy of Cashpool
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolCopyWith<_Cashpool> get copyWith => __$CashpoolCopyWithImpl<_Cashpool>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cashpool&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isOpened, isOpened) || other.isOpened == isOpened)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,updatedAt,createdAt,title,description,isOpened,ownerId);

@override
String toString() {
  return 'Cashpool(id: $id, updatedAt: $updatedAt, createdAt: $createdAt, title: $title, description: $description, isOpened: $isOpened, ownerId: $ownerId)';
}


}

/// @nodoc
abstract mixin class _$CashpoolCopyWith<$Res> implements $CashpoolCopyWith<$Res> {
  factory _$CashpoolCopyWith(_Cashpool value, $Res Function(_Cashpool) _then) = __$CashpoolCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime updatedAt, DateTime createdAt, String title, String description, bool isOpened, int ownerId
});




}
/// @nodoc
class __$CashpoolCopyWithImpl<$Res>
    implements _$CashpoolCopyWith<$Res> {
  __$CashpoolCopyWithImpl(this._self, this._then);

  final _Cashpool _self;
  final $Res Function(_Cashpool) _then;

/// Create a copy of Cashpool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? updatedAt = null,Object? createdAt = null,Object? title = null,Object? description = null,Object? isOpened = null,Object? ownerId = null,}) {
  return _then(_Cashpool(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isOpened: null == isOpened ? _self.isOpened : isOpened // ignore: cast_nullable_to_non_nullable
as bool,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
