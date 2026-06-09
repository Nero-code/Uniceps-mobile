// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_meal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DietMealEvent {

 int get dayId;
/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DietMealEventCopyWith<DietMealEvent> get copyWith => _$DietMealEventCopyWithImpl<DietMealEvent>(this as DietMealEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietMealEvent&&(identical(other.dayId, dayId) || other.dayId == dayId));
}


@override
int get hashCode => Object.hash(runtimeType,dayId);

@override
String toString() {
  return 'DietMealEvent(dayId: $dayId)';
}


}

/// @nodoc
abstract mixin class $DietMealEventCopyWith<$Res>  {
  factory $DietMealEventCopyWith(DietMealEvent value, $Res Function(DietMealEvent) _then) = _$DietMealEventCopyWithImpl;
@useResult
$Res call({
 int dayId
});




}
/// @nodoc
class _$DietMealEventCopyWithImpl<$Res>
    implements $DietMealEventCopyWith<$Res> {
  _$DietMealEventCopyWithImpl(this._self, this._then);

  final DietMealEvent _self;
  final $Res Function(DietMealEvent) _then;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayId = null,}) {
  return _then(_self.copyWith(
dayId: null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DietMealEvent].
extension DietMealEventPatterns on DietMealEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetMeals value)?  getMeals,TResult Function( _AddMeal value)?  addMeal,TResult Function( _UpdateMeal value)?  updateMeal,TResult Function( _DeleteMeal value)?  deleteMeal,TResult Function( _ReorderMeals value)?  reorderMeals,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetMeals() when getMeals != null:
return getMeals(_that);case _AddMeal() when addMeal != null:
return addMeal(_that);case _UpdateMeal() when updateMeal != null:
return updateMeal(_that);case _DeleteMeal() when deleteMeal != null:
return deleteMeal(_that);case _ReorderMeals() when reorderMeals != null:
return reorderMeals(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetMeals value)  getMeals,required TResult Function( _AddMeal value)  addMeal,required TResult Function( _UpdateMeal value)  updateMeal,required TResult Function( _DeleteMeal value)  deleteMeal,required TResult Function( _ReorderMeals value)  reorderMeals,}){
final _that = this;
switch (_that) {
case _GetMeals():
return getMeals(_that);case _AddMeal():
return addMeal(_that);case _UpdateMeal():
return updateMeal(_that);case _DeleteMeal():
return deleteMeal(_that);case _ReorderMeals():
return reorderMeals(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetMeals value)?  getMeals,TResult? Function( _AddMeal value)?  addMeal,TResult? Function( _UpdateMeal value)?  updateMeal,TResult? Function( _DeleteMeal value)?  deleteMeal,TResult? Function( _ReorderMeals value)?  reorderMeals,}){
final _that = this;
switch (_that) {
case _GetMeals() when getMeals != null:
return getMeals(_that);case _AddMeal() when addMeal != null:
return addMeal(_that);case _UpdateMeal() when updateMeal != null:
return updateMeal(_that);case _DeleteMeal() when deleteMeal != null:
return deleteMeal(_that);case _ReorderMeals() when reorderMeals != null:
return reorderMeals(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int dayId)?  getMeals,TResult Function( int dayId,  DietMeal meal)?  addMeal,TResult Function( int dayId,  DietMeal meal)?  updateMeal,TResult Function( int dayId,  int id)?  deleteMeal,TResult Function( int dayId,  List<DietMeal> meals)?  reorderMeals,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetMeals() when getMeals != null:
return getMeals(_that.dayId);case _AddMeal() when addMeal != null:
return addMeal(_that.dayId,_that.meal);case _UpdateMeal() when updateMeal != null:
return updateMeal(_that.dayId,_that.meal);case _DeleteMeal() when deleteMeal != null:
return deleteMeal(_that.dayId,_that.id);case _ReorderMeals() when reorderMeals != null:
return reorderMeals(_that.dayId,_that.meals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int dayId)  getMeals,required TResult Function( int dayId,  DietMeal meal)  addMeal,required TResult Function( int dayId,  DietMeal meal)  updateMeal,required TResult Function( int dayId,  int id)  deleteMeal,required TResult Function( int dayId,  List<DietMeal> meals)  reorderMeals,}) {final _that = this;
switch (_that) {
case _GetMeals():
return getMeals(_that.dayId);case _AddMeal():
return addMeal(_that.dayId,_that.meal);case _UpdateMeal():
return updateMeal(_that.dayId,_that.meal);case _DeleteMeal():
return deleteMeal(_that.dayId,_that.id);case _ReorderMeals():
return reorderMeals(_that.dayId,_that.meals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int dayId)?  getMeals,TResult? Function( int dayId,  DietMeal meal)?  addMeal,TResult? Function( int dayId,  DietMeal meal)?  updateMeal,TResult? Function( int dayId,  int id)?  deleteMeal,TResult? Function( int dayId,  List<DietMeal> meals)?  reorderMeals,}) {final _that = this;
switch (_that) {
case _GetMeals() when getMeals != null:
return getMeals(_that.dayId);case _AddMeal() when addMeal != null:
return addMeal(_that.dayId,_that.meal);case _UpdateMeal() when updateMeal != null:
return updateMeal(_that.dayId,_that.meal);case _DeleteMeal() when deleteMeal != null:
return deleteMeal(_that.dayId,_that.id);case _ReorderMeals() when reorderMeals != null:
return reorderMeals(_that.dayId,_that.meals);case _:
  return null;

}
}

}

