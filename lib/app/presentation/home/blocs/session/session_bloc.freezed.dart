// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent()';
}


}

/// @nodoc
class $SessionEventCopyWith<$Res>  {
$SessionEventCopyWith(SessionEvent _, $Res Function(SessionEvent) __);
}


/// Adds pattern-matching-related methods to [SessionEvent].
extension SessionEventPatterns on SessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetLastActiveSession value)?  getLastActiveSession,TResult Function( _StartSession value)?  startSession,TResult Function( _LogSet value)?  logSet,TResult Function( _StopSession value)?  stopSession,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetLastActiveSession() when getLastActiveSession != null:
return getLastActiveSession(_that);case _StartSession() when startSession != null:
return startSession(_that);case _LogSet() when logSet != null:
return logSet(_that);case _StopSession() when stopSession != null:
return stopSession(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetLastActiveSession value)  getLastActiveSession,required TResult Function( _StartSession value)  startSession,required TResult Function( _LogSet value)  logSet,required TResult Function( _StopSession value)  stopSession,}){
final _that = this;
switch (_that) {
case _GetLastActiveSession():
return getLastActiveSession(_that);case _StartSession():
return startSession(_that);case _LogSet():
return logSet(_that);case _StopSession():
return stopSession(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetLastActiveSession value)?  getLastActiveSession,TResult? Function( _StartSession value)?  startSession,TResult? Function( _LogSet value)?  logSet,TResult? Function( _StopSession value)?  stopSession,}){
final _that = this;
switch (_that) {
case _GetLastActiveSession() when getLastActiveSession != null:
return getLastActiveSession(_that);case _StartSession() when startSession != null:
return startSession(_that);case _LogSet() when logSet != null:
return logSet(_that);case _StopSession() when stopSession != null:
return stopSession(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getLastActiveSession,TResult Function( int dayId,  String dayName)?  startSession,TResult Function( TLog log,  double progress)?  logSet,TResult Function( TSession session,  bool fullSession)?  stopSession,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetLastActiveSession() when getLastActiveSession != null:
return getLastActiveSession();case _StartSession() when startSession != null:
return startSession(_that.dayId,_that.dayName);case _LogSet() when logSet != null:
return logSet(_that.log,_that.progress);case _StopSession() when stopSession != null:
return stopSession(_that.session,_that.fullSession);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getLastActiveSession,required TResult Function( int dayId,  String dayName)  startSession,required TResult Function( TLog log,  double progress)  logSet,required TResult Function( TSession session,  bool fullSession)  stopSession,}) {final _that = this;
switch (_that) {
case _GetLastActiveSession():
return getLastActiveSession();case _StartSession():
return startSession(_that.dayId,_that.dayName);case _LogSet():
return logSet(_that.log,_that.progress);case _StopSession():
return stopSession(_that.session,_that.fullSession);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getLastActiveSession,TResult? Function( int dayId,  String dayName)?  startSession,TResult? Function( TLog log,  double progress)?  logSet,TResult? Function( TSession session,  bool fullSession)?  stopSession,}) {final _that = this;
switch (_that) {
case _GetLastActiveSession() when getLastActiveSession != null:
return getLastActiveSession();case _StartSession() when startSession != null:
return startSession(_that.dayId,_that.dayName);case _LogSet() when logSet != null:
return logSet(_that.log,_that.progress);case _StopSession() when stopSession != null:
return stopSession(_that.session,_that.fullSession);case _:
  return null;

}
}

}

/// @nodoc


class _GetLastActiveSession implements SessionEvent {
  const _GetLastActiveSession();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLastActiveSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionEvent.getLastActiveSession()';
}


}




/// @nodoc


class _StartSession implements SessionEvent {
  const _StartSession(this.dayId, this.dayName);
  

 final  int dayId;
 final  String dayName;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartSessionCopyWith<_StartSession> get copyWith => __$StartSessionCopyWithImpl<_StartSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartSession&&(identical(other.dayId, dayId) || other.dayId == dayId)&&(identical(other.dayName, dayName) || other.dayName == dayName));
}


@override
int get hashCode => Object.hash(runtimeType,dayId,dayName);

@override
String toString() {
  return 'SessionEvent.startSession(dayId: $dayId, dayName: $dayName)';
}


}

