// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DietEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietEvent()';
}


}

/// @nodoc
class $DietEventCopyWith<$Res>  {
$DietEventCopyWith(DietEvent _, $Res Function(DietEvent) __);
}


/// Adds pattern-matching-related methods to [DietEvent].
extension DietEventPatterns on DietEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetDietData value)?  getDietData,TResult Function( _AddDietPlan value)?  addDietPlan,TResult Function( _UpdateDietPlan value)?  updateDietPlan,TResult Function( _DeleteDietPlan value)?  deleteDietPlan,TResult Function( _SetCurrentDietPlan value)?  setCurrentDietPlan,TResult Function( _AddDietDay value)?  addDietDay,TResult Function( _UpdateDietDay value)?  updateDietDay,TResult Function( _DeleteDietDay value)?  deleteDietDay,TResult Function( _ReorderDietDays value)?  reorderDietDays,TResult Function( _AddDietMeal value)?  addDietMeal,TResult Function( _UpdateDietMeal value)?  updateDietMeal,TResult Function( _DeleteDietMeal value)?  deleteDietMeal,TResult Function( _ReorderDietMeals value)?  reorderDietMeals,TResult Function( _AddMealIngredient value)?  addMealIngredient,TResult Function( _UpdateMealIngredient value)?  updateMealIngredient,TResult Function( _DeleteMealIngredient value)?  deleteMealIngredient,TResult Function( _ReorderMealIngredients value)?  reorderMealIngredients,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetDietData() when getDietData != null:
return getDietData(_that);case _AddDietPlan() when addDietPlan != null:
return addDietPlan(_that);case _UpdateDietPlan() when updateDietPlan != null:
return updateDietPlan(_that);case _DeleteDietPlan() when deleteDietPlan != null:
return deleteDietPlan(_that);case _SetCurrentDietPlan() when setCurrentDietPlan != null:
return setCurrentDietPlan(_that);case _AddDietDay() when addDietDay != null:
return addDietDay(_that);case _UpdateDietDay() when updateDietDay != null:
return updateDietDay(_that);case _DeleteDietDay() when deleteDietDay != null:
return deleteDietDay(_that);case _ReorderDietDays() when reorderDietDays != null:
return reorderDietDays(_that);case _AddDietMeal() when addDietMeal != null:
return addDietMeal(_that);case _UpdateDietMeal() when updateDietMeal != null:
return updateDietMeal(_that);case _DeleteDietMeal() when deleteDietMeal != null:
return deleteDietMeal(_that);case _ReorderDietMeals() when reorderDietMeals != null:
return reorderDietMeals(_that);case _AddMealIngredient() when addMealIngredient != null:
return addMealIngredient(_that);case _UpdateMealIngredient() when updateMealIngredient != null:
return updateMealIngredient(_that);case _DeleteMealIngredient() when deleteMealIngredient != null:
return deleteMealIngredient(_that);case _ReorderMealIngredients() when reorderMealIngredients != null:
return reorderMealIngredients(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetDietData value)  getDietData,required TResult Function( _AddDietPlan value)  addDietPlan,required TResult Function( _UpdateDietPlan value)  updateDietPlan,required TResult Function( _DeleteDietPlan value)  deleteDietPlan,required TResult Function( _SetCurrentDietPlan value)  setCurrentDietPlan,required TResult Function( _AddDietDay value)  addDietDay,required TResult Function( _UpdateDietDay value)  updateDietDay,required TResult Function( _DeleteDietDay value)  deleteDietDay,required TResult Function( _ReorderDietDays value)  reorderDietDays,required TResult Function( _AddDietMeal value)  addDietMeal,required TResult Function( _UpdateDietMeal value)  updateDietMeal,required TResult Function( _DeleteDietMeal value)  deleteDietMeal,required TResult Function( _ReorderDietMeals value)  reorderDietMeals,required TResult Function( _AddMealIngredient value)  addMealIngredient,required TResult Function( _UpdateMealIngredient value)  updateMealIngredient,required TResult Function( _DeleteMealIngredient value)  deleteMealIngredient,required TResult Function( _ReorderMealIngredients value)  reorderMealIngredients,}){
final _that = this;
switch (_that) {
case _GetDietData():
return getDietData(_that);case _AddDietPlan():
return addDietPlan(_that);case _UpdateDietPlan():
return updateDietPlan(_that);case _DeleteDietPlan():
return deleteDietPlan(_that);case _SetCurrentDietPlan():
return setCurrentDietPlan(_that);case _AddDietDay():
return addDietDay(_that);case _UpdateDietDay():
return updateDietDay(_that);case _DeleteDietDay():
return deleteDietDay(_that);case _ReorderDietDays():
return reorderDietDays(_that);case _AddDietMeal():
return addDietMeal(_that);case _UpdateDietMeal():
return updateDietMeal(_that);case _DeleteDietMeal():
return deleteDietMeal(_that);case _ReorderDietMeals():
return reorderDietMeals(_that);case _AddMealIngredient():
return addMealIngredient(_that);case _UpdateMealIngredient():
return updateMealIngredient(_that);case _DeleteMealIngredient():
return deleteMealIngredient(_that);case _ReorderMealIngredients():
return reorderMealIngredients(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetDietData value)?  getDietData,TResult? Function( _AddDietPlan value)?  addDietPlan,TResult? Function( _UpdateDietPlan value)?  updateDietPlan,TResult? Function( _DeleteDietPlan value)?  deleteDietPlan,TResult? Function( _SetCurrentDietPlan value)?  setCurrentDietPlan,TResult? Function( _AddDietDay value)?  addDietDay,TResult? Function( _UpdateDietDay value)?  updateDietDay,TResult? Function( _DeleteDietDay value)?  deleteDietDay,TResult? Function( _ReorderDietDays value)?  reorderDietDays,TResult? Function( _AddDietMeal value)?  addDietMeal,TResult? Function( _UpdateDietMeal value)?  updateDietMeal,TResult? Function( _DeleteDietMeal value)?  deleteDietMeal,TResult? Function( _ReorderDietMeals value)?  reorderDietMeals,TResult? Function( _AddMealIngredient value)?  addMealIngredient,TResult? Function( _UpdateMealIngredient value)?  updateMealIngredient,TResult? Function( _DeleteMealIngredient value)?  deleteMealIngredient,TResult? Function( _ReorderMealIngredients value)?  reorderMealIngredients,}){
final _that = this;
switch (_that) {
case _GetDietData() when getDietData != null:
return getDietData(_that);case _AddDietPlan() when addDietPlan != null:
return addDietPlan(_that);case _UpdateDietPlan() when updateDietPlan != null:
return updateDietPlan(_that);case _DeleteDietPlan() when deleteDietPlan != null:
return deleteDietPlan(_that);case _SetCurrentDietPlan() when setCurrentDietPlan != null:
return setCurrentDietPlan(_that);case _AddDietDay() when addDietDay != null:
return addDietDay(_that);case _UpdateDietDay() when updateDietDay != null:
return updateDietDay(_that);case _DeleteDietDay() when deleteDietDay != null:
return deleteDietDay(_that);case _ReorderDietDays() when reorderDietDays != null:
return reorderDietDays(_that);case _AddDietMeal() when addDietMeal != null:
return addDietMeal(_that);case _UpdateDietMeal() when updateDietMeal != null:
return updateDietMeal(_that);case _DeleteDietMeal() when deleteDietMeal != null:
return deleteDietMeal(_that);case _ReorderDietMeals() when reorderDietMeals != null:
return reorderDietMeals(_that);case _AddMealIngredient() when addMealIngredient != null:
return addMealIngredient(_that);case _UpdateMealIngredient() when updateMealIngredient != null:
return updateMealIngredient(_that);case _DeleteMealIngredient() when deleteMealIngredient != null:
return deleteMealIngredient(_that);case _ReorderMealIngredients() when reorderMealIngredients != null:
return reorderMealIngredients(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? planId)?  getDietData,TResult Function( DietPlan plan)?  addDietPlan,TResult Function( DietPlan plan)?  updateDietPlan,TResult Function( int id)?  deleteDietPlan,TResult Function( int id)?  setCurrentDietPlan,TResult Function( int planId,  DietDay day)?  addDietDay,TResult Function( DietDay day)?  updateDietDay,TResult Function( int id)?  deleteDietDay,TResult Function( int planId,  List<DietDay> days)?  reorderDietDays,TResult Function( int dayId,  DietMeal meal)?  addDietMeal,TResult Function( DietMeal meal)?  updateDietMeal,TResult Function( int id)?  deleteDietMeal,TResult Function( int dayId,  List<DietMeal> meals)?  reorderDietMeals,TResult Function( int mealId,  DietMealIngredient ingredient)?  addMealIngredient,TResult Function( DietMealIngredient ingredient)?  updateMealIngredient,TResult Function( int id)?  deleteMealIngredient,TResult Function( int mealId,  List<DietMealIngredient> ingredients)?  reorderMealIngredients,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetDietData() when getDietData != null:
return getDietData(_that.planId);case _AddDietPlan() when addDietPlan != null:
return addDietPlan(_that.plan);case _UpdateDietPlan() when updateDietPlan != null:
return updateDietPlan(_that.plan);case _DeleteDietPlan() when deleteDietPlan != null:
return deleteDietPlan(_that.id);case _SetCurrentDietPlan() when setCurrentDietPlan != null:
return setCurrentDietPlan(_that.id);case _AddDietDay() when addDietDay != null:
return addDietDay(_that.planId,_that.day);case _UpdateDietDay() when updateDietDay != null:
return updateDietDay(_that.day);case _DeleteDietDay() when deleteDietDay != null:
return deleteDietDay(_that.id);case _ReorderDietDays() when reorderDietDays != null:
return reorderDietDays(_that.planId,_that.days);case _AddDietMeal() when addDietMeal != null:
return addDietMeal(_that.dayId,_that.meal);case _UpdateDietMeal() when updateDietMeal != null:
return updateDietMeal(_that.meal);case _DeleteDietMeal() when deleteDietMeal != null:
return deleteDietMeal(_that.id);case _ReorderDietMeals() when reorderDietMeals != null:
return reorderDietMeals(_that.dayId,_that.meals);case _AddMealIngredient() when addMealIngredient != null:
return addMealIngredient(_that.mealId,_that.ingredient);case _UpdateMealIngredient() when updateMealIngredient != null:
return updateMealIngredient(_that.ingredient);case _DeleteMealIngredient() when deleteMealIngredient != null:
return deleteMealIngredient(_that.id);case _ReorderMealIngredients() when reorderMealIngredients != null:
return reorderMealIngredients(_that.mealId,_that.ingredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? planId)  getDietData,required TResult Function( DietPlan plan)  addDietPlan,required TResult Function( DietPlan plan)  updateDietPlan,required TResult Function( int id)  deleteDietPlan,required TResult Function( int id)  setCurrentDietPlan,required TResult Function( int planId,  DietDay day)  addDietDay,required TResult Function( DietDay day)  updateDietDay,required TResult Function( int id)  deleteDietDay,required TResult Function( int planId,  List<DietDay> days)  reorderDietDays,required TResult Function( int dayId,  DietMeal meal)  addDietMeal,required TResult Function( DietMeal meal)  updateDietMeal,required TResult Function( int id)  deleteDietMeal,required TResult Function( int dayId,  List<DietMeal> meals)  reorderDietMeals,required TResult Function( int mealId,  DietMealIngredient ingredient)  addMealIngredient,required TResult Function( DietMealIngredient ingredient)  updateMealIngredient,required TResult Function( int id)  deleteMealIngredient,required TResult Function( int mealId,  List<DietMealIngredient> ingredients)  reorderMealIngredients,}) {final _that = this;
switch (_that) {
case _GetDietData():
return getDietData(_that.planId);case _AddDietPlan():
return addDietPlan(_that.plan);case _UpdateDietPlan():
return updateDietPlan(_that.plan);case _DeleteDietPlan():
return deleteDietPlan(_that.id);case _SetCurrentDietPlan():
return setCurrentDietPlan(_that.id);case _AddDietDay():
return addDietDay(_that.planId,_that.day);case _UpdateDietDay():
return updateDietDay(_that.day);case _DeleteDietDay():
return deleteDietDay(_that.id);case _ReorderDietDays():
return reorderDietDays(_that.planId,_that.days);case _AddDietMeal():
return addDietMeal(_that.dayId,_that.meal);case _UpdateDietMeal():
return updateDietMeal(_that.meal);case _DeleteDietMeal():
return deleteDietMeal(_that.id);case _ReorderDietMeals():
return reorderDietMeals(_that.dayId,_that.meals);case _AddMealIngredient():
return addMealIngredient(_that.mealId,_that.ingredient);case _UpdateMealIngredient():
return updateMealIngredient(_that.ingredient);case _DeleteMealIngredient():
return deleteMealIngredient(_that.id);case _ReorderMealIngredients():
return reorderMealIngredients(_that.mealId,_that.ingredients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? planId)?  getDietData,TResult? Function( DietPlan plan)?  addDietPlan,TResult? Function( DietPlan plan)?  updateDietPlan,TResult? Function( int id)?  deleteDietPlan,TResult? Function( int id)?  setCurrentDietPlan,TResult? Function( int planId,  DietDay day)?  addDietDay,TResult? Function( DietDay day)?  updateDietDay,TResult? Function( int id)?  deleteDietDay,TResult? Function( int planId,  List<DietDay> days)?  reorderDietDays,TResult? Function( int dayId,  DietMeal meal)?  addDietMeal,TResult? Function( DietMeal meal)?  updateDietMeal,TResult? Function( int id)?  deleteDietMeal,TResult? Function( int dayId,  List<DietMeal> meals)?  reorderDietMeals,TResult? Function( int mealId,  DietMealIngredient ingredient)?  addMealIngredient,TResult? Function( DietMealIngredient ingredient)?  updateMealIngredient,TResult? Function( int id)?  deleteMealIngredient,TResult? Function( int mealId,  List<DietMealIngredient> ingredients)?  reorderMealIngredients,}) {final _that = this;
switch (_that) {
case _GetDietData() when getDietData != null:
return getDietData(_that.planId);case _AddDietPlan() when addDietPlan != null:
return addDietPlan(_that.plan);case _UpdateDietPlan() when updateDietPlan != null:
return updateDietPlan(_that.plan);case _DeleteDietPlan() when deleteDietPlan != null:
return deleteDietPlan(_that.id);case _SetCurrentDietPlan() when setCurrentDietPlan != null:
return setCurrentDietPlan(_that.id);case _AddDietDay() when addDietDay != null:
return addDietDay(_that.planId,_that.day);case _UpdateDietDay() when updateDietDay != null:
return updateDietDay(_that.day);case _DeleteDietDay() when deleteDietDay != null:
return deleteDietDay(_that.id);case _ReorderDietDays() when reorderDietDays != null:
return reorderDietDays(_that.planId,_that.days);case _AddDietMeal() when addDietMeal != null:
return addDietMeal(_that.dayId,_that.meal);case _UpdateDietMeal() when updateDietMeal != null:
return updateDietMeal(_that.meal);case _DeleteDietMeal() when deleteDietMeal != null:
return deleteDietMeal(_that.id);case _ReorderDietMeals() when reorderDietMeals != null:
return reorderDietMeals(_that.dayId,_that.meals);case _AddMealIngredient() when addMealIngredient != null:
return addMealIngredient(_that.mealId,_that.ingredient);case _UpdateMealIngredient() when updateMealIngredient != null:
return updateMealIngredient(_that.ingredient);case _DeleteMealIngredient() when deleteMealIngredient != null:
return deleteMealIngredient(_that.id);case _ReorderMealIngredients() when reorderMealIngredients != null:
return reorderMealIngredients(_that.mealId,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc


class _GetDietData implements DietEvent {
  const _GetDietData({this.planId});
  

 final  int? planId;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetDietDataCopyWith<_GetDietData> get copyWith => __$GetDietDataCopyWithImpl<_GetDietData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetDietData&&(identical(other.planId, planId) || other.planId == planId));
}


@override
int get hashCode => Object.hash(runtimeType,planId);

@override
String toString() {
  return 'DietEvent.getDietData(planId: $planId)';
}


}

/// @nodoc
abstract mixin class _$GetDietDataCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$GetDietDataCopyWith(_GetDietData value, $Res Function(_GetDietData) _then) = __$GetDietDataCopyWithImpl;
@useResult
$Res call({
 int? planId
});




}
/// @nodoc
class __$GetDietDataCopyWithImpl<$Res>
    implements _$GetDietDataCopyWith<$Res> {
  __$GetDietDataCopyWithImpl(this._self, this._then);

  final _GetDietData _self;
  final $Res Function(_GetDietData) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? planId = freezed,}) {
  return _then(_GetDietData(
planId: freezed == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _AddDietPlan implements DietEvent {
  const _AddDietPlan(this.plan);
  

 final  DietPlan plan;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDietPlanCopyWith<_AddDietPlan> get copyWith => __$AddDietPlanCopyWithImpl<_AddDietPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDietPlan&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'DietEvent.addDietPlan(plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$AddDietPlanCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$AddDietPlanCopyWith(_AddDietPlan value, $Res Function(_AddDietPlan) _then) = __$AddDietPlanCopyWithImpl;
@useResult
$Res call({
 DietPlan plan
});




}
/// @nodoc
class __$AddDietPlanCopyWithImpl<$Res>
    implements _$AddDietPlanCopyWith<$Res> {
  __$AddDietPlanCopyWithImpl(this._self, this._then);

  final _AddDietPlan _self;
  final $Res Function(_AddDietPlan) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(_AddDietPlan(
null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as DietPlan,
  ));
}


}

/// @nodoc


class _UpdateDietPlan implements DietEvent {
  const _UpdateDietPlan(this.plan);
  

 final  DietPlan plan;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDietPlanCopyWith<_UpdateDietPlan> get copyWith => __$UpdateDietPlanCopyWithImpl<_UpdateDietPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDietPlan&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'DietEvent.updateDietPlan(plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$UpdateDietPlanCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$UpdateDietPlanCopyWith(_UpdateDietPlan value, $Res Function(_UpdateDietPlan) _then) = __$UpdateDietPlanCopyWithImpl;
@useResult
$Res call({
 DietPlan plan
});




}
/// @nodoc
class __$UpdateDietPlanCopyWithImpl<$Res>
    implements _$UpdateDietPlanCopyWith<$Res> {
  __$UpdateDietPlanCopyWithImpl(this._self, this._then);

  final _UpdateDietPlan _self;
  final $Res Function(_UpdateDietPlan) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = null,}) {
  return _then(_UpdateDietPlan(
null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as DietPlan,
  ));
}


}