/// @nodoc


class _GetMeals implements DietMealEvent {
  const _GetMeals(this.dayId);
  

@override final  int dayId;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMealsCopyWith<_GetMeals> get copyWith => __$GetMealsCopyWithImpl<_GetMeals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMeals&&(identical(other.dayId, dayId) || other.dayId == dayId));
}


@override
int get hashCode => Object.hash(runtimeType,dayId);

@override
String toString() {
  return 'DietMealEvent.getMeals(dayId: $dayId)';
}


}

/// @nodoc
abstract mixin class _$GetMealsCopyWith<$Res> implements $DietMealEventCopyWith<$Res> {
  factory _$GetMealsCopyWith(_GetMeals value, $Res Function(_GetMeals) _then) = __$GetMealsCopyWithImpl;
@override @useResult
$Res call({
 int dayId
});




}
/// @nodoc
class __$GetMealsCopyWithImpl<$Res>
    implements _$GetMealsCopyWith<$Res> {
  __$GetMealsCopyWithImpl(this._self, this._then);

  final _GetMeals _self;
  final $Res Function(_GetMeals) _then;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayId = null,}) {
  return _then(_GetMeals(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddMeal implements DietMealEvent {
  const _AddMeal(this.dayId, this.meal);
  

@override final  int dayId;
 final  DietMeal meal;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddMealCopyWith<_AddMeal> get copyWith => __$AddMealCopyWithImpl<_AddMeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddMeal&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.meal, meal) || other.meal == meal));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,meal);

@override
String toString() {
  return 'DietMealEvent.addMeal(dayId: $dayId, meal: $meal)';
}


}

/// @nodoc
abstract mixin class _$AddMealCopyWith<$Res> implements $DietMealEventCopyWith<$Res> {
  factory _$AddMealCopyWith(_AddMeal value, $Res Function(_AddMeal) _then) = __$AddMealCopyWithImpl;
@override @useResult
$Res call({
 int dayId, DietMeal meal
});




}
/// @nodoc
class __$AddMealCopyWithImpl<$Res>
    implements _$AddMealCopyWith<$Res> {
  __$AddMealCopyWithImpl(this._self, this._then);

  final _AddMeal _self;
  final $Res Function(_AddMeal) _then;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? meal = null,}) {
  return _then(_AddMeal(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,null == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as DietMeal,
  ));
}


}

/// @nodoc


class _UpdateMeal implements DietMealEvent {
  const _UpdateMeal(this.dayId, this.meal);
  

@override final  int dayId;
 final  DietMeal meal;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMealCopyWith<_UpdateMeal> get copyWith => __$UpdateMealCopyWithImpl<_UpdateMeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMeal&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.meal, meal) || other.meal == meal));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,meal);

@override
String toString() {
  return 'DietMealEvent.updateMeal(dayId: $dayId, meal: $meal)';
}


}

/// @nodoc
abstract mixin class _$UpdateMealCopyWith<$Res> implements $DietMealEventCopyWith<$Res> {
  factory _$UpdateMealCopyWith(_UpdateMeal value, $Res Function(_UpdateMeal) _then) = __$UpdateMealCopyWithImpl;
@override @useResult
$Res call({
 int dayId, DietMeal meal
});




}
/// @nodoc
class __$UpdateMealCopyWithImpl<$Res>
    implements _$UpdateMealCopyWith<$Res> {
  __$UpdateMealCopyWithImpl(this._self, this._then);

  final _UpdateMeal _self;
  final $Res Function(_UpdateMeal) _then;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? meal = null,}) {
  return _then(_UpdateMeal(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,null == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as DietMeal,
  ));
}


}

