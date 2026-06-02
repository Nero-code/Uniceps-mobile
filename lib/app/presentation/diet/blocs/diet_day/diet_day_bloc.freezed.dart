// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_day_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DietDayEvent {

 int get planId;
/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DietDayEventCopyWith<DietDayEvent> get copyWith => _$DietDayEventCopyWithImpl<DietDayEvent>(this as DietDayEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietDayEvent&&(identical(other.planId, planId) || other.planId == planId));
}


@override
int get hashCode => Object.hash(runtimeType,planId);

@override
String toString() {
  return 'DietDayEvent(planId: $planId)';
}


}

/// @nodoc
abstract mixin class $DietDayEventCopyWith<$Res>  {
  factory $DietDayEventCopyWith(DietDayEvent value, $Res Function(DietDayEvent) _then) = _$DietDayEventCopyWithImpl;
@useResult
$Res call({
 int planId
});




}
/// @nodoc
class _$DietDayEventCopyWithImpl<$Res>
    implements $DietDayEventCopyWith<$Res> {
  _$DietDayEventCopyWithImpl(this._self, this._then);

  final DietDayEvent _self;
  final $Res Function(DietDayEvent) _then;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planId = null,}) {
  return _then(_self.copyWith(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DietDayEvent].
extension DietDayEventPatterns on DietDayEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetDays value)?  getDays,TResult Function( _AddDay value)?  addDay,TResult Function( _UpdateDay value)?  updateDay,TResult Function( _DeleteDay value)?  deleteDay,TResult Function( _ReorderDays value)?  reorderDays,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetDays() when getDays != null:
return getDays(_that);case _AddDay() when addDay != null:
return addDay(_that);case _UpdateDay() when updateDay != null:
return updateDay(_that);case _DeleteDay() when deleteDay != null:
return deleteDay(_that);case _ReorderDays() when reorderDays != null:
return reorderDays(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetDays value)  getDays,required TResult Function( _AddDay value)  addDay,required TResult Function( _UpdateDay value)  updateDay,required TResult Function( _DeleteDay value)  deleteDay,required TResult Function( _ReorderDays value)  reorderDays,}){
final _that = this;
switch (_that) {
case _GetDays():
return getDays(_that);case _AddDay():
return addDay(_that);case _UpdateDay():
return updateDay(_that);case _DeleteDay():
return deleteDay(_that);case _ReorderDays():
return reorderDays(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetDays value)?  getDays,TResult? Function( _AddDay value)?  addDay,TResult? Function( _UpdateDay value)?  updateDay,TResult? Function( _DeleteDay value)?  deleteDay,TResult? Function( _ReorderDays value)?  reorderDays,}){
final _that = this;
switch (_that) {
case _GetDays() when getDays != null:
return getDays(_that);case _AddDay() when addDay != null:
return addDay(_that);case _UpdateDay() when updateDay != null:
return updateDay(_that);case _DeleteDay() when deleteDay != null:
return deleteDay(_that);case _ReorderDays() when reorderDays != null:
return reorderDays(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int planId)?  getDays,TResult Function( int planId,  DietDay day)?  addDay,TResult Function( int planId,  DietDay day)?  updateDay,TResult Function( int planId,  int id)?  deleteDay,TResult Function( int planId,  List<DietDay> days)?  reorderDays,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetDays() when getDays != null:
return getDays(_that.planId);case _AddDay() when addDay != null:
return addDay(_that.planId,_that.day);case _UpdateDay() when updateDay != null:
return updateDay(_that.planId,_that.day);case _DeleteDay() when deleteDay != null:
return deleteDay(_that.planId,_that.id);case _ReorderDays() when reorderDays != null:
return reorderDays(_that.planId,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int planId)  getDays,required TResult Function( int planId,  DietDay day)  addDay,required TResult Function( int planId,  DietDay day)  updateDay,required TResult Function( int planId,  int id)  deleteDay,required TResult Function( int planId,  List<DietDay> days)  reorderDays,}) {final _that = this;
switch (_that) {
case _GetDays():
return getDays(_that.planId);case _AddDay():
return addDay(_that.planId,_that.day);case _UpdateDay():
return updateDay(_that.planId,_that.day);case _DeleteDay():
return deleteDay(_that.planId,_that.id);case _ReorderDays():
return reorderDays(_that.planId,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int planId)?  getDays,TResult? Function( int planId,  DietDay day)?  addDay,TResult? Function( int planId,  DietDay day)?  updateDay,TResult? Function( int planId,  int id)?  deleteDay,TResult? Function( int planId,  List<DietDay> days)?  reorderDays,}) {final _that = this;
switch (_that) {
case _GetDays() when getDays != null:
return getDays(_that.planId);case _AddDay() when addDay != null:
return addDay(_that.planId,_that.day);case _UpdateDay() when updateDay != null:
return updateDay(_that.planId,_that.day);case _DeleteDay() when deleteDay != null:
return deleteDay(_that.planId,_that.id);case _ReorderDays() when reorderDays != null:
return reorderDays(_that.planId,_that.days);case _:
  return null;

}
}

}

