// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateState()';
}


}

/// @nodoc
class $UpdateStateCopyWith<$Res>  {
$UpdateStateCopyWith(UpdateState _, $Res Function(UpdateState) __);
}


/// Adds pattern-matching-related methods to [UpdateState].
extension UpdateStatePatterns on UpdateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _NeedsUpdate value)?  needsUpdate,TResult Function( _LatestVersion value)?  latestVersion,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NeedsUpdate() when needsUpdate != null:
return needsUpdate(_that);case _LatestVersion() when latestVersion != null:
return latestVersion(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _NeedsUpdate value)  needsUpdate,required TResult Function( _LatestVersion value)  latestVersion,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _NeedsUpdate():
return needsUpdate(_that);case _LatestVersion():
return latestVersion(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _NeedsUpdate value)?  needsUpdate,TResult? Function( _LatestVersion value)?  latestVersion,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NeedsUpdate() when needsUpdate != null:
return needsUpdate(_that);case _LatestVersion() when latestVersion != null:
return latestVersion(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Version version)?  needsUpdate,TResult Function()?  latestVersion,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NeedsUpdate() when needsUpdate != null:
return needsUpdate(_that.version);case _LatestVersion() when latestVersion != null:
return latestVersion();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Version version)  needsUpdate,required TResult Function()  latestVersion,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _NeedsUpdate():
return needsUpdate(_that.version);case _LatestVersion():
return latestVersion();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Version version)?  needsUpdate,TResult? Function()?  latestVersion,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NeedsUpdate() when needsUpdate != null:
return needsUpdate(_that.version);case _LatestVersion() when latestVersion != null:
return latestVersion();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UpdateState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateState.initial()';
}


}




/// @nodoc


class _NeedsUpdate implements UpdateState {
  const _NeedsUpdate(this.version);
  

 final  Version version;

/// Create a copy of UpdateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeedsUpdateCopyWith<_NeedsUpdate> get copyWith => __$NeedsUpdateCopyWithImpl<_NeedsUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeedsUpdate&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'UpdateState.needsUpdate(version: $version)';
}


}

/// @nodoc
abstract mixin class _$NeedsUpdateCopyWith<$Res> implements $UpdateStateCopyWith<$Res> {
  factory _$NeedsUpdateCopyWith(_NeedsUpdate value, $Res Function(_NeedsUpdate) _then) = __$NeedsUpdateCopyWithImpl;
@useResult
$Res call({
 Version version
});




}
/// @nodoc
class __$NeedsUpdateCopyWithImpl<$Res>
    implements _$NeedsUpdateCopyWith<$Res> {
  __$NeedsUpdateCopyWithImpl(this._self, this._then);

  final _NeedsUpdate _self;
  final $Res Function(_NeedsUpdate) _then;

/// Create a copy of UpdateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? version = null,}) {
  return _then(_NeedsUpdate(
null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as Version,
  ));
}


}

/// @nodoc


class _LatestVersion implements UpdateState {
  const _LatestVersion();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LatestVersion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateState.latestVersion()';
}


}




// dart format on
