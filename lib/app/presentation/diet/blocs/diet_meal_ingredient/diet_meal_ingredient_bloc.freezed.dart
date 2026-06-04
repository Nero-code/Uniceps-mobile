// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_meal_ingredient_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DietMealIngredientEvent {

 int get mealId;
/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DietMealIngredientEventCopyWith<DietMealIngredientEvent> get copyWith => _$DietMealIngredientEventCopyWithImpl<DietMealIngredientEvent>(this as DietMealIngredientEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietMealIngredientEvent&&(identical(other.mealId, mealId) || other.mealId == mealId));
}


@override
int get hashCode => Object.hash(runtimeType,mealId);

@override
String toString() {
  return 'DietMealIngredientEvent(mealId: $mealId)';
}


}

/// @nodoc
abstract mixin class $DietMealIngredientEventCopyWith<$Res>  {
  factory $DietMealIngredientEventCopyWith(DietMealIngredientEvent value, $Res Function(DietMealIngredientEvent) _then) = _$DietMealIngredientEventCopyWithImpl;
@useResult
$Res call({
 int mealId
});




}
/// @nodoc
class _$DietMealIngredientEventCopyWithImpl<$Res>
    implements $DietMealIngredientEventCopyWith<$Res> {
  _$DietMealIngredientEventCopyWithImpl(this._self, this._then);

  final DietMealIngredientEvent _self;
  final $Res Function(DietMealIngredientEvent) _then;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mealId = null,}) {
  return _then(_self.copyWith(
mealId: null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DietMealIngredientEvent].
extension DietMealIngredientEventPatterns on DietMealIngredientEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetIngredients value)?  getIngredients,TResult Function( _AddIngredient value)?  addIngredient,TResult Function( _AddIngredients value)?  addIngredients,TResult Function( _UpdateIngredient value)?  updateIngredient,TResult Function( _DeleteIngredient value)?  deleteIngredient,TResult Function( _ReorderIngredients value)?  reorderIngredients,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetIngredients() when getIngredients != null:
return getIngredients(_that);case _AddIngredient() when addIngredient != null:
return addIngredient(_that);case _AddIngredients() when addIngredients != null:
return addIngredients(_that);case _UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that);case _DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that);case _ReorderIngredients() when reorderIngredients != null:
return reorderIngredients(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetIngredients value)  getIngredients,required TResult Function( _AddIngredient value)  addIngredient,required TResult Function( _AddIngredients value)  addIngredients,required TResult Function( _UpdateIngredient value)  updateIngredient,required TResult Function( _DeleteIngredient value)  deleteIngredient,required TResult Function( _ReorderIngredients value)  reorderIngredients,}){
final _that = this;
switch (_that) {
case _GetIngredients():
return getIngredients(_that);case _AddIngredient():
return addIngredient(_that);case _AddIngredients():
return addIngredients(_that);case _UpdateIngredient():
return updateIngredient(_that);case _DeleteIngredient():
return deleteIngredient(_that);case _ReorderIngredients():
return reorderIngredients(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetIngredients value)?  getIngredients,TResult? Function( _AddIngredient value)?  addIngredient,TResult? Function( _AddIngredients value)?  addIngredients,TResult? Function( _UpdateIngredient value)?  updateIngredient,TResult? Function( _DeleteIngredient value)?  deleteIngredient,TResult? Function( _ReorderIngredients value)?  reorderIngredients,}){
final _that = this;
switch (_that) {
case _GetIngredients() when getIngredients != null:
return getIngredients(_that);case _AddIngredient() when addIngredient != null:
return addIngredient(_that);case _AddIngredients() when addIngredients != null:
return addIngredients(_that);case _UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that);case _DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that);case _ReorderIngredients() when reorderIngredients != null:
return reorderIngredients(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int mealId)?  getIngredients,TResult Function( int mealId,  DietMealIngredient ingredient)?  addIngredient,TResult Function( int mealId,  List<DietMealIngredient> ingredients)?  addIngredients,TResult Function( int mealId,  DietMealIngredient ingredient)?  updateIngredient,TResult Function( int mealId,  int id)?  deleteIngredient,TResult Function( int mealId,  List<DietMealIngredient> ingredients)?  reorderIngredients,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetIngredients() when getIngredients != null:
return getIngredients(_that.mealId);case _AddIngredient() when addIngredient != null:
return addIngredient(_that.mealId,_that.ingredient);case _AddIngredients() when addIngredients != null:
return addIngredients(_that.mealId,_that.ingredients);case _UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that.mealId,_that.ingredient);case _DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that.mealId,_that.id);case _ReorderIngredients() when reorderIngredients != null:
return reorderIngredients(_that.mealId,_that.ingredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int mealId)  getIngredients,required TResult Function( int mealId,  DietMealIngredient ingredient)  addIngredient,required TResult Function( int mealId,  List<DietMealIngredient> ingredients)  addIngredients,required TResult Function( int mealId,  DietMealIngredient ingredient)  updateIngredient,required TResult Function( int mealId,  int id)  deleteIngredient,required TResult Function( int mealId,  List<DietMealIngredient> ingredients)  reorderIngredients,}) {final _that = this;
switch (_that) {
case _GetIngredients():
return getIngredients(_that.mealId);case _AddIngredient():
return addIngredient(_that.mealId,_that.ingredient);case _AddIngredients():
return addIngredients(_that.mealId,_that.ingredients);case _UpdateIngredient():
return updateIngredient(_that.mealId,_that.ingredient);case _DeleteIngredient():
return deleteIngredient(_that.mealId,_that.id);case _ReorderIngredients():
return reorderIngredients(_that.mealId,_that.ingredients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int mealId)?  getIngredients,TResult? Function( int mealId,  DietMealIngredient ingredient)?  addIngredient,TResult? Function( int mealId,  List<DietMealIngredient> ingredients)?  addIngredients,TResult? Function( int mealId,  DietMealIngredient ingredient)?  updateIngredient,TResult? Function( int mealId,  int id)?  deleteIngredient,TResult? Function( int mealId,  List<DietMealIngredient> ingredients)?  reorderIngredients,}) {final _that = this;
switch (_that) {
case _GetIngredients() when getIngredients != null:
return getIngredients(_that.mealId);case _AddIngredient() when addIngredient != null:
return addIngredient(_that.mealId,_that.ingredient);case _AddIngredients() when addIngredients != null:
return addIngredients(_that.mealId,_that.ingredients);case _UpdateIngredient() when updateIngredient != null:
return updateIngredient(_that.mealId,_that.ingredient);case _DeleteIngredient() when deleteIngredient != null:
return deleteIngredient(_that.mealId,_that.id);case _ReorderIngredients() when reorderIngredients != null:
return reorderIngredients(_that.mealId,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc


class _GetIngredients implements DietMealIngredientEvent {
  const _GetIngredients(this.mealId);
  

@override final  int mealId;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetIngredientsCopyWith<_GetIngredients> get copyWith => __$GetIngredientsCopyWithImpl<_GetIngredients>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetIngredients&&(identical(other.mealId, mealId) || other.mealId == mealId));
}


@override
int get hashCode => Object.hash(runtimeType,mealId);

@override
String toString() {
  return 'DietMealIngredientEvent.getIngredients(mealId: $mealId)';
}


}

/// @nodoc
abstract mixin class _$GetIngredientsCopyWith<$Res> implements $DietMealIngredientEventCopyWith<$Res> {
  factory _$GetIngredientsCopyWith(_GetIngredients value, $Res Function(_GetIngredients) _then) = __$GetIngredientsCopyWithImpl;
@override @useResult
$Res call({
 int mealId
});




}
/// @nodoc
class __$GetIngredientsCopyWithImpl<$Res>
    implements _$GetIngredientsCopyWith<$Res> {
  __$GetIngredientsCopyWithImpl(this._self, this._then);

  final _GetIngredients _self;
  final $Res Function(_GetIngredients) _then;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mealId = null,}) {
  return _then(_GetIngredients(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddIngredient implements DietMealIngredientEvent {
  const _AddIngredient(this.mealId, this.ingredient);
  

@override final  int mealId;
 final  DietMealIngredient ingredient;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddIngredientCopyWith<_AddIngredient> get copyWith => __$AddIngredientCopyWithImpl<_AddIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddIngredient&&(identical(other.mealId, mealId) || other.mealId == mealId)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}


@override
int get hashCode => Object.hash(runtimeType,mealId,ingredient);

@override
String toString() {
  return 'DietMealIngredientEvent.addIngredient(mealId: $mealId, ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class _$AddIngredientCopyWith<$Res> implements $DietMealIngredientEventCopyWith<$Res> {
  factory _$AddIngredientCopyWith(_AddIngredient value, $Res Function(_AddIngredient) _then) = __$AddIngredientCopyWithImpl;
@override @useResult
$Res call({
 int mealId, DietMealIngredient ingredient
});




}
/// @nodoc
class __$AddIngredientCopyWithImpl<$Res>
    implements _$AddIngredientCopyWith<$Res> {
  __$AddIngredientCopyWithImpl(this._self, this._then);

  final _AddIngredient _self;
  final $Res Function(_AddIngredient) _then;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mealId = null,Object? ingredient = null,}) {
  return _then(_AddIngredient(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as DietMealIngredient,
  ));
}


}

/// @nodoc


class _AddIngredients implements DietMealIngredientEvent {
  const _AddIngredients(this.mealId, final  List<DietMealIngredient> ingredients): _ingredients = ingredients;
  

@override final  int mealId;
 final  List<DietMealIngredient> _ingredients;
 List<DietMealIngredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddIngredientsCopyWith<_AddIngredients> get copyWith => __$AddIngredientsCopyWithImpl<_AddIngredients>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddIngredients&&(identical(other.mealId, mealId) || other.mealId == mealId)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,mealId,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'DietMealIngredientEvent.addIngredients(mealId: $mealId, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$AddIngredientsCopyWith<$Res> implements $DietMealIngredientEventCopyWith<$Res> {
  factory _$AddIngredientsCopyWith(_AddIngredients value, $Res Function(_AddIngredients) _then) = __$AddIngredientsCopyWithImpl;
@override @useResult
$Res call({
 int mealId, List<DietMealIngredient> ingredients
});




}
/// @nodoc
class __$AddIngredientsCopyWithImpl<$Res>
    implements _$AddIngredientsCopyWith<$Res> {
  __$AddIngredientsCopyWithImpl(this._self, this._then);

  final _AddIngredients _self;
  final $Res Function(_AddIngredients) _then;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mealId = null,Object? ingredients = null,}) {
  return _then(_AddIngredients(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<DietMealIngredient>,
  ));
}


}

