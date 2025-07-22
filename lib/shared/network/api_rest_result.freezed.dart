// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_rest_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$APIResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is APIResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'APIResult()';
}


}

/// @nodoc
class $APIResultCopyWith<$Res>  {
$APIResultCopyWith(APIResult _, $Res Function(APIResult) __);
}


/// Adds pattern-matching-related methods to [APIResult].
extension APIResultPatterns on APIResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Succeeded value)?  succeeded,TResult Function( Failed value)?  failed,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Succeeded() when succeeded != null:
return succeeded(_that);case Failed() when failed != null:
return failed(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Succeeded value)  succeeded,required TResult Function( Failed value)  failed,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Succeeded():
return succeeded(_that);case Failed():
return failed(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Succeeded value)?  succeeded,TResult? Function( Failed value)?  failed,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Succeeded() when succeeded != null:
return succeeded(_that);case Failed() when failed != null:
return failed(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Object? data)?  succeeded,TResult Function( Map<String, dynamic>? data)?  failed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Succeeded() when succeeded != null:
return succeeded(_that.data);case Failed() when failed != null:
return failed(_that.data);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Object? data)  succeeded,required TResult Function( Map<String, dynamic>? data)  failed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Succeeded():
return succeeded(_that.data);case Failed():
return failed(_that.data);case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Object? data)?  succeeded,TResult? Function( Map<String, dynamic>? data)?  failed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Succeeded() when succeeded != null:
return succeeded(_that.data);case Failed() when failed != null:
return failed(_that.data);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Succeeded implements APIResult {
  const Succeeded({this.data});
  

 final  Object? data;

/// Create a copy of APIResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucceededCopyWith<Succeeded> get copyWith => _$SucceededCopyWithImpl<Succeeded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Succeeded&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'APIResult.succeeded(data: $data)';
}


}

/// @nodoc
abstract mixin class $SucceededCopyWith<$Res> implements $APIResultCopyWith<$Res> {
  factory $SucceededCopyWith(Succeeded value, $Res Function(Succeeded) _then) = _$SucceededCopyWithImpl;
@useResult
$Res call({
 Object? data
});




}
/// @nodoc
class _$SucceededCopyWithImpl<$Res>
    implements $SucceededCopyWith<$Res> {
  _$SucceededCopyWithImpl(this._self, this._then);

  final Succeeded _self;
  final $Res Function(Succeeded) _then;

/// Create a copy of APIResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Succeeded(
data: freezed == data ? _self.data : data ,
  ));
}


}

/// @nodoc


class Failed implements APIResult {
  const Failed({final  Map<String, dynamic>? data}): _data = data;
  

 final  Map<String, dynamic>? _data;
 Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of APIResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailedCopyWith<Failed> get copyWith => _$FailedCopyWithImpl<Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failed&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'APIResult.failed(data: $data)';
}


}

/// @nodoc
abstract mixin class $FailedCopyWith<$Res> implements $APIResultCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) _then) = _$FailedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? data
});




}
/// @nodoc
class _$FailedCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed _self;
  final $Res Function(Failed) _then;

/// Create a copy of APIResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Failed(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class Error implements APIResult {
  const Error(this.message);
  

 final  String message;

/// Create a copy of APIResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'APIResult.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $APIResultCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of APIResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
