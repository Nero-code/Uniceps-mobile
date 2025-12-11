// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlansEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlansEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlansEvent()';
}


}

/// @nodoc
class $PlansEventCopyWith<$Res>  {
$PlansEventCopyWith(PlansEvent _, $Res Function(PlansEvent) __);
}


/// Adds pattern-matching-related methods to [PlansEvent].
extension PlansEventPatterns on PlansEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetPlan value)?  getPlan,TResult Function( _BuyPlan value)?  buyPlan,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPlan() when getPlan != null:
return getPlan(_that);case _BuyPlan() when buyPlan != null:
return buyPlan(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetPlan value)  getPlan,required TResult Function( _BuyPlan value)  buyPlan,}){
final _that = this;
switch (_that) {
case _GetPlan():
return getPlan(_that);case _BuyPlan():
return buyPlan(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetPlan value)?  getPlan,TResult? Function( _BuyPlan value)?  buyPlan,}){
final _that = this;
switch (_that) {
case _GetPlan() when getPlan != null:
return getPlan(_that);case _BuyPlan() when buyPlan != null:
return buyPlan(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getPlan,TResult Function( PlanItem item)?  buyPlan,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPlan() when getPlan != null:
return getPlan();case _BuyPlan() when buyPlan != null:
return buyPlan(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getPlan,required TResult Function( PlanItem item)  buyPlan,}) {final _that = this;
switch (_that) {
case _GetPlan():
return getPlan();case _BuyPlan():
return buyPlan(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getPlan,TResult? Function( PlanItem item)?  buyPlan,}) {final _that = this;
switch (_that) {
case _GetPlan() when getPlan != null:
return getPlan();case _BuyPlan() when buyPlan != null:
return buyPlan(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _GetPlan implements PlansEvent {
  const _GetPlan();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPlan);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlansEvent.getPlan()';
}


}




/// @nodoc


class _BuyPlan implements PlansEvent {
  const _BuyPlan(this.item);
  

 final  PlanItem item;

/// Create a copy of PlansEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyPlanCopyWith<_BuyPlan> get copyWith => __$BuyPlanCopyWithImpl<_BuyPlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyPlan&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'PlansEvent.buyPlan(item: $item)';
}


}

/// @nodoc
abstract mixin class _$BuyPlanCopyWith<$Res> implements $PlansEventCopyWith<$Res> {
  factory _$BuyPlanCopyWith(_BuyPlan value, $Res Function(_BuyPlan) _then) = __$BuyPlanCopyWithImpl;
@useResult
$Res call({
 PlanItem item
});




}
/// @nodoc
class __$BuyPlanCopyWithImpl<$Res>
    implements _$BuyPlanCopyWith<$Res> {
  __$BuyPlanCopyWithImpl(this._self, this._then);

  final _BuyPlan _self;
  final $Res Function(_BuyPlan) _then;

/// Create a copy of PlansEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_BuyPlan(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as PlanItem,
  ));
}


}

/// @nodoc
mixin _$PlansState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlansState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlansState()';
}


}

/// @nodoc
class $PlansStateCopyWith<$Res>  {
$PlansStateCopyWith(PlansState _, $Res Function(PlansState) __);
}


/// Adds pattern-matching-related methods to [PlansState].
extension PlansStatePatterns on PlansState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _BuyPlanAndReset value)?  buyPlanAndReset,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _BuyPlanAndReset() when buyPlanAndReset != null:
return buyPlanAndReset(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _BuyPlanAndReset value)  buyPlanAndReset,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _BuyPlanAndReset():
return buyPlanAndReset(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _BuyPlanAndReset value)?  buyPlanAndReset,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _BuyPlanAndReset() when buyPlanAndReset != null:
return buyPlanAndReset(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Plan p)?  loaded,TResult Function( PaymentResponse paymentResponse)?  buyPlanAndReset,TResult Function( Failure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.p);case _BuyPlanAndReset() when buyPlanAndReset != null:
return buyPlanAndReset(_that.paymentResponse);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Plan p)  loaded,required TResult Function( PaymentResponse paymentResponse)  buyPlanAndReset,required TResult Function( Failure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.p);case _BuyPlanAndReset():
return buyPlanAndReset(_that.paymentResponse);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Plan p)?  loaded,TResult? Function( PaymentResponse paymentResponse)?  buyPlanAndReset,TResult? Function( Failure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.p);case _BuyPlanAndReset() when buyPlanAndReset != null:
return buyPlanAndReset(_that.paymentResponse);case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PlansState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlansState.initial()';
}


}




/// @nodoc


class _Loading implements PlansState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlansState.loading()';
}


}




/// @nodoc


class _Loaded implements PlansState {
  const _Loaded(this.p);
  

 final  Plan p;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.p, p) || other.p == p));
}


@override
int get hashCode => Object.hash(runtimeType,p);

@override
String toString() {
  return 'PlansState.loaded(p: $p)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Plan p
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? p = null,}) {
  return _then(_Loaded(
null == p ? _self.p : p // ignore: cast_nullable_to_non_nullable
as Plan,
  ));
}


}

/// @nodoc


class _BuyPlanAndReset implements PlansState {
  const _BuyPlanAndReset(this.paymentResponse);
  

 final  PaymentResponse paymentResponse;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyPlanAndResetCopyWith<_BuyPlanAndReset> get copyWith => __$BuyPlanAndResetCopyWithImpl<_BuyPlanAndReset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyPlanAndReset&&(identical(other.paymentResponse, paymentResponse) || other.paymentResponse == paymentResponse));
}


@override
int get hashCode => Object.hash(runtimeType,paymentResponse);

@override
String toString() {
  return 'PlansState.buyPlanAndReset(paymentResponse: $paymentResponse)';
}


}

/// @nodoc
abstract mixin class _$BuyPlanAndResetCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$BuyPlanAndResetCopyWith(_BuyPlanAndReset value, $Res Function(_BuyPlanAndReset) _then) = __$BuyPlanAndResetCopyWithImpl;
@useResult
$Res call({
 PaymentResponse paymentResponse
});




}
/// @nodoc
class __$BuyPlanAndResetCopyWithImpl<$Res>
    implements _$BuyPlanAndResetCopyWith<$Res> {
  __$BuyPlanAndResetCopyWithImpl(this._self, this._then);

  final _BuyPlanAndReset _self;
  final $Res Function(_BuyPlanAndReset) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentResponse = null,}) {
  return _then(_BuyPlanAndReset(
null == paymentResponse ? _self.paymentResponse : paymentResponse // ignore: cast_nullable_to_non_nullable
as PaymentResponse,
  ));
}


}

/// @nodoc


class _Error implements PlansState {
  const _Error(this.f);
  

 final  Failure f;

/// Create a copy of PlansState
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
  return 'PlansState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
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

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
