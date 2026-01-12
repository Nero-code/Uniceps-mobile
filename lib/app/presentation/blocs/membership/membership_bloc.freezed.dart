// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MembershipEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembershipEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipEvent()';
}


}

/// @nodoc
class $MembershipEventCopyWith<$Res>  {
$MembershipEventCopyWith(MembershipEvent _, $Res Function(MembershipEvent) __);
}


/// Adds pattern-matching-related methods to [MembershipEvent].
extension MembershipEventPatterns on MembershipEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetCurrentPlan value)?  getCurrentPlan,TResult Function( _NotifyNewMembership value)?  notifyNewMembership,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCurrentPlan() when getCurrentPlan != null:
return getCurrentPlan(_that);case _NotifyNewMembership() when notifyNewMembership != null:
return notifyNewMembership(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetCurrentPlan value)  getCurrentPlan,required TResult Function( _NotifyNewMembership value)  notifyNewMembership,}){
final _that = this;
switch (_that) {
case _GetCurrentPlan():
return getCurrentPlan(_that);case _NotifyNewMembership():
return notifyNewMembership(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetCurrentPlan value)?  getCurrentPlan,TResult? Function( _NotifyNewMembership value)?  notifyNewMembership,}){
final _that = this;
switch (_that) {
case _GetCurrentPlan() when getCurrentPlan != null:
return getCurrentPlan(_that);case _NotifyNewMembership() when notifyNewMembership != null:
return notifyNewMembership(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getCurrentPlan,TResult Function()?  notifyNewMembership,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetCurrentPlan() when getCurrentPlan != null:
return getCurrentPlan();case _NotifyNewMembership() when notifyNewMembership != null:
return notifyNewMembership();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getCurrentPlan,required TResult Function()  notifyNewMembership,}) {final _that = this;
switch (_that) {
case _GetCurrentPlan():
return getCurrentPlan();case _NotifyNewMembership():
return notifyNewMembership();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getCurrentPlan,TResult? Function()?  notifyNewMembership,}) {final _that = this;
switch (_that) {
case _GetCurrentPlan() when getCurrentPlan != null:
return getCurrentPlan();case _NotifyNewMembership() when notifyNewMembership != null:
return notifyNewMembership();case _:
  return null;

}
}

}

/// @nodoc


class _GetCurrentPlan implements MembershipEvent {
  const _GetCurrentPlan();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCurrentPlan);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipEvent.getCurrentPlan()';
}


}




/// @nodoc


class _NotifyNewMembership implements MembershipEvent {
  const _NotifyNewMembership();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotifyNewMembership);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipEvent.notifyNewMembership()';
}


}




/// @nodoc
mixin _$MembershipState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembershipState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipState()';
}


}

/// @nodoc
class $MembershipStateCopyWith<$Res>  {
$MembershipStateCopyWith(MembershipState _, $Res Function(MembershipState) __);
}


/// Adds pattern-matching-related methods to [MembershipState].
extension MembershipStatePatterns on MembershipState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loaded value)?  loaded,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loaded value)  loaded,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loaded():
return loaded(_that);case _Loading():
return loading(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Membership m)?  loaded,TResult Function()?  loading,TResult Function( MembershipFailure f)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.m);case _Loading() when loading != null:
return loading();case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Membership m)  loaded,required TResult Function()  loading,required TResult Function( MembershipFailure f)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loaded():
return loaded(_that.m);case _Loading():
return loading();case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Membership m)?  loaded,TResult? Function()?  loading,TResult? Function( MembershipFailure f)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loaded() when loaded != null:
return loaded(_that.m);case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.f);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MembershipState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipState.initial()';
}


}




/// @nodoc


class _Loaded implements MembershipState {
  const _Loaded(this.m);
  

 final  Membership m;

/// Create a copy of MembershipState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.m, m) || other.m == m));
}


@override
int get hashCode => Object.hash(runtimeType,m);

@override
String toString() {
  return 'MembershipState.loaded(m: $m)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $MembershipStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Membership m
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of MembershipState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? m = null,}) {
  return _then(_Loaded(
null == m ? _self.m : m // ignore: cast_nullable_to_non_nullable
as Membership,
  ));
}


}

/// @nodoc


class _Loading implements MembershipState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipState.loading()';
}


}




/// @nodoc


class _Error implements MembershipState {
  const _Error(this.f);
  

 final  MembershipFailure f;

/// Create a copy of MembershipState
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
  return 'MembershipState.error(f: $f)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MembershipStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 MembershipFailure f
});


$MembershipFailureCopyWith<$Res> get f;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MembershipState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? f = null,}) {
  return _then(_Error(
null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as MembershipFailure,
  ));
}

/// Create a copy of MembershipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MembershipFailureCopyWith<$Res> get f {
  
  return $MembershipFailureCopyWith<$Res>(_self.f, (value) {
    return _then(_self.copyWith(f: value));
  });
}
}

// dart format on
