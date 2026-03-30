// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_lib_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseLibState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseLibState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseLibState()';
}


}

/// @nodoc
class $ExerciseLibStateCopyWith<$Res>  {
$ExerciseLibStateCopyWith(ExerciseLibState _, $Res Function(ExerciseLibState) __);
}


/// Adds pattern-matching-related methods to [ExerciseLibState].
extension ExerciseLibStatePatterns on ExerciseLibState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _NeedsUpdate value)?  needsUpdate,TResult Function( _StatusGood value)?  statusGood,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NeedsUpdate() when needsUpdate != null:
return needsUpdate(_that);case _StatusGood() when statusGood != null:
return statusGood(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _NeedsUpdate value)  needsUpdate,required TResult Function( _StatusGood value)  statusGood,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _NeedsUpdate():
return needsUpdate(_that);case _StatusGood():
return statusGood(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _NeedsUpdate value)?  needsUpdate,TResult? Function( _StatusGood value)?  statusGood,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NeedsUpdate() when needsUpdate != null:
return needsUpdate(_that);case _StatusGood() when statusGood != null:
return statusGood(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  needsUpdate,TResult Function()?  statusGood,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NeedsUpdate() when needsUpdate != null:
return needsUpdate();case _StatusGood() when statusGood != null:
return statusGood();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  needsUpdate,required TResult Function()  statusGood,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _NeedsUpdate():
return needsUpdate();case _StatusGood():
return statusGood();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  needsUpdate,TResult? Function()?  statusGood,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NeedsUpdate() when needsUpdate != null:
return needsUpdate();case _StatusGood() when statusGood != null:
return statusGood();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ExerciseLibState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseLibState.initial()';
}


}




/// @nodoc


class _NeedsUpdate implements ExerciseLibState {
  const _NeedsUpdate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeedsUpdate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseLibState.needsUpdate()';
}


}




/// @nodoc


class _StatusGood implements ExerciseLibState {
  const _StatusGood();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusGood);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseLibState.statusGood()';
}


}




// dart format on