/// @nodoc


class _DeleteDietPlan implements DietEvent {
  const _DeleteDietPlan(this.id);
  

 final  int id;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteDietPlanCopyWith<_DeleteDietPlan> get copyWith => __$DeleteDietPlanCopyWithImpl<_DeleteDietPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteDietPlan&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DietEvent.deleteDietPlan(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteDietPlanCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$DeleteDietPlanCopyWith(_DeleteDietPlan value, $Res Function(_DeleteDietPlan) _then) = __$DeleteDietPlanCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteDietPlanCopyWithImpl<$Res>
    implements _$DeleteDietPlanCopyWith<$Res> {
  __$DeleteDietPlanCopyWithImpl(this._self, this._then);

  final _DeleteDietPlan _self;
  final $Res Function(_DeleteDietPlan) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteDietPlan(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetCurrentDietPlan implements DietEvent {
  const _SetCurrentDietPlan(this.id);
  

 final  int id;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCurrentDietPlanCopyWith<_SetCurrentDietPlan> get copyWith => __$SetCurrentDietPlanCopyWithImpl<_SetCurrentDietPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCurrentDietPlan&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DietEvent.setCurrentDietPlan(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SetCurrentDietPlanCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$SetCurrentDietPlanCopyWith(_SetCurrentDietPlan value, $Res Function(_SetCurrentDietPlan) _then) = __$SetCurrentDietPlanCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$SetCurrentDietPlanCopyWithImpl<$Res>
    implements _$SetCurrentDietPlanCopyWith<$Res> {
  __$SetCurrentDietPlanCopyWithImpl(this._self, this._then);

  final _SetCurrentDietPlan _self;
  final $Res Function(_SetCurrentDietPlan) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_SetCurrentDietPlan(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddDietDay implements DietEvent {
  const _AddDietDay(this.planId, this.day);
  

 final  int planId;
 final  DietDay day;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDietDayCopyWith<_AddDietDay> get copyWith => __$AddDietDayCopyWithImpl<_AddDietDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDietDay&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,planId,day);

@override
String toString() {
  return 'DietEvent.addDietDay(planId: $planId, day: $day)';
}


}

/// @nodoc
abstract mixin class _$AddDietDayCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$AddDietDayCopyWith(_AddDietDay value, $Res Function(_AddDietDay) _then) = __$AddDietDayCopyWithImpl;
@useResult
$Res call({
 int planId, DietDay day
});




}
/// @nodoc
class __$AddDietDayCopyWithImpl<$Res>
    implements _$AddDietDayCopyWith<$Res> {
  __$AddDietDayCopyWithImpl(this._self, this._then);

  final _AddDietDay _self;
  final $Res Function(_AddDietDay) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? day = null,}) {
  return _then(_AddDietDay(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DietDay,
  ));
}


}

/// @nodoc


class _UpdateDietDay implements DietEvent {
  const _UpdateDietDay(this.day);
  

 final  DietDay day;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDietDayCopyWith<_UpdateDietDay> get copyWith => __$UpdateDietDayCopyWithImpl<_UpdateDietDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDietDay&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,day);

@override
String toString() {
  return 'DietEvent.updateDietDay(day: $day)';
}


}

/// @nodoc
abstract mixin class _$UpdateDietDayCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$UpdateDietDayCopyWith(_UpdateDietDay value, $Res Function(_UpdateDietDay) _then) = __$UpdateDietDayCopyWithImpl;
@useResult
$Res call({
 DietDay day
});




}
/// @nodoc
class __$UpdateDietDayCopyWithImpl<$Res>
    implements _$UpdateDietDayCopyWith<$Res> {
  __$UpdateDietDayCopyWithImpl(this._self, this._then);

  final _UpdateDietDay _self;
  final $Res Function(_UpdateDietDay) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? day = null,}) {
  return _then(_UpdateDietDay(
null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DietDay,
  ));
}


}