/// @nodoc


class _GetDays implements DietDayEvent {
  const _GetDays(this.planId);
  

@override final  int planId;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetDaysCopyWith<_GetDays> get copyWith => __$GetDaysCopyWithImpl<_GetDays>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetDays&&(identical(other.planId, planId) || other.planId == planId));
}


@override
int get hashCode => Object.hash(runtimeType,planId);

@override
String toString() {
  return 'DietDayEvent.getDays(planId: $planId)';
}


}

/// @nodoc
abstract mixin class _$GetDaysCopyWith<$Res> implements $DietDayEventCopyWith<$Res> {
  factory _$GetDaysCopyWith(_GetDays value, $Res Function(_GetDays) _then) = __$GetDaysCopyWithImpl;
@override @useResult
$Res call({
 int planId
});




}
/// @nodoc
class __$GetDaysCopyWithImpl<$Res>
    implements _$GetDaysCopyWith<$Res> {
  __$GetDaysCopyWithImpl(this._self, this._then);

  final _GetDays _self;
  final $Res Function(_GetDays) _then;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,}) {
  return _then(_GetDays(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddDay implements DietDayEvent {
  const _AddDay(this.planId, this.day);
  

@override final  int planId;
 final  DietDay day;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDayCopyWith<_AddDay> get copyWith => __$AddDayCopyWithImpl<_AddDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDay&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,planId,day);

@override
String toString() {
  return 'DietDayEvent.addDay(planId: $planId, day: $day)';
}


}

/// @nodoc
abstract mixin class _$AddDayCopyWith<$Res> implements $DietDayEventCopyWith<$Res> {
  factory _$AddDayCopyWith(_AddDay value, $Res Function(_AddDay) _then) = __$AddDayCopyWithImpl;
@override @useResult
$Res call({
 int planId, DietDay day
});




}
/// @nodoc
class __$AddDayCopyWithImpl<$Res>
    implements _$AddDayCopyWith<$Res> {
  __$AddDayCopyWithImpl(this._self, this._then);

  final _AddDay _self;
  final $Res Function(_AddDay) _then;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? day = null,}) {
  return _then(_AddDay(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DietDay,
  ));
}


}

/// @nodoc


class _UpdateDay implements DietDayEvent {
  const _UpdateDay(this.planId, this.day);
  

@override final  int planId;
 final  DietDay day;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDayCopyWith<_UpdateDay> get copyWith => __$UpdateDayCopyWithImpl<_UpdateDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDay&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,planId,day);

@override
String toString() {
  return 'DietDayEvent.updateDay(planId: $planId, day: $day)';
}


}

/// @nodoc
abstract mixin class _$UpdateDayCopyWith<$Res> implements $DietDayEventCopyWith<$Res> {
  factory _$UpdateDayCopyWith(_UpdateDay value, $Res Function(_UpdateDay) _then) = __$UpdateDayCopyWithImpl;
@override @useResult
$Res call({
 int planId, DietDay day
});




}
/// @nodoc
class __$UpdateDayCopyWithImpl<$Res>
    implements _$UpdateDayCopyWith<$Res> {
  __$UpdateDayCopyWithImpl(this._self, this._then);

  final _UpdateDay _self;
  final $Res Function(_UpdateDay) _then;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? day = null,}) {
  return _then(_UpdateDay(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DietDay,
  ));
}


}

