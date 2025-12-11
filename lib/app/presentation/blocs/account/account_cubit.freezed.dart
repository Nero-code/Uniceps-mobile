// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState()';
}


}

/// @nodoc
class $AccountStateCopyWith<$Res>  {
$AccountStateCopyWith(AccountState _, $Res Function(AccountState) __);
}


/// Adds pattern-matching-related methods to [AccountState].
extension AccountStatePatterns on AccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Unauthenticated value)?  unauthenticated,TResult Function( _HasAccount value)?  hasAccount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _HasAccount() when hasAccount != null:
return hasAccount(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Unauthenticated value)  unauthenticated,required TResult Function( _HasAccount value)  hasAccount,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Unauthenticated():
return unauthenticated(_that);case _HasAccount():
return hasAccount(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Unauthenticated value)?  unauthenticated,TResult? Function( _HasAccount value)?  hasAccount,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _HasAccount() when hasAccount != null:
return hasAccount(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  unauthenticated,TResult Function( Account account)?  hasAccount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _HasAccount() when hasAccount != null:
return hasAccount(_that.account);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  unauthenticated,required TResult Function( Account account)  hasAccount,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Unauthenticated():
return unauthenticated();case _HasAccount():
return hasAccount(_that.account);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  unauthenticated,TResult? Function( Account account)?  hasAccount,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _HasAccount() when hasAccount != null:
return hasAccount(_that.account);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AccountState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState.initial()';
}


}




/// @nodoc


class _Unauthenticated implements AccountState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountState.unauthenticated()';
}


}




/// @nodoc


class _HasAccount implements AccountState {
  const _HasAccount(this.account);
  

 final  Account account;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HasAccountCopyWith<_HasAccount> get copyWith => __$HasAccountCopyWithImpl<_HasAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HasAccount&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString() {
  return 'AccountState.hasAccount(account: $account)';
}


}

/// @nodoc
abstract mixin class _$HasAccountCopyWith<$Res> implements $AccountStateCopyWith<$Res> {
  factory _$HasAccountCopyWith(_HasAccount value, $Res Function(_HasAccount) _then) = __$HasAccountCopyWithImpl;
@useResult
$Res call({
 Account account
});




}
/// @nodoc
class __$HasAccountCopyWithImpl<$Res>
    implements _$HasAccountCopyWith<$Res> {
  __$HasAccountCopyWithImpl(this._self, this._then);

  final _HasAccount _self;
  final $Res Function(_HasAccount) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = null,}) {
  return _then(_HasAccount(
null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,
  ));
}


}

// dart format on