/// @nodoc


class _DeleteDietDay implements DietEvent {
  const _DeleteDietDay(this.id);
  

 final  int id;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteDietDayCopyWith<_DeleteDietDay> get copyWith => __$DeleteDietDayCopyWithImpl<_DeleteDietDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteDietDay&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DietEvent.deleteDietDay(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteDietDayCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$DeleteDietDayCopyWith(_DeleteDietDay value, $Res Function(_DeleteDietDay) _then) = __$DeleteDietDayCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteDietDayCopyWithImpl<$Res>
    implements _$DeleteDietDayCopyWith<$Res> {
  __$DeleteDietDayCopyWithImpl(this._self, this._then);

  final _DeleteDietDay _self;
  final $Res Function(_DeleteDietDay) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteDietDay(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderDietDays implements DietEvent {
  const _ReorderDietDays(this.planId, final  List<DietDay> days): _days = days;
  

 final  int planId;
 final  List<DietDay> _days;
 List<DietDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderDietDaysCopyWith<_ReorderDietDays> get copyWith => __$ReorderDietDaysCopyWithImpl<_ReorderDietDays>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderDietDays&&(identical(other.planId, planId) || other.planId == planId)&&const DeepCollectionEquality().equals(other._days, _days));
}


@override
int get hashCode => Object.hash(runtimeType,planId,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'DietEvent.reorderDietDays(planId: $planId, days: $days)';
}


}

/// @nodoc
abstract mixin class _$ReorderDietDaysCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$ReorderDietDaysCopyWith(_ReorderDietDays value, $Res Function(_ReorderDietDays) _then) = __$ReorderDietDaysCopyWithImpl;
@useResult
$Res call({
 int planId, List<DietDay> days
});




}
/// @nodoc
class __$ReorderDietDaysCopyWithImpl<$Res>
    implements _$ReorderDietDaysCopyWith<$Res> {
  __$ReorderDietDaysCopyWithImpl(this._self, this._then);

  final _ReorderDietDays _self;
  final $Res Function(_ReorderDietDays) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? days = null,}) {
  return _then(_ReorderDietDays(
null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DietDay>,
  ));
}


}