/// @nodoc


class _UpdateIngredient implements DietMealIngredientEvent {
  const _UpdateIngredient(this.mealId, this.ingredient);
  

@override final  int mealId;
 final  DietMealIngredient ingredient;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateIngredientCopyWith<_UpdateIngredient> get copyWith => __$UpdateIngredientCopyWithImpl<_UpdateIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateIngredient&&(identical(other.mealId, mealId) || other.mealId == mealId)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}


@override
int get hashCode => Object.hash(runtimeType,mealId,ingredient);

@override
String toString() {
  return 'DietMealIngredientEvent.updateIngredient(mealId: $mealId, ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class _$UpdateIngredientCopyWith<$Res> implements $DietMealIngredientEventCopyWith<$Res> {
  factory _$UpdateIngredientCopyWith(_UpdateIngredient value, $Res Function(_UpdateIngredient) _then) = __$UpdateIngredientCopyWithImpl;
@override @useResult
$Res call({
 int mealId, DietMealIngredient ingredient
});




}
/// @nodoc
class __$UpdateIngredientCopyWithImpl<$Res>
    implements _$UpdateIngredientCopyWith<$Res> {
  __$UpdateIngredientCopyWithImpl(this._self, this._then);

  final _UpdateIngredient _self;
  final $Res Function(_UpdateIngredient) _then;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mealId = null,Object? ingredient = null,}) {
  return _then(_UpdateIngredient(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as DietMealIngredient,
  ));
}


}

