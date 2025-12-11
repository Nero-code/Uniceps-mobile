// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeasurementEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementEvent()';
}


}

/// @nodoc
class $MeasurementEventCopyWith<$Res>  {
$MeasurementEventCopyWith(MeasurementEvent _, $Res Function(MeasurementEvent) __);
}


/// Adds pattern-matching-related methods to [MeasurementEvent].
extension MeasurementEventPatterns on MeasurementEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetMeasurements value)?  getMeasurements,TResult Function( _CreateMeasurement value)?  createMeasurement,TResult Function( _UpdateMeasurement value)?  updateMeasurement,TResult Function( _DeleteMeasurement value)?  deleteMeasurement,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetMeasurements() when getMeasurements != null:
return getMeasurements(_that);case _CreateMeasurement() when createMeasurement != null:
return createMeasurement(_that);case _UpdateMeasurement() when updateMeasurement != null:
return updateMeasurement(_that);case _DeleteMeasurement() when deleteMeasurement != null:
return deleteMeasurement(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetMeasurements value)  getMeasurements,required TResult Function( _CreateMeasurement value)  createMeasurement,required TResult Function( _UpdateMeasurement value)  updateMeasurement,required TResult Function( _DeleteMeasurement value)  deleteMeasurement,}){
final _that = this;
switch (_that) {
case _GetMeasurements():
return getMeasurements(_that);case _CreateMeasurement():
return createMeasurement(_that);case _UpdateMeasurement():
return updateMeasurement(_that);case _DeleteMeasurement():
return deleteMeasurement(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetMeasurements value)?  getMeasurements,TResult? Function( _CreateMeasurement value)?  createMeasurement,TResult? Function( _UpdateMeasurement value)?  updateMeasurement,TResult? Function( _DeleteMeasurement value)?  deleteMeasurement,}){
final _that = this;
switch (_that) {
case _GetMeasurements() when getMeasurements != null:
return getMeasurements(_that);case _CreateMeasurement() when createMeasurement != null:
return createMeasurement(_that);case _UpdateMeasurement() when updateMeasurement != null:
return updateMeasurement(_that);case _DeleteMeasurement() when deleteMeasurement != null:
return deleteMeasurement(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getMeasurements,TResult Function( Measurement m)?  createMeasurement,TResult Function( Measurement m)?  updateMeasurement,TResult Function( Measurement m)?  deleteMeasurement,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetMeasurements() when getMeasurements != null:
return getMeasurements();case _CreateMeasurement() when createMeasurement != null:
return createMeasurement(_that.m);case _UpdateMeasurement() when updateMeasurement != null:
return updateMeasurement(_that.m);case _DeleteMeasurement() when deleteMeasurement != null:
return deleteMeasurement(_that.m);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getMeasurements,required TResult Function( Measurement m)  createMeasurement,required TResult Function( Measurement m)  updateMeasurement,required TResult Function( Measurement m)  deleteMeasurement,}) {final _that = this;
switch (_that) {
case _GetMeasurements():
return getMeasurements();case _CreateMeasurement():
return createMeasurement(_that.m);case _UpdateMeasurement():
return updateMeasurement(_that.m);case _DeleteMeasurement():
return deleteMeasurement(_that.m);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getMeasurements,TResult? Function( Measurement m)?  createMeasurement,TResult? Function( Measurement m)?  updateMeasurement,TResult? Function( Measurement m)?  deleteMeasurement,}) {final _that = this;
switch (_that) {
case _GetMeasurements() when getMeasurements != null:
return getMeasurements();case _CreateMeasurement() when createMeasurement != null:
return createMeasurement(_that.m);case _UpdateMeasurement() when updateMeasurement != null:
return updateMeasurement(_that.m);case _DeleteMeasurement() when deleteMeasurement != null:
return deleteMeasurement(_that.m);case _:
  return null;

}
}

}

/// @nodoc


class _GetMeasurements implements MeasurementEvent {
  const _GetMeasurements();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMeasurements);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementEvent.getMeasurements()';
}


}




/// @nodoc


class _CreateMeasurement implements MeasurementEvent {
  const _CreateMeasurement(this.m);
  

 final  Measurement m;

/// Create a copy of MeasurementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMeasurementCopyWith<_CreateMeasurement> get copyWith => __$CreateMeasurementCopyWithImpl<_CreateMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMeasurement&&(identical(other.m, m) || other.m == m));
}


@override
int get hashCode => Object.hash(runtimeType,m);

@override
String toString() {
  return 'MeasurementEvent.createMeasurement(m: $m)';
}


}

/// @nodoc
abstract mixin class _$CreateMeasurementCopyWith<$Res> implements $MeasurementEventCopyWith<$Res> {
  factory _$CreateMeasurementCopyWith(_CreateMeasurement value, $Res Function(_CreateMeasurement) _then) = __$CreateMeasurementCopyWithImpl;
@useResult
$Res call({
 Measurement m
});




}
/// @nodoc
class __$CreateMeasurementCopyWithImpl<$Res>
    implements _$CreateMeasurementCopyWith<$Res> {
  __$CreateMeasurementCopyWithImpl(this._self, this._then);

  final _CreateMeasurement _self;
  final $Res Function(_CreateMeasurement) _then;

/// Create a copy of MeasurementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? m = null,}) {
  return _then(_CreateMeasurement(
null == m ? _self.m : m // ignore: cast_nullable_to_non_nullable
as Measurement,
  ));
}


}

/// @nodoc


class _UpdateMeasurement implements MeasurementEvent {
  const _UpdateMeasurement(this.m);
  

