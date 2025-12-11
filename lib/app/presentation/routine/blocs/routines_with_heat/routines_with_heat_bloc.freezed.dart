// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routines_with_heat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoutinesWithHeatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutinesWithHeatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoutinesWithHeatEvent()';
}


}

/// @nodoc
class $RoutinesWithHeatEventCopyWith<$Res>  {
$RoutinesWithHeatEventCopyWith(RoutinesWithHeatEvent _, $Res Function(RoutinesWithHeatEvent) __);
}


/// Adds pattern-matching-related methods to [RoutinesWithHeatEvent].
extension RoutinesWithHeatEventPatterns on RoutinesWithHeatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetRoutines value)?  getRoutines,TResult Function( _Import value)?  import,TResult Function( _Export value)?  export,TResult Function( _Create value)?  create,TResult Function( _Update value)?  update,TResult Function( _Delete value)?  delete,TResult Function( _SetCurrent value)?  setCurrent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetRoutines() when getRoutines != null:
return getRoutines(_that);case _Import() when import != null:
return import(_that);case _Export() when export != null:
return export(_that);case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _SetCurrent() when setCurrent != null:
return setCurrent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetRoutines value)  getRoutines,required TResult Function( _Import value)  import,required TResult Function( _Export value)  export,required TResult Function( _Create value)  create,required TResult Function( _Update value)  update,required TResult Function( _Delete value)  delete,required TResult Function( _SetCurrent value)  setCurrent,}){
final _that = this;
switch (_that) {
case _GetRoutines():
return getRoutines(_that);case _Import():
return import(_that);case _Export():
return export(_that);case _Create():
return create(_that);case _Update():
return update(_that);case _Delete():
return delete(_that);case _SetCurrent():
return setCurrent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetRoutines value)?  getRoutines,TResult? Function( _Import value)?  import,TResult? Function( _Export value)?  export,TResult? Function( _Create value)?  create,TResult? Function( _Update value)?  update,TResult? Function( _Delete value)?  delete,TResult? Function( _SetCurrent value)?  setCurrent,}){
final _that = this;
switch (_that) {
case _GetRoutines() when getRoutines != null:
return getRoutines(_that);case _Import() when import != null:
return import(_that);case _Export() when export != null:
return export(_that);case _Create() when create != null:
return create(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _SetCurrent() when setCurrent != null:
return setCurrent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getRoutines,TResult Function()?  import,TResult Function( int routineId)?  export,TResult Function( String name)?  create,TResult Function( Routine update)?  update,TResult Function( Routine delete)?  delete,TResult Function( Routine update)?  setCurrent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetRoutines() when getRoutines != null:
return getRoutines();case _Import() when import != null:
return import();case _Export() when export != null:
return export(_that.routineId);case _Create() when create != null:
return create(_that.name);case _Update() when update != null:
return update(_that.update);case _Delete() when delete != null:
return delete(_that.delete);case _SetCurrent() when setCurrent != null:
return setCurrent(_that.update);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getRoutines,required TResult Function()  import,required TResult Function( int routineId)  export,required TResult Function( String name)  create,required TResult Function( Routine update)  update,required TResult Function( Routine delete)  delete,required TResult Function( Routine update)  setCurrent,}) {final _that = this;
switch (_that) {
case _GetRoutines():
return getRoutines();case _Import():
return import();case _Export():
return export(_that.routineId);case _Create():
return create(_that.name);case _Update():
return update(_that.update);case _Delete():
return delete(_that.delete);case _SetCurrent():
return setCurrent(_that.update);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getRoutines,TResult? Function()?  import,TResult? Function( int routineId)?  export,TResult? Function( String name)?  create,TResult? Function( Routine update)?  update,TResult? Function( Routine delete)?  delete,TResult? Function( Routine update)?  setCurrent,}) {final _that = this;
switch (_that) {
case _GetRoutines() when getRoutines != null:
return getRoutines();case _Import() when import != null:
return import();case _Export() when export != null:
return export(_that.routineId);case _Create() when create != null:
return create(_that.name);case _Update() when update != null:
return update(_that.update);case _Delete() when delete != null:
return delete(_that.delete);case _SetCurrent() when setCurrent != null:
return setCurrent(_that.update);case _:
  return null;

}
}

}