/// @nodoc


class _AddDietMeal implements DietEvent {
  const _AddDietMeal(this.dayId, this.meal);
  

 final  int dayId;
 final  DietMeal meal;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDietMealCopyWith<_AddDietMeal> get copyWith => __$AddDietMealCopyWithImpl<_AddDietMeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDietMeal&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.meal, meal) || other.meal == meal));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,meal);

@override
String toString() {
  return 'DietEvent.addDietMeal(dayId: $dayId, meal: $meal)';
}


}

/// @nodoc
abstract mixin class _$AddDietMealCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$AddDietMealCopyWith(_AddDietMeal value, $Res Function(_AddDietMeal) _then) = __$AddDietMealCopyWithImpl;
@useResult
$Res call({
 int dayId, DietMeal meal
});




}
/// @nodoc
class __$AddDietMealCopyWithImpl<$Res>
    implements _$AddDietMealCopyWith<$Res> {
  __$AddDietMealCopyWithImpl(this._self, this._then);

  final _AddDietMeal _self;
  final $Res Function(_AddDietMeal) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? meal = null,}) {
  return _then(_AddDietMeal(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,null == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as DietMeal,
  ));
}


}

/// @nodoc


class _UpdateDietMeal implements DietEvent {
  const _UpdateDietMeal(this.meal);
  

