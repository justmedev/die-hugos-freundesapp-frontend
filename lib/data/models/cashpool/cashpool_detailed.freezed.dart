// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashpool_detailed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashpoolDetailed {

 int get id; DateTime get createdAt; String get title; String get description; bool get isMember; bool get isOpened; User get owner;
/// Create a copy of CashpoolDetailed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashpoolDetailedCopyWith<CashpoolDetailed> get copyWith => _$CashpoolDetailedCopyWithImpl<CashpoolDetailed>(this as CashpoolDetailed, _$identity);

  /// Serializes this CashpoolDetailed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashpoolDetailed&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isMember, isMember) || other.isMember == isMember)&&(identical(other.isOpened, isOpened) || other.isOpened == isOpened)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,title,description,isMember,isOpened,owner);

@override
String toString() {
  return 'CashpoolDetailed(id: $id, createdAt: $createdAt, title: $title, description: $description, isMember: $isMember, isOpened: $isOpened, owner: $owner)';
}


}

/// @nodoc
abstract mixin class $CashpoolDetailedCopyWith<$Res>  {
  factory $CashpoolDetailedCopyWith(CashpoolDetailed value, $Res Function(CashpoolDetailed) _then) = _$CashpoolDetailedCopyWithImpl;
@useResult
$Res call({
 int id, DateTime createdAt, String title, String description, bool isMember, bool isOpened, User owner
});


$UserCopyWith<$Res> get owner;

}
/// @nodoc
class _$CashpoolDetailedCopyWithImpl<$Res>
    implements $CashpoolDetailedCopyWith<$Res> {
  _$CashpoolDetailedCopyWithImpl(this._self, this._then);

  final CashpoolDetailed _self;
  final $Res Function(CashpoolDetailed) _then;

/// Create a copy of CashpoolDetailed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? title = null,Object? description = null,Object? isMember = null,Object? isOpened = null,Object? owner = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,isOpened: null == isOpened ? _self.isOpened : isOpened // ignore: cast_nullable_to_non_nullable
as bool,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of CashpoolDetailed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get owner {
  
  return $UserCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashpoolDetailed].
extension CashpoolDetailedPatterns on CashpoolDetailed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashpoolDetailed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashpoolDetailed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashpoolDetailed value)  $default,){
final _that = this;
switch (_that) {
case _CashpoolDetailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashpoolDetailed value)?  $default,){
final _that = this;
switch (_that) {
case _CashpoolDetailed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  String title,  String description,  bool isMember,  bool isOpened,  User owner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashpoolDetailed() when $default != null:
return $default(_that.id,_that.createdAt,_that.title,_that.description,_that.isMember,_that.isOpened,_that.owner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  String title,  String description,  bool isMember,  bool isOpened,  User owner)  $default,) {final _that = this;
switch (_that) {
case _CashpoolDetailed():
return $default(_that.id,_that.createdAt,_that.title,_that.description,_that.isMember,_that.isOpened,_that.owner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime createdAt,  String title,  String description,  bool isMember,  bool isOpened,  User owner)?  $default,) {final _that = this;
switch (_that) {
case _CashpoolDetailed() when $default != null:
return $default(_that.id,_that.createdAt,_that.title,_that.description,_that.isMember,_that.isOpened,_that.owner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashpoolDetailed implements CashpoolDetailed {
  const _CashpoolDetailed({required this.id, required this.createdAt, required this.title, required this.description, required this.isMember, required this.isOpened, required this.owner});
  factory _CashpoolDetailed.fromJson(Map<String, dynamic> json) => _$CashpoolDetailedFromJson(json);

@override final  int id;
@override final  DateTime createdAt;
@override final  String title;
@override final  String description;
@override final  bool isMember;
@override final  bool isOpened;
@override final  User owner;

/// Create a copy of CashpoolDetailed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashpoolDetailedCopyWith<_CashpoolDetailed> get copyWith => __$CashpoolDetailedCopyWithImpl<_CashpoolDetailed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashpoolDetailedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashpoolDetailed&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isMember, isMember) || other.isMember == isMember)&&(identical(other.isOpened, isOpened) || other.isOpened == isOpened)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,title,description,isMember,isOpened,owner);

@override
String toString() {
  return 'CashpoolDetailed(id: $id, createdAt: $createdAt, title: $title, description: $description, isMember: $isMember, isOpened: $isOpened, owner: $owner)';
}


}

/// @nodoc
abstract mixin class _$CashpoolDetailedCopyWith<$Res> implements $CashpoolDetailedCopyWith<$Res> {
  factory _$CashpoolDetailedCopyWith(_CashpoolDetailed value, $Res Function(_CashpoolDetailed) _then) = __$CashpoolDetailedCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime createdAt, String title, String description, bool isMember, bool isOpened, User owner
});


@override $UserCopyWith<$Res> get owner;

}
/// @nodoc
class __$CashpoolDetailedCopyWithImpl<$Res>
    implements _$CashpoolDetailedCopyWith<$Res> {
  __$CashpoolDetailedCopyWithImpl(this._self, this._then);

  final _CashpoolDetailed _self;
  final $Res Function(_CashpoolDetailed) _then;

/// Create a copy of CashpoolDetailed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? title = null,Object? description = null,Object? isMember = null,Object? isOpened = null,Object? owner = null,}) {
  return _then(_CashpoolDetailed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,isOpened: null == isOpened ? _self.isOpened : isOpened // ignore: cast_nullable_to_non_nullable
as bool,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of CashpoolDetailed
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