/// @nodoc


class _GetRoutines implements RoutinesWithHeatEvent {
  const _GetRoutines();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRoutines);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoutinesWithHeatEvent.getRoutines()';
}


}




/// @nodoc


class _Import implements RoutinesWithHeatEvent {
  const _Import();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Import);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoutinesWithHeatEvent.import()';
}


}




/// @nodoc


class _Export implements RoutinesWithHeatEvent {
  const _Export(this.routineId);
  

 final  int routineId;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportCopyWith<_Export> get copyWith => __$ExportCopyWithImpl<_Export>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Export&&(identical(other.routineId, routineId) || other.routineId == routineId));
}


@override
int get hashCode => Object.hash(runtimeType,routineId);

@override
String toString() {
  return 'RoutinesWithHeatEvent.export(routineId: $routineId)';
}


}

/// @nodoc
abstract mixin class _$ExportCopyWith<$Res> implements $RoutinesWithHeatEventCopyWith<$Res> {
  factory _$ExportCopyWith(_Export value, $Res Function(_Export) _then) = __$ExportCopyWithImpl;
@useResult
$Res call({
 int routineId
});




}
/// @nodoc
class __$ExportCopyWithImpl<$Res>
    implements _$ExportCopyWith<$Res> {
  __$ExportCopyWithImpl(this._self, this._then);

  final _Export _self;
  final $Res Function(_Export) _then;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? routineId = null,}) {
  return _then(_Export(
null == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Create implements RoutinesWithHeatEvent {
  const _Create(this.name);
  

 final  String name;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'RoutinesWithHeatEvent.create(name: $name)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $RoutinesWithHeatEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Create(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Update implements RoutinesWithHeatEvent {
  const _Update(this.update);
  

 final  Routine update;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.update, update) || other.update == update));
}


@override
int get hashCode => Object.hash(runtimeType,update);

@override
String toString() {
  return 'RoutinesWithHeatEvent.update(update: $update)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $RoutinesWithHeatEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 Routine update
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? update = null,}) {
  return _then(_Update(
null == update ? _self.update : update // ignore: cast_nullable_to_non_nullable
as Routine,
  ));
}


}

/// @nodoc


class _Delete implements RoutinesWithHeatEvent {
  const _Delete(this.delete);
  

 final  Routine delete;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.delete, delete) || other.delete == delete));
}


@override
int get hashCode => Object.hash(runtimeType,delete);

@override
String toString() {
  return 'RoutinesWithHeatEvent.delete(delete: $delete)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $RoutinesWithHeatEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 Routine delete
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? delete = null,}) {
  return _then(_Delete(
null == delete ? _self.delete : delete // ignore: cast_nullable_to_non_nullable
as Routine,
  ));
}


}

/// @nodoc


class _SetCurrent implements RoutinesWithHeatEvent {
  const _SetCurrent(this.update);
  

 final  Routine update;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCurrentCopyWith<_SetCurrent> get copyWith => __$SetCurrentCopyWithImpl<_SetCurrent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCurrent&&(identical(other.update, update) || other.update == update));
}


@override
int get hashCode => Object.hash(runtimeType,update);

@override
String toString() {
  return 'RoutinesWithHeatEvent.setCurrent(update: $update)';
}


}

/// @nodoc
abstract mixin class _$SetCurrentCopyWith<$Res> implements $RoutinesWithHeatEventCopyWith<$Res> {
  factory _$SetCurrentCopyWith(_SetCurrent value, $Res Function(_SetCurrent) _then) = __$SetCurrentCopyWithImpl;
@useResult
$Res call({
 Routine update
});




}
/// @nodoc
class __$SetCurrentCopyWithImpl<$Res>
    implements _$SetCurrentCopyWith<$Res> {
  __$SetCurrentCopyWithImpl(this._self, this._then);

  final _SetCurrent _self;
  final $Res Function(_SetCurrent) _then;

/// Create a copy of RoutinesWithHeatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? update = null,}) {
  return _then(_SetCurrent(
null == update ? _self.update : update // ignore: cast_nullable_to_non_nullable
as Routine,
  ));
}


}

