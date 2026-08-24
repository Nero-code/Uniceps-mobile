// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientsEvent()';
}


}

/// @nodoc
class $IngredientsEventCopyWith<$Res>  {
$IngredientsEventCopyWith(IngredientsEvent _, $Res Function(IngredientsEvent) __);
}


/// Adds pattern-matching-related methods to [IngredientsEvent].
extension IngredientsEventPatterns on IngredientsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Filter value)?  filter,TResult Function( _CreateIngredient value)?  createIngredient,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Filter() when filter != null:
return filter(_that);case _CreateIngredient() when createIngredient != null:
return createIngredient(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Filter value)  filter,required TResult Function( _CreateIngredient value)  createIngredient,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Filter():
return filter(_that);case _CreateIngredient():
return createIngredient(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Filter value)?  filter,TResult? Function( _CreateIngredient value)?  createIngredient,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Filter() when filter != null:
return filter(_that);case _CreateIngredient() when createIngredient != null:
return createIngredient(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String search,  int? catId)?  filter,TResult Function( Ingredient ingredient)?  createIngredient,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Filter() when filter != null:
return filter(_that.search,_that.catId);case _CreateIngredient() when createIngredient != null:
return createIngredient(_that.ingredient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String search,  int? catId)  filter,required TResult Function( Ingredient ingredient)  createIngredient,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Filter():
return filter(_that.search,_that.catId);case _CreateIngredient():
return createIngredient(_that.ingredient);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String search,  int? catId)?  filter,TResult? Function( Ingredient ingredient)?  createIngredient,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Filter() when filter != null:
return filter(_that.search,_that.catId);case _CreateIngredient() when createIngredient != null:
return createIngredient(_that.ingredient);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements IngredientsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientsEvent.started()';
}


}




/// @nodoc


class _Filter implements IngredientsEvent {
  const _Filter({this.search = '', this.catId});
  

@JsonKey() final  String search;
 final  int? catId;

/// Create a copy of IngredientsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterCopyWith<_Filter> get copyWith => __$FilterCopyWithImpl<_Filter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Filter&&(identical(other.search, search) || other.search == search)&&(identical(other.catId, catId) || other.catId == catId));
}


@override
int get hashCode => Object.hash(runtimeType,search,catId);

@override
String toString() {
  return 'IngredientsEvent.filter(search: $search, catId: $catId)';
}


}

/// @nodoc
abstract mixin class _$FilterCopyWith<$Res> implements $IngredientsEventCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) _then) = __$FilterCopyWithImpl;
@useResult
$Res call({
 String search, int? catId
});




}
/// @nodoc
class __$FilterCopyWithImpl<$Res>
    implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(this._self, this._then);

  final _Filter _self;
  final $Res Function(_Filter) _then;

/// Create a copy of IngredientsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? search = null,Object? catId = freezed,}) {
  return _then(_Filter(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,catId: freezed == catId ? _self.catId : catId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _CreateIngredient implements IngredientsEvent {
  const _CreateIngredient({required this.ingredient});
  

 final  Ingredient ingredient;

/// Create a copy of IngredientsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateIngredientCopyWith<_CreateIngredient> get copyWith => __$CreateIngredientCopyWithImpl<_CreateIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateIngredient&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}


@override
int get hashCode => Object.hash(runtimeType,ingredient);

@override
String toString() {
  return 'IngredientsEvent.createIngredient(ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class _$CreateIngredientCopyWith<$Res> implements $IngredientsEventCopyWith<$Res> {
  factory _$CreateIngredientCopyWith(_CreateIngredient value, $Res Function(_CreateIngredient) _then) = __$CreateIngredientCopyWithImpl;
@useResult
$Res call({
 Ingredient ingredient
});




}
/// @nodoc
class __$CreateIngredientCopyWithImpl<$Res>
    implements _$CreateIngredientCopyWith<$Res> {
  __$CreateIngredientCopyWithImpl(this._self, this._then);

  final _CreateIngredient _self;
  final $Res Function(_CreateIngredient) _then;

/// Create a copy of IngredientsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredient = null,}) {
  return _then(_CreateIngredient(
ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as Ingredient,
  ));
}


}

/// @nodoc
mixin _$IngredientsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientsState()';
}


}

/// @nodoc
class $IngredientsStateCopyWith<$Res>  {
$IngredientsStateCopyWith(IngredientsState _, $Res Function(IngredientsState) __);
}


/// Adds pattern-matching-related methods to [IngredientsState].
extension IngredientsStatePatterns on IngredientsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Ingredient> ingredients,  List<DietCategory> categories)?  success,TResult Function( IngredientFailure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.ingredients,_that.categories);case _Failure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Ingredient> ingredients,  List<DietCategory> categories)  success,required TResult Function( IngredientFailure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.ingredients,_that.categories);case _Failure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Ingredient> ingredients,  List<DietCategory> categories)?  success,TResult? Function( IngredientFailure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.ingredients,_that.categories);case _Failure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements IngredientsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientsState.initial()';
}


}




/// @nodoc


class _Loading implements IngredientsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientsState.loading()';
}


}




/// @nodoc


class _Success implements IngredientsState {
  const _Success({required final  List<Ingredient> ingredients, required final  List<DietCategory> categories}): _ingredients = ingredients,_categories = categories;
  

 final  List<Ingredient> _ingredients;
 List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<DietCategory> _categories;
 List<DietCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of IngredientsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'IngredientsState.success(ingredients: $ingredients, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $IngredientsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<Ingredient> ingredients, List<DietCategory> categories
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of IngredientsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ingredients = null,Object? categories = null,}) {
  return _then(_Success(
ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<DietCategory>,
  ));
}


}

/// @nodoc


class _Failure implements IngredientsState {
  const _Failure({required this.failure});
  

 final  IngredientFailure failure;

/// Create a copy of IngredientsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'IngredientsState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $IngredientsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 IngredientFailure failure
});


$IngredientFailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of IngredientsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as IngredientFailure,
  ));
}

/// Create a copy of IngredientsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientFailureCopyWith<$Res> get failure {
  
  return $IngredientFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