 final  DietMeal meal;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDietMealCopyWith<_UpdateDietMeal> get copyWith => __$UpdateDietMealCopyWithImpl<_UpdateDietMeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDietMeal&&(identical(other.meal, meal) || other.meal == meal));
}


@override
int get hashCode => Object.hash(runtimeType,meal);

@override
String toString() {
  return 'DietEvent.updateDietMeal(meal: $meal)';
}


}

/// @nodoc
abstract mixin class _$UpdateDietMealCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$UpdateDietMealCopyWith(_UpdateDietMeal value, $Res Function(_UpdateDietMeal) _then) = __$UpdateDietMealCopyWithImpl;
@useResult
$Res call({
 DietMeal meal
});




}
/// @nodoc
class __$UpdateDietMealCopyWithImpl<$Res>
    implements _$UpdateDietMealCopyWith<$Res> {
  __$UpdateDietMealCopyWithImpl(this._self, this._then);

  final _UpdateDietMeal _self;
  final $Res Function(_UpdateDietMeal) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meal = null,}) {
  return _then(_UpdateDietMeal(
null == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as DietMeal,
  ));
}


}

/// @nodoc


class _DeleteDietMeal implements DietEvent {
  const _DeleteDietMeal(this.id);
  

 final  int id;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteDietMealCopyWith<_DeleteDietMeal> get copyWith => __$DeleteDietMealCopyWithImpl<_DeleteDietMeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteDietMeal&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DietEvent.deleteDietMeal(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteDietMealCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$DeleteDietMealCopyWith(_DeleteDietMeal value, $Res Function(_DeleteDietMeal) _then) = __$DeleteDietMealCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteDietMealCopyWithImpl<$Res>
    implements _$DeleteDietMealCopyWith<$Res> {
  __$DeleteDietMealCopyWithImpl(this._self, this._then);

  final _DeleteDietMeal _self;
  final $Res Function(_DeleteDietMeal) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteDietMeal(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderDietMeals implements DietEvent {
  const _ReorderDietMeals(this.dayId, final  List<DietMeal> meals): _meals = meals;
  

 final  int dayId;
 final  List<DietMeal> _meals;
 List<DietMeal> get meals {
  if (_meals is EqualUnmodifiableListView) return _meals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meals);
}


/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderDietMealsCopyWith<_ReorderDietMeals> get copyWith => __$ReorderDietMealsCopyWithImpl<_ReorderDietMeals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderDietMeals&&(identical(other.dayId, dayId) || other.dayId == dayId)&&const DeepCollectionEquality().equals(other._meals, _meals));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,const DeepCollectionEquality().hash(_meals));

@override
String toString() {
  return 'DietEvent.reorderDietMeals(dayId: $dayId, meals: $meals)';
}


}

/// @nodoc
abstract mixin class _$ReorderDietMealsCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$ReorderDietMealsCopyWith(_ReorderDietMeals value, $Res Function(_ReorderDietMeals) _then) = __$ReorderDietMealsCopyWithImpl;
@useResult
$Res call({
 int dayId, List<DietMeal> meals
});




}
/// @nodoc
class __$ReorderDietMealsCopyWithImpl<$Res>
    implements _$ReorderDietMealsCopyWith<$Res> {
  __$ReorderDietMealsCopyWithImpl(this._self, this._then);

  final _ReorderDietMeals _self;
  final $Res Function(_ReorderDietMeals) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? meals = null,}) {
  return _then(_ReorderDietMeals(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,null == meals ? _self._meals : meals // ignore: cast_nullable_to_non_nullable
as List<DietMeal>,
  ));
}


}