/// @nodoc


class _DeleteIngredient implements DietMealIngredientEvent {
  const _DeleteIngredient(this.mealId, this.id);
  

@override final  int mealId;
 final  int id;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteIngredientCopyWith<_DeleteIngredient> get copyWith => __$DeleteIngredientCopyWithImpl<_DeleteIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteIngredient&&(identical(other.mealId, mealId) || other.mealId == mealId)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,mealId,id);

@override
String toString() {
  return 'DietMealIngredientEvent.deleteIngredient(mealId: $mealId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteIngredientCopyWith<$Res> implements $DietMealIngredientEventCopyWith<$Res> {
  factory _$DeleteIngredientCopyWith(_DeleteIngredient value, $Res Function(_DeleteIngredient) _then) = __$DeleteIngredientCopyWithImpl;
@override @useResult
$Res call({
 int mealId, int id
});




}
/// @nodoc
class __$DeleteIngredientCopyWithImpl<$Res>
    implements _$DeleteIngredientCopyWith<$Res> {
  __$DeleteIngredientCopyWithImpl(this._self, this._then);

  final _DeleteIngredient _self;
  final $Res Function(_DeleteIngredient) _then;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mealId = null,Object? id = null,}) {
  return _then(_DeleteIngredient(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReorderIngredients implements DietMealIngredientEvent {
  const _ReorderIngredients(this.mealId, final  List<DietMealIngredient> ingredients): _ingredients = ingredients;
  

@override final  int mealId;
 final  List<DietMealIngredient> _ingredients;
 List<DietMealIngredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderIngredientsCopyWith<_ReorderIngredients> get copyWith => __$ReorderIngredientsCopyWithImpl<_ReorderIngredients>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderIngredients&&(identical(other.mealId, mealId) || other.mealId == mealId)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,mealId,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'DietMealIngredientEvent.reorderIngredients(mealId: $mealId, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$ReorderIngredientsCopyWith<$Res> implements $DietMealIngredientEventCopyWith<$Res> {
  factory _$ReorderIngredientsCopyWith(_ReorderIngredients value, $Res Function(_ReorderIngredients) _then) = __$ReorderIngredientsCopyWithImpl;
@override @useResult
$Res call({
 int mealId, List<DietMealIngredient> ingredients
});




}
/// @nodoc
class __$ReorderIngredientsCopyWithImpl<$Res>
    implements _$ReorderIngredientsCopyWith<$Res> {
  __$ReorderIngredientsCopyWithImpl(this._self, this._then);

  final _ReorderIngredients _self;
  final $Res Function(_ReorderIngredients) _then;

/// Create a copy of DietMealIngredientEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mealId = null,Object? ingredients = null,}) {
  return _then(_ReorderIngredients(
null == mealId ? _self.mealId : mealId // ignore: cast_nullable_to_non_nullable
as int,null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<DietMealIngredient>,
  ));
}


}

/// @nodoc
mixin _$DietMealIngredientState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietMealIngredientState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietMealIngredientState()';
}


}