/// @nodoc
abstract mixin class _$StartSessionCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$StartSessionCopyWith(_StartSession value, $Res Function(_StartSession) _then) = __$StartSessionCopyWithImpl;
@useResult
$Res call({
 int dayId, String dayName
});




}
/// @nodoc
class __$StartSessionCopyWithImpl<$Res>
    implements _$StartSessionCopyWith<$Res> {
  __$StartSessionCopyWithImpl(this._self, this._then);

  final _StartSession _self;
  final $Res Function(_StartSession) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dayId = null,Object? dayName = null,}) {
  return _then(_StartSession(
null == dayId ? _self.dayId : dayId // ignore: cast_nullable_to_non_nullable
as int,null == dayName ? _self.dayName : dayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LogSet implements SessionEvent {
  const _LogSet(this.log, this.progress);
  

 final  TLog log;
 final  double progress;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogSetCopyWith<_LogSet> get copyWith => __$LogSetCopyWithImpl<_LogSet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogSet&&(identical(other.log, log) || other.log == log)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,log,progress);

@override
String toString() {
  return 'SessionEvent.logSet(log: $log, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$LogSetCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$LogSetCopyWith(_LogSet value, $Res Function(_LogSet) _then) = __$LogSetCopyWithImpl;
@useResult
$Res call({
 TLog log, double progress
});




}
/// @nodoc
class __$LogSetCopyWithImpl<$Res>
    implements _$LogSetCopyWith<$Res> {
  __$LogSetCopyWithImpl(this._self, this._then);

  final _LogSet _self;
  final $Res Function(_LogSet) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? log = null,Object? progress = null,}) {
  return _then(_LogSet(
null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as TLog,null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _StopSession implements SessionEvent {
  const _StopSession(this.session, this.fullSession);
  

 final  TSession session;
 final  bool fullSession;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopSessionCopyWith<_StopSession> get copyWith => __$StopSessionCopyWithImpl<_StopSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopSession&&(identical(other.session, session) || other.session == session)&&(identical(other.fullSession, fullSession) || other.fullSession == fullSession));
}


@override
int get hashCode => Object.hash(runtimeType,session,fullSession);

@override
String toString() {
  return 'SessionEvent.stopSession(session: $session, fullSession: $fullSession)';
}


}

/// @nodoc
abstract mixin class _$StopSessionCopyWith<$Res> implements $SessionEventCopyWith<$Res> {
  factory _$StopSessionCopyWith(_StopSession value, $Res Function(_StopSession) _then) = __$StopSessionCopyWithImpl;
@useResult
$Res call({
 TSession session, bool fullSession
});




}
/// @nodoc
class __$StopSessionCopyWithImpl<$Res>
    implements _$StopSessionCopyWith<$Res> {
  __$StopSessionCopyWithImpl(this._self, this._then);

  final _StopSession _self;
  final $Res Function(_StopSession) _then;

/// Create a copy of SessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? fullSession = null,}) {
  return _then(_StopSession(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as TSession,null == fullSession ? _self.fullSession : fullSession // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState()';
}


}

/// @nodoc
class $SessionStateCopyWith<$Res>  {
$SessionStateCopyWith(SessionState _, $Res Function(SessionState) __);
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _NoActiveSession value)?  noActiveSession,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _NoActiveSession() when noActiveSession != null:
return noActiveSession(_that);case _Loaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _NoActiveSession value)  noActiveSession,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _NoActiveSession():
return noActiveSession(_that);case _Loaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _NoActiveSession value)?  noActiveSession,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _NoActiveSession() when noActiveSession != null:
return noActiveSession(_that);case _Loaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  noActiveSession,TResult Function( TSession session)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _NoActiveSession() when noActiveSession != null:
return noActiveSession();case _Loaded() when loaded != null:
return loaded(_that.session);case _Error() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  noActiveSession,required TResult Function( TSession session)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _NoActiveSession():
return noActiveSession();case _Loaded():
return loaded(_that.session);case _Error():
return error(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  noActiveSession,TResult? Function( TSession session)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _NoActiveSession() when noActiveSession != null:
return noActiveSession();case _Loaded() when loaded != null:
return loaded(_that.session);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SessionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.initial()';
}


}




/// @nodoc


class _Loading implements SessionState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.loading()';
}


}




/// @nodoc


class _NoActiveSession implements SessionState {
  const _NoActiveSession();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoActiveSession);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionState.noActiveSession()';
}


}




/// @nodoc


class _Loaded implements SessionState {
  const _Loaded(this.session);
  

 final  TSession session;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'SessionState.loaded(session: $session)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 TSession session
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(_Loaded(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as TSession,
  ));
}


}

/// @nodoc


class _Error implements SessionState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'SessionState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