/// @nodoc


class _AddMealIngredient implements DietEvent {
  const _AddMealIngredient(this.mealId, this.ingredient);
  

 final  int mealId;
 final  DietMealIngredient ingredient;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddMealIngredientCopyWith<_AddMealIngredient> get copyWith => __$AddMealIngredientCopyWithImpl<_AddMealIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddMealIngredient&&(identical(other.mealId, mealId) || other.mealId == mealId)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}


@override
int get hashCode => Object.hash(runtimeType,mealId,ingredient);

@override
String toString() {
  return 'DietEvent.addMealIngredient(mealId: $mealId, ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class _$AddMealIngredientCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$AddMealIngredientCopyWith(_AddMealIngredient value, $Res Function(_AddMealIngredient) _then) = __$AddMealIngredientCopyWithImpl;
@useResult
$Res call({
 int mealId, DietMealIngredient ingredient
});




}
/// @nodoc
class __$AddMealIngredientCopyWithImpl<$Res>
    implements _$AddMealIngredientCopyWith<$Res> {
  __$AddMealIngredientCopyWithImpl(this._self, this._then);

  final _AddMealIngredient _self;
  final $Res Function(_AddMealIngredient) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mealId = null,Object? ingredient = null,}) {
  return _then(_AddMealIngredient(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as DietMealIngredient,
  ));
}


}