/// @nodoc
class $DietMealIngredientStateCopyWith<$Res>  {
$DietMealIngredientStateCopyWith(DietMealIngredientState _, $Res Function(DietMealIngredientState) __);
}


/// Adds pattern-matching-related methods to [DietMealIngredientState].
extension DietMealIngredientStatePatterns on DietMealIngredientState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DietMealIngredient> ingredients)?  loaded,TResult Function( Failure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.ingredients);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DietMealIngredient> ingredients)  loaded,required TResult Function( Failure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.ingredients);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DietMealIngredient> ingredients)?  loaded,TResult? Function( Failure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.ingredients);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DietMealIngredientState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietMealIngredientState.initial()';
}


}




/// @nodoc


class _Loading implements DietMealIngredientState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietMealIngredientState.loading()';
}


}




/// @nodoc


class _Loaded implements DietMealIngredientState {
  const _Loaded(final  List<DietMealIngredient> ingredients): _ingredients = ingredients;
  

 final  List<DietMealIngredient> _ingredients;
 List<DietMealIngredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of DietMealIngredientState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'DietMealIngredientState.loaded(ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DietMealIngredientStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<DietMealIngredient> ingredients
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DietMealIngredientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredients = null,}) {
  return _then(_Loaded(
null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<DietMealIngredient>,
  ));
}


}

/// @nodoc


class _Error implements DietMealIngredientState {
  const _Error(this.f);
  

 final  Failure f;

/// Create a copy of DietMealIngredientState
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
  return 'DietMealIngredientState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DietMealIngredientStateCopyWith<$Res> {
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

/// Create a copy of DietMealIngredientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