/// @nodoc
mixin _$RoutinesWithHeatState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutinesWithHeatState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoutinesWithHeatState()';
}


}

/// @nodoc
class $RoutinesWithHeatStateCopyWith<$Res>  {
$RoutinesWithHeatStateCopyWith(RoutinesWithHeatState _, $Res Function(RoutinesWithHeatState) __);
}


/// Adds pattern-matching-related methods to [RoutinesWithHeatState].
extension RoutinesWithHeatStatePatterns on RoutinesWithHeatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Importing value)?  importing,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Importing() when importing != null:
return importing(_that);case _Loaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Importing value)  importing,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Importing():
return importing(_that);case _Loaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Importing value)?  importing,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Importing() when importing != null:
return importing(_that);case _Loaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( RoutineResult result)?  importing,TResult Function( List<({Routine routine, RoutineHeat heat})> routines)?  loaded,TResult Function( Failure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Importing() when importing != null:
return importing(_that.result);case _Loaded() when loaded != null:
return loaded(_that.routines);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( RoutineResult result)  importing,required TResult Function( List<({Routine routine, RoutineHeat heat})> routines)  loaded,required TResult Function( Failure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Importing():
return importing(_that.result);case _Loaded():
return loaded(_that.routines);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( RoutineResult result)?  importing,TResult? Function( List<({Routine routine, RoutineHeat heat})> routines)?  loaded,TResult? Function( Failure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Importing() when importing != null:
return importing(_that.result);case _Loaded() when loaded != null:
return loaded(_that.routines);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RoutinesWithHeatState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoutinesWithHeatState.initial()';
}


}




/// @nodoc


class _Loading implements RoutinesWithHeatState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoutinesWithHeatState.loading()';
}


}




/// @nodoc


class _Importing implements RoutinesWithHeatState {
  const _Importing({required this.result});
  

 final  RoutineResult result;

/// Create a copy of RoutinesWithHeatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportingCopyWith<_Importing> get copyWith => __$ImportingCopyWithImpl<_Importing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Importing&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,result);

@override
String toString() {
  return 'RoutinesWithHeatState.importing(result: $result)';
}


}

/// @nodoc
abstract mixin class _$ImportingCopyWith<$Res> implements $RoutinesWithHeatStateCopyWith<$Res> {
  factory _$ImportingCopyWith(_Importing value, $Res Function(_Importing) _then) = __$ImportingCopyWithImpl;
@useResult
$Res call({
 RoutineResult result
});




}
/// @nodoc
class __$ImportingCopyWithImpl<$Res>
    implements _$ImportingCopyWith<$Res> {
  __$ImportingCopyWithImpl(this._self, this._then);

  final _Importing _self;
  final $Res Function(_Importing) _then;

/// Create a copy of RoutinesWithHeatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(_Importing(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as RoutineResult,
  ));
}


}

/// @nodoc


class _Loaded implements RoutinesWithHeatState {
  const _Loaded(final  List<({Routine routine, RoutineHeat heat})> routines): _routines = routines;
  

 final  List<({Routine routine, RoutineHeat heat})> _routines;
 List<({Routine routine, RoutineHeat heat})> get routines {
  if (_routines is EqualUnmodifiableListView) return _routines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_routines);
}


/// Create a copy of RoutinesWithHeatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._routines, _routines));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_routines));

@override
String toString() {
  return 'RoutinesWithHeatState.loaded(routines: $routines)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $RoutinesWithHeatStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<({Routine routine, RoutineHeat heat})> routines
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of RoutinesWithHeatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? routines = null,}) {
  return _then(_Loaded(
null == routines ? _self._routines : routines // ignore: cast_nullable_to_non_nullable
as List<({Routine routine, RoutineHeat heat})>,
  ));
}


}

/// @nodoc


class _Error implements RoutinesWithHeatState {
  const _Error(this.f);
  

 final  Failure f;

/// Create a copy of RoutinesWithHeatState
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
  return 'RoutinesWithHeatState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $RoutinesWithHeatStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure f
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of RoutinesWithHeatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