/// @nodoc


class _UpdateMealIngredient implements DietEvent {
  const _UpdateMealIngredient(this.ingredient);
  

 final  DietMealIngredient ingredient;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMealIngredientCopyWith<_UpdateMealIngredient> get copyWith => __$UpdateMealIngredientCopyWithImpl<_UpdateMealIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMealIngredient&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}


@override
int get hashCode => Object.hash(runtimeType,ingredient);

@override
String toString() {
  return 'DietEvent.updateMealIngredient(ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class _$UpdateMealIngredientCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$UpdateMealIngredientCopyWith(_UpdateMealIngredient value, $Res Function(_UpdateMealIngredient) _then) = __$UpdateMealIngredientCopyWithImpl;
@useResult
$Res call({
 DietMealIngredient ingredient
});




}
/// @nodoc
class __$UpdateMealIngredientCopyWithImpl<$Res>
    implements _$UpdateMealIngredientCopyWith<$Res> {
  __$UpdateMealIngredientCopyWithImpl(this._self, this._then);

  final _UpdateMealIngredient _self;
  final $Res Function(_UpdateMealIngredient) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredient = null,}) {
  return _then(_UpdateMealIngredient(
null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as DietMealIngredient,
  ));
}


}

/// @nodoc


class _DeleteMealIngredient implements DietEvent {
  const _DeleteMealIngredient(this.id);
  