/// @nodoc


class _DeleteMeal implements DietMealEvent {
  const _DeleteMeal(this.dayId, this.id);
  

@override final  int dayId;
 final  int id;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteMealCopyWith<_DeleteMeal> get copyWith => __$DeleteMealCopyWithImpl<_DeleteMeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMeal&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,id);

@override
String toString() {
  return 'DietMealEvent.deleteMeal(dayId: $dayId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteMealCopyWith<$Res> implements $DietMealEventCopyWith<$Res> {
  factory _$DeleteMealCopyWith(_DeleteMeal value, $Res Function(_DeleteMeal) _then) = __$DeleteMealCopyWithImpl;
@override @useResult
$Res call({
 int dayId, int id
});




}
/// @nodoc
class __$DeleteMealCopyWithImpl<$Res>
    implements _$DeleteMealCopyWith<$Res> {
  __$DeleteMealCopyWithImpl(this._self, this._then);

  final _DeleteMeal _self;
  final $Res Function(_DeleteMeal) _then;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? id = null,}) {
  return _then(_DeleteMeal(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderMeals implements DietMealEvent {
  const _ReorderMeals(this.dayId, final  List<DietMeal> meals): _meals = meals;
  

@override final  int dayId;
 final  List<DietMeal> _meals;
 List<DietMeal> get meals {
  if (_meals is EqualUnmodifiableListView) return _meals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meals);
}


/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderMealsCopyWith<_ReorderMeals> get copyWith => __$ReorderMealsCopyWithImpl<_ReorderMeals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderMeals&&(identical(other.dayId, dayId) || other.dayId == dayId)&&const DeepCollectionEquality().equals(other._meals, _meals));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,const DeepCollectionEquality().hash(_meals));

@override
String toString() {
  return 'DietMealEvent.reorderMeals(dayId: $dayId, meals: $meals)';
}


}

/// @nodoc
abstract mixin class _$ReorderMealsCopyWith<$Res> implements $DietMealEventCopyWith<$Res> {
  factory _$ReorderMealsCopyWith(_ReorderMeals value, $Res Function(_ReorderMeals) _then) = __$ReorderMealsCopyWithImpl;
@override @useResult
$Res call({
 int dayId, List<DietMeal> meals
});




}
/// @nodoc
class __$ReorderMealsCopyWithImpl<$Res>
    implements _$ReorderMealsCopyWith<$Res> {
  __$ReorderMealsCopyWithImpl(this._self, this._then);

  final _ReorderMeals _self;
  final $Res Function(_ReorderMeals) _then;

/// Create a copy of DietMealEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? meals = null,}) {
  return _then(_ReorderMeals(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,null == meals ? _self._meals : meals // ignore: cast_nullable_to_non_nullable
as List<DietMeal>,
  ));
}


}

/// @nodoc
mixin _$DietMealState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietMealState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietMealState()';
}


}

/// @nodoc
class $DietMealStateCopyWith<$Res>  {
$DietMealStateCopyWith(DietMealState _, $Res Function(DietMealState) __);
}


/// Adds pattern-matching-related methods to [DietMealState].
extension DietMealStatePatterns on DietMealState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DietMeal> meals)?  loaded,TResult Function( Failure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.meals);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DietMeal> meals)  loaded,required TResult Function( Failure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.meals);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DietMeal> meals)?  loaded,TResult? Function( Failure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.meals);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DietMealState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietMealState.initial()';
}


}




/// @nodoc


class _Loading implements DietMealState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietMealState.loading()';
}


}




/// @nodoc


class _Loaded implements DietMealState {
  const _Loaded(final  List<DietMeal> meals): _meals = meals;
  

 final  List<DietMeal> _meals;
 List<DietMeal> get meals {
  if (_meals is EqualUnmodifiableListView) return _meals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meals);
}


/// Create a copy of DietMealState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._meals, _meals));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_meals));

@override
String toString() {
  return 'DietMealState.loaded(meals: $meals)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DietMealStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<DietMeal> meals
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DietMealState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meals = null,}) {
  return _then(_Loaded(
null == meals ? _self._meals : meals // ignore: cast_nullable_to_non_nullable
as List<DietMeal>,
  ));
}


}

/// @nodoc


class _Error implements DietMealState {
  const _Error(this.f);
  

 final  Failure f;

/// Create a copy of DietMealState
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
  return 'DietMealState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DietMealStateCopyWith<$Res> {
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

/// Create a copy of DietMealState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