 final  Measurement m;

/// Create a copy of MeasurementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMeasurementCopyWith<_UpdateMeasurement> get copyWith => __$UpdateMeasurementCopyWithImpl<_UpdateMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMeasurement&&(identical(other.m, m) || other.m == m));
}


@override
int get hashCode => Object.hash(runtimeType,m);

@override
String toString() {
  return 'MeasurementEvent.updateMeasurement(m: $m)';
}


}

/// @nodoc
abstract mixin class _$UpdateMeasurementCopyWith<$Res> implements $MeasurementEventCopyWith<$Res> {
  factory _$UpdateMeasurementCopyWith(_UpdateMeasurement value, $Res Function(_UpdateMeasurement) _then) = __$UpdateMeasurementCopyWithImpl;
@useResult
$Res call({
 Measurement m
});




}
/// @nodoc
class __$UpdateMeasurementCopyWithImpl<$Res>
    implements _$UpdateMeasurementCopyWith<$Res> {
  __$UpdateMeasurementCopyWithImpl(this._self, this._then);

  final _UpdateMeasurement _self;
  final $Res Function(_UpdateMeasurement) _then;

/// Create a copy of MeasurementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? m = null,}) {
  return _then(_UpdateMeasurement(
null == m ? _self.m : m // ignore: cast_nullable_to_non_nullable
as Measurement,
  ));
}


}

/// @nodoc


class _DeleteMeasurement implements MeasurementEvent {
  const _DeleteMeasurement(this.m);
  

 final  Measurement m;

/// Create a copy of MeasurementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteMeasurementCopyWith<_DeleteMeasurement> get copyWith => __$DeleteMeasurementCopyWithImpl<_DeleteMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMeasurement&&(identical(other.m, m) || other.m == m));
}


@override
int get hashCode => Object.hash(runtimeType,m);

@override
String toString() {
  return 'MeasurementEvent.deleteMeasurement(m: $m)';
}


}

/// @nodoc
abstract mixin class _$DeleteMeasurementCopyWith<$Res> implements $MeasurementEventCopyWith<$Res> {
  factory _$DeleteMeasurementCopyWith(_DeleteMeasurement value, $Res Function(_DeleteMeasurement) _then) = __$DeleteMeasurementCopyWithImpl;
@useResult
$Res call({
 Measurement m
});




}
/// @nodoc
class __$DeleteMeasurementCopyWithImpl<$Res>
    implements _$DeleteMeasurementCopyWith<$Res> {
  __$DeleteMeasurementCopyWithImpl(this._self, this._then);

  final _DeleteMeasurement _self;
  final $Res Function(_DeleteMeasurement) _then;

/// Create a copy of MeasurementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? m = null,}) {
  return _then(_DeleteMeasurement(
null == m ? _self.m : m // ignore: cast_nullable_to_non_nullable
as Measurement,
  ));
}


}

/// @nodoc
mixin _$MeasurementState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementState()';
}


}

/// @nodoc
class $MeasurementStateCopyWith<$Res>  {
$MeasurementStateCopyWith(MeasurementState _, $Res Function(MeasurementState) __);
}


/// Adds pattern-matching-related methods to [MeasurementState].
extension MeasurementStatePatterns on MeasurementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Dirty value)?  dirty,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Dirty() when dirty != null:
return dirty(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Dirty value)  dirty,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Dirty():
return dirty(_that);case _Loaded():
return loaded(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Dirty value)?  dirty,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Dirty() when dirty != null:
return dirty(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  dirty,TResult Function( List<Measurement> list)?  loaded,TResult Function( MeasurementFailure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Dirty() when dirty != null:
return dirty();case _Loaded() when loaded != null:
return loaded(_that.list);case _Error() when error != null:
return error(_that.f);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  dirty,required TResult Function( List<Measurement> list)  loaded,required TResult Function( MeasurementFailure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Dirty():
return dirty();case _Loaded():
return loaded(_that.list);case _Error():
return error(_that.f);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  dirty,TResult? Function( List<Measurement> list)?  loaded,TResult? Function( MeasurementFailure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Dirty() when dirty != null:
return dirty();case _Loaded() when loaded != null:
return loaded(_that.list);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MeasurementState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementState.initial()';
}


}




/// @nodoc


class _Loading implements MeasurementState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementState.loading()';
}


}




/// @nodoc


class _Dirty implements MeasurementState {
  const _Dirty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dirty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementState.dirty()';
}


}




/// @nodoc


class _Loaded implements MeasurementState {
  const _Loaded(final  List<Measurement> list): _list = list;
  

 final  List<Measurement> _list;
 List<Measurement> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of MeasurementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._list, _list));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'MeasurementState.loaded(list: $list)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $MeasurementStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Measurement> list
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of MeasurementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_Loaded(
null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<Measurement>,
  ));
}


}

/// @nodoc


class _Error implements MeasurementState {
  const _Error(this.f);
  

 final  MeasurementFailure f;

/// Create a copy of MeasurementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.f, f) || other.f == f));
}


@override
int get hashCode => Object.hash(runtimeType,f);

@override
String toString() {
  return 'MeasurementState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MeasurementStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 MeasurementFailure f
});


$MeasurementFailureCopyWith<$Res> get f;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MeasurementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as MeasurementFailure,
  ));
}

/// Create a copy of MeasurementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeasurementFailureCopyWith<$Res> get f {
  
  return $MeasurementFailureCopyWith<$Res>(_self.f, (value) {
    return _then(_self.copyWith(f: value));
  });
}
}

// dart format on