/// @nodoc


class _DeleteDay implements DietDayEvent {
  const _DeleteDay(this.planId, this.id);
  

@override final  int planId;
 final  int id;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteDayCopyWith<_DeleteDay> get copyWith => __$DeleteDayCopyWithImpl<_DeleteDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteDay&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,planId,id);

@override
String toString() {
  return 'DietDayEvent.deleteDay(planId: $planId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteDayCopyWith<$Res> implements $DietDayEventCopyWith<$Res> {
  factory _$DeleteDayCopyWith(_DeleteDay value, $Res Function(_DeleteDay) _then) = __$DeleteDayCopyWithImpl;
@override @useResult
$Res call({
 int planId, int id
});




}
/// @nodoc
class __$DeleteDayCopyWithImpl<$Res>
    implements _$DeleteDayCopyWith<$Res> {
  __$DeleteDayCopyWithImpl(this._self, this._then);

  final _DeleteDay _self;
  final $Res Function(_DeleteDay) _then;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? id = null,}) {
  return _then(_DeleteDay(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderDays implements DietDayEvent {
  const _ReorderDays(this.planId, final  List<DietDay> days): _days = days;
  

@override final  int planId;
 final  List<DietDay> _days;
 List<DietDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderDaysCopyWith<_ReorderDays> get copyWith => __$ReorderDaysCopyWithImpl<_ReorderDays>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderDays&&(identical(other.planId, planId) || other.planId == planId)&&const DeepCollectionEquality().equals(other._days, _days));
}


@override
int get hashCode => Object.hash(runtimeType,planId,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'DietDayEvent.reorderDays(planId: $planId, days: $days)';
}


}

/// @nodoc
abstract mixin class _$ReorderDaysCopyWith<$Res> implements $DietDayEventCopyWith<$Res> {
  factory _$ReorderDaysCopyWith(_ReorderDays value, $Res Function(_ReorderDays) _then) = __$ReorderDaysCopyWithImpl;
@override @useResult
$Res call({
 int planId, List<DietDay> days
});




}
/// @nodoc
class __$ReorderDaysCopyWithImpl<$Res>
    implements _$ReorderDaysCopyWith<$Res> {
  __$ReorderDaysCopyWithImpl(this._self, this._then);

  final _ReorderDays _self;
  final $Res Function(_ReorderDays) _then;

/// Create a copy of DietDayEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? days = null,}) {
  return _then(_ReorderDays(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DietDay>,
  ));
}


}

/// @nodoc
mixin _$DietDayState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietDayState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietDayState()';
}


}

/// @nodoc
class $DietDayStateCopyWith<$Res>  {
$DietDayStateCopyWith(DietDayState _, $Res Function(DietDayState) __);
}


/// Adds pattern-matching-related methods to [DietDayState].
extension DietDayStatePatterns on DietDayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DietDay> days)?  loaded,TResult Function( Failure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.days);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DietDay> days)  loaded,required TResult Function( Failure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.days);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DietDay> days)?  loaded,TResult? Function( Failure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.days);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DietDayState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietDayState.initial()';
}


}




/// @nodoc


class _Loading implements DietDayState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietDayState.loading()';
}


}




/// @nodoc


class _Loaded implements DietDayState {
  const _Loaded(final  List<DietDay> days): _days = days;
  

 final  List<DietDay> _days;
 List<DietDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of DietDayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._days, _days));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'DietDayState.loaded(days: $days)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DietDayStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<DietDay> days
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DietDayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? days = null,}) {
  return _then(_Loaded(
null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DietDay>,
  ));
}


}

/// @nodoc


class _Error implements DietDayState {
  const _Error(this.f);
  

 final  Failure f;

/// Create a copy of DietDayState
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
  return 'DietDayState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DietDayStateCopyWith<$Res> {
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

/// Create a copy of DietDayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
