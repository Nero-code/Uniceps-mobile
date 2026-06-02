// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_plan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DietPlanEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietPlanEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietPlanEvent()';
}


}

/// @nodoc
class $DietPlanEventCopyWith<$Res>  {
$DietPlanEventCopyWith(DietPlanEvent _, $Res Function(DietPlanEvent) __);
}


/// Adds pattern-matching-related methods to [DietPlanEvent].
extension DietPlanEventPatterns on DietPlanEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetPlans value)?  getPlans,TResult Function( _AddPlan value)?  addPlan,TResult Function( _UpdatePlan value)?  updatePlan,TResult Function( _DeletePlan value)?  deletePlan,TResult Function( _SetCurrentPlan value)?  setCurrentPlan,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPlans() when getPlans != null:
return getPlans(_that);case _AddPlan() when addPlan != null:
return addPlan(_that);case _UpdatePlan() when updatePlan != null:
return updatePlan(_that);case _DeletePlan() when deletePlan != null:
return deletePlan(_that);case _SetCurrentPlan() when setCurrentPlan != null:
return setCurrentPlan(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetPlans value)  getPlans,required TResult Function( _AddPlan value)  addPlan,required TResult Function( _UpdatePlan value)  updatePlan,required TResult Function( _DeletePlan value)  deletePlan,required TResult Function( _SetCurrentPlan value)  setCurrentPlan,}){
final _that = this;
switch (_that) {
case _GetPlans():
return getPlans(_that);case _AddPlan():
return addPlan(_that);case _UpdatePlan():
return updatePlan(_that);case _DeletePlan():
return deletePlan(_that);case _SetCurrentPlan():
return setCurrentPlan(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetPlans value)?  getPlans,TResult? Function( _AddPlan value)?  addPlan,TResult? Function( _UpdatePlan value)?  updatePlan,TResult? Function( _DeletePlan value)?  deletePlan,TResult? Function( _SetCurrentPlan value)?  setCurrentPlan,}){
final _that = this;
switch (_that) {
case _GetPlans() when getPlans != null:
return getPlans(_that);case _AddPlan() when addPlan != null:
return addPlan(_that);case _UpdatePlan() when updatePlan != null:
return updatePlan(_that);case _DeletePlan() when deletePlan != null:
return deletePlan(_that);case _SetCurrentPlan() when setCurrentPlan != null:
return setCurrentPlan(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getPlans,TResult Function( DietPlan plan)?  addPlan,TResult Function( DietPlan plan)?  updatePlan,TResult Function( int id)?  deletePlan,TResult Function( int id)?  setCurrentPlan,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPlans() when getPlans != null:
return getPlans();case _AddPlan() when addPlan != null:
return addPlan(_that.plan);case _UpdatePlan() when updatePlan != null:
return updatePlan(_that.plan);case _DeletePlan() when deletePlan != null:
return deletePlan(_that.id);case _SetCurrentPlan() when setCurrentPlan != null:
return setCurrentPlan(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getPlans,required TResult Function( DietPlan plan)  addPlan,required TResult Function( DietPlan plan)  updatePlan,required TResult Function( int id)  deletePlan,required TResult Function( int id)  setCurrentPlan,}) {final _that = this;
switch (_that) {
case _GetPlans():
return getPlans();case _AddPlan():
return addPlan(_that.plan);case _UpdatePlan():
return updatePlan(_that.plan);case _DeletePlan():
return deletePlan(_that.id);case _SetCurrentPlan():
return setCurrentPlan(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getPlans,TResult? Function( DietPlan plan)?  addPlan,TResult? Function( DietPlan plan)?  updatePlan,TResult? Function( int id)?  deletePlan,TResult? Function( int id)?  setCurrentPlan,}) {final _that = this;
switch (_that) {
case _GetPlans() when getPlans != null:
return getPlans();case _AddPlan() when addPlan != null:
return addPlan(_that.plan);case _UpdatePlan() when updatePlan != null:
return updatePlan(_that.plan);case _DeletePlan() when deletePlan != null:
return deletePlan(_that.id);case _SetCurrentPlan() when setCurrentPlan != null:
return setCurrentPlan(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _GetPlans implements DietPlanEvent {
  const _GetPlans();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPlans);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietPlanEvent.getPlans()';
}


}




/// @nodoc


class _AddPlan implements DietPlanEvent {
  const _AddPlan(this.plan);
  

 final  DietPlan plan;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddPlanCopyWith<_AddPlan> get copyWith => __$AddPlanCopyWithImpl<_AddPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddPlan&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'DietPlanEvent.addPlan(plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$AddPlanCopyWith<$Res> implements $DietPlanEventCopyWith<$Res> {
  factory _$AddPlanCopyWith(_AddPlan value, $Res Function(_AddPlan) _then) = __$AddPlanCopyWithImpl;
@useResult
$Res call({
 DietPlan plan
});




}
/// @nodoc
class __$AddPlanCopyWithImpl<$Res>
    implements _$AddPlanCopyWith<$Res> {
  __$AddPlanCopyWithImpl(this._self, this._then);

  final _AddPlan _self;
  final $Res Function(_AddPlan) _then;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(_AddPlan(
null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as DietPlan,
  ));
}


}

/// @nodoc


class _UpdatePlan implements DietPlanEvent {
  const _UpdatePlan(this.plan);
  

 final  DietPlan plan;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePlanCopyWith<_UpdatePlan> get copyWith => __$UpdatePlanCopyWithImpl<_UpdatePlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePlan&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'DietPlanEvent.updatePlan(plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$UpdatePlanCopyWith<$Res> implements $DietPlanEventCopyWith<$Res> {
  factory _$UpdatePlanCopyWith(_UpdatePlan value, $Res Function(_UpdatePlan) _then) = __$UpdatePlanCopyWithImpl;
@useResult
$Res call({
 DietPlan plan
});




}
/// @nodoc
class __$UpdatePlanCopyWithImpl<$Res>
    implements _$UpdatePlanCopyWith<$Res> {
  __$UpdatePlanCopyWithImpl(this._self, this._then);

  final _UpdatePlan _self;
  final $Res Function(_UpdatePlan) _then;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(_UpdatePlan(
null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as DietPlan,
  ));
}


}

/// @nodoc


class _DeletePlan implements DietPlanEvent {
  const _DeletePlan(this.id);
  

 final  int id;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePlanCopyWith<_DeletePlan> get copyWith => __$DeletePlanCopyWithImpl<_DeletePlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePlan&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DietPlanEvent.deletePlan(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletePlanCopyWith<$Res> implements $DietPlanEventCopyWith<$Res> {
  factory _$DeletePlanCopyWith(_DeletePlan value, $Res Function(_DeletePlan) _then) = __$DeletePlanCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeletePlanCopyWithImpl<$Res>
    implements _$DeletePlanCopyWith<$Res> {
  __$DeletePlanCopyWithImpl(this._self, this._then);

  final _DeletePlan _self;
  final $Res Function(_DeletePlan) _then;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeletePlan(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetCurrentPlan implements DietPlanEvent {
  const _SetCurrentPlan(this.id);
  

 final  int id;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCurrentPlanCopyWith<_SetCurrentPlan> get copyWith => __$SetCurrentPlanCopyWithImpl<_SetCurrentPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCurrentPlan&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DietPlanEvent.setCurrentPlan(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SetCurrentPlanCopyWith<$Res> implements $DietPlanEventCopyWith<$Res> {
  factory _$SetCurrentPlanCopyWith(_SetCurrentPlan value, $Res Function(_SetCurrentPlan) _then) = __$SetCurrentPlanCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$SetCurrentPlanCopyWithImpl<$Res>
    implements _$SetCurrentPlanCopyWith<$Res> {
  __$SetCurrentPlanCopyWithImpl(this._self, this._then);

  final _SetCurrentPlan _self;
  final $Res Function(_SetCurrentPlan) _then;

/// Create a copy of DietPlanEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_SetCurrentPlan(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DietPlanState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietPlanState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietPlanState()';
}


}

/// @nodoc
class $DietPlanStateCopyWith<$Res>  {
$DietPlanStateCopyWith(DietPlanState _, $Res Function(DietPlanState) __);
}


/// Adds pattern-matching-related methods to [DietPlanState].
extension DietPlanStatePatterns on DietPlanState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DietPlan> plans,  DietPlan? currentPlan)?  loaded,TResult Function( Failure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.plans,_that.currentPlan);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DietPlan> plans,  DietPlan? currentPlan)  loaded,required TResult Function( Failure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.plans,_that.currentPlan);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DietPlan> plans,  DietPlan? currentPlan)?  loaded,TResult? Function( Failure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.plans,_that.currentPlan);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DietPlanState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietPlanState.initial()';
}


}




/// @nodoc


class _Loading implements DietPlanState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietPlanState.loading()';
}


}




/// @nodoc


class _Loaded implements DietPlanState {
  const _Loaded({required final  List<DietPlan> plans, this.currentPlan}): _plans = plans;
  

 final  List<DietPlan> _plans;
 List<DietPlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

 final  DietPlan? currentPlan;

/// Create a copy of DietPlanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._plans, _plans)&&(identical(other.currentPlan, currentPlan) || other.currentPlan == currentPlan));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_plans),currentPlan);

@override
String toString() {
  return 'DietPlanState.loaded(plans: $plans, currentPlan: $currentPlan)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DietPlanStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<DietPlan> plans, DietPlan? currentPlan
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DietPlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plans = null,Object? currentPlan = freezed,}) {
  return _then(_Loaded(
plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<DietPlan>,currentPlan: freezed == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as DietPlan?,
  ));
}


}

/// @nodoc


class _Error implements DietPlanState {
  const _Error(this.f);
  

 final  Failure f;

/// Create a copy of DietPlanState
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
  return 'DietPlanState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DietPlanStateCopyWith<$Res> {
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

/// Create a copy of DietPlanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
