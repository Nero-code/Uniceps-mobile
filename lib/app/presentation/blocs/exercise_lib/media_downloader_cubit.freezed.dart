// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_downloader_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaDownloaderState {

 MediaDownloaderStatus get status; double get progress; Failure? get failure;
/// Create a copy of MediaDownloaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaDownloaderStateCopyWith<MediaDownloaderState> get copyWith => _$MediaDownloaderStateCopyWithImpl<MediaDownloaderState>(this as MediaDownloaderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaDownloaderState&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,progress,failure);

@override
String toString() {
  return 'MediaDownloaderState(status: $status, progress: $progress, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $MediaDownloaderStateCopyWith<$Res>  {
  factory $MediaDownloaderStateCopyWith(MediaDownloaderState value, $Res Function(MediaDownloaderState) _then) = _$MediaDownloaderStateCopyWithImpl;
@useResult
$Res call({
 MediaDownloaderStatus status, double progress, Failure? failure
});




}
/// @nodoc
class _$MediaDownloaderStateCopyWithImpl<$Res>
    implements $MediaDownloaderStateCopyWith<$Res> {
  _$MediaDownloaderStateCopyWithImpl(this._self, this._then);

  final MediaDownloaderState _self;
  final $Res Function(MediaDownloaderState) _then;

/// Create a copy of MediaDownloaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? progress = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MediaDownloaderStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaDownloaderState].
extension MediaDownloaderStatePatterns on MediaDownloaderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaDownloaderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaDownloaderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaDownloaderState value)  $default,){
final _that = this;
switch (_that) {
case _MediaDownloaderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaDownloaderState value)?  $default,){
final _that = this;
switch (_that) {
case _MediaDownloaderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MediaDownloaderStatus status,  double progress,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaDownloaderState() when $default != null:
return $default(_that.status,_that.progress,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MediaDownloaderStatus status,  double progress,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _MediaDownloaderState():
return $default(_that.status,_that.progress,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MediaDownloaderStatus status,  double progress,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _MediaDownloaderState() when $default != null:
return $default(_that.status,_that.progress,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _MediaDownloaderState implements MediaDownloaderState {
  const _MediaDownloaderState({this.status = MediaDownloaderStatus.initial, this.progress = 0.0, this.failure});
  

@override@JsonKey() final  MediaDownloaderStatus status;
@override@JsonKey() final  double progress;
@override final  Failure? failure;

/// Create a copy of MediaDownloaderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaDownloaderStateCopyWith<_MediaDownloaderState> get copyWith => __$MediaDownloaderStateCopyWithImpl<_MediaDownloaderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaDownloaderState&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,progress,failure);

@override
String toString() {
  return 'MediaDownloaderState(status: $status, progress: $progress, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$MediaDownloaderStateCopyWith<$Res> implements $MediaDownloaderStateCopyWith<$Res> {
  factory _$MediaDownloaderStateCopyWith(_MediaDownloaderState value, $Res Function(_MediaDownloaderState) _then) = __$MediaDownloaderStateCopyWithImpl;
@override @useResult
$Res call({
 MediaDownloaderStatus status, double progress, Failure? failure
});




}
/// @nodoc
class __$MediaDownloaderStateCopyWithImpl<$Res>
    implements _$MediaDownloaderStateCopyWith<$Res> {
  __$MediaDownloaderStateCopyWithImpl(this._self, this._then);

  final _MediaDownloaderState _self;
  final $Res Function(_MediaDownloaderState) _then;

/// Create a copy of MediaDownloaderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? progress = null,Object? failure = freezed,}) {
  return _then(_MediaDownloaderState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MediaDownloaderStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