 final  int id;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteMealIngredientCopyWith<_DeleteMealIngredient> get copyWith => __$DeleteMealIngredientCopyWithImpl<_DeleteMealIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMealIngredient&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DietEvent.deleteMealIngredient(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteMealIngredientCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$DeleteMealIngredientCopyWith(_DeleteMealIngredient value, $Res Function(_DeleteMealIngredient) _then) = __$DeleteMealIngredientCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteMealIngredientCopyWithImpl<$Res>
    implements _$DeleteMealIngredientCopyWith<$Res> {
  __$DeleteMealIngredientCopyWithImpl(this._self, this._then);

  final _DeleteMealIngredient _self;
  final $Res Function(_DeleteMealIngredient) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteMealIngredient(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderMealIngredients implements DietEvent {
  const _ReorderMealIngredients(this.mealId, final  List<DietMealIngredient> ingredients): _ingredients = ingredients;
  

 final  int mealId;
 final  List<DietMealIngredient> _ingredients;
 List<DietMealIngredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderMealIngredientsCopyWith<_ReorderMealIngredients> get copyWith => __$ReorderMealIngredientsCopyWithImpl<_ReorderMealIngredients>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderMealIngredients&&(identical(other.mealId, mealId) || other.mealId == mealId)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,mealId,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'DietEvent.reorderMealIngredients(mealId: $mealId, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$ReorderMealIngredientsCopyWith<$Res> implements $DietEventCopyWith<$Res> {
  factory _$ReorderMealIngredientsCopyWith(_ReorderMealIngredients value, $Res Function(_ReorderMealIngredients) _then) = __$ReorderMealIngredientsCopyWithImpl;
@useResult
$Res call({
 int mealId, List<DietMealIngredient> ingredients
});




}
/// @nodoc
class __$ReorderMealIngredientsCopyWithImpl<$Res>
    implements _$ReorderMealIngredientsCopyWith<$Res> {
  __$ReorderMealIngredientsCopyWithImpl(this._self, this._then);

  final _ReorderMealIngredients _self;
  final $Res Function(_ReorderMealIngredients) _then;

/// Create a copy of DietEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mealId = null,Object? ingredients = null,}) {
  return _then(_ReorderMealIngredients(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<DietMealIngredient>,
  ));
}


}

/// @nodoc
mixin _$DietState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietState()';
}


}

/// @nodoc
class $DietStateCopyWith<$Res>  {
$DietStateCopyWith(DietState _, $Res Function(DietState) __);
}


/// Adds pattern-matching-related methods to [DietState].
extension DietStatePatterns on DietState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DietPlan> dietPlans,  DietPlan? currentPlan,  List<DietDay> dietDays,  List<Ingredient> ingredients)?  loaded,TResult Function( Failure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.dietPlans,_that.currentPlan,_that.dietDays,_that.ingredients);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DietPlan> dietPlans,  DietPlan? currentPlan,  List<DietDay> dietDays,  List<Ingredient> ingredients)  loaded,required TResult Function( Failure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.dietPlans,_that.currentPlan,_that.dietDays,_that.ingredients);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DietPlan> dietPlans,  DietPlan? currentPlan,  List<DietDay> dietDays,  List<Ingredient> ingredients)?  loaded,TResult? Function( Failure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.dietPlans,_that.currentPlan,_that.dietDays,_that.ingredients);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DietState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietState.initial()';
}


}




/// @nodoc


class _Loading implements DietState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietState.loading()';
}


}




/// @nodoc


class _Loaded implements DietState {
  const _Loaded({required final  List<DietPlan> dietPlans, required this.currentPlan, required final  List<DietDay> dietDays, required final  List<Ingredient> ingredients}): _dietPlans = dietPlans,_dietDays = dietDays,_ingredients = ingredients;
  

 final  List<DietPlan> _dietPlans;
 List<DietPlan> get dietPlans {
  if (_dietPlans is EqualUnmodifiableListView) return _dietPlans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietPlans);
}

 final  DietPlan? currentPlan;
 final  List<DietDay> _dietDays;
 List<DietDay> get dietDays {
  if (_dietDays is EqualUnmodifiableListView) return _dietDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietDays);
}

 final  List<Ingredient> _ingredients;
 List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of DietState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._dietPlans, _dietPlans)&&(identical(other.currentPlan, currentPlan) || other.currentPlan == currentPlan)&&const DeepCollectionEquality().equals(other._dietDays, _dietDays)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dietPlans),currentPlan,const DeepCollectionEquality().hash(_dietDays),const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'DietState.loaded(dietPlans: $dietPlans, currentPlan: $currentPlan, dietDays: $dietDays, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DietStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<DietPlan> dietPlans, DietPlan? currentPlan, List<DietDay> dietDays, List<Ingredient> ingredients
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DietState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dietPlans = null,Object? currentPlan = freezed,Object? dietDays = null,Object? ingredients = null,}) {
  return _then(_Loaded(
dietPlans: null == dietPlans ? _self._dietPlans : dietPlans // ignore: cast_nullable_to_non_nullable
as List<DietPlan>,currentPlan: freezed == currentPlan ? _self.currentPlan : currentPlan // ignore: cast_nullable_to_non_nullable
as DietPlan?,dietDays: null == dietDays ? _self._dietDays : dietDays // ignore: cast_nullable_to_non_nullable
as List<DietDay>,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}


}

/// @nodoc


class _Error implements DietState {
  const _Error(this.f);
  

 final  Failure f;

/// Create a copy of DietState
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
  return 'DietState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DietStateCopyWith<$Res> {
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

/// Create a copy of DietState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
