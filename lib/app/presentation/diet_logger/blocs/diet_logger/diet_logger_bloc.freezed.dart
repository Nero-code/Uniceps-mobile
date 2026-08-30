// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_logger_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DietLoggerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietLoggerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietLoggerEvent()';
}


}

/// @nodoc
class $DietLoggerEventCopyWith<$Res>  {
$DietLoggerEventCopyWith(DietLoggerEvent _, $Res Function(DietLoggerEvent) __);
}


/// Adds pattern-matching-related methods to [DietLoggerEvent].
extension DietLoggerEventPatterns on DietLoggerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LogServing value)?  logServing,TResult Function( _DeleteLog value)?  deleteLog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LogServing() when logServing != null:
return logServing(_that);case _DeleteLog() when deleteLog != null:
return deleteLog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LogServing value)  logServing,required TResult Function( _DeleteLog value)  deleteLog,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LogServing():
return logServing(_that);case _DeleteLog():
return deleteLog(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LogServing value)?  logServing,TResult? Function( _DeleteLog value)?  deleteLog,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LogServing() when logServing != null:
return logServing(_that);case _DeleteLog() when deleteLog != null:
return deleteLog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime? date)?  started,TResult Function( DietLog log)?  logServing,TResult Function( DietLog log)?  deleteLog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.date);case _LogServing() when logServing != null:
return logServing(_that.log);case _DeleteLog() when deleteLog != null:
return deleteLog(_that.log);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime? date)  started,required TResult Function( DietLog log)  logServing,required TResult Function( DietLog log)  deleteLog,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.date);case _LogServing():
return logServing(_that.log);case _DeleteLog():
return deleteLog(_that.log);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime? date)?  started,TResult? Function( DietLog log)?  logServing,TResult? Function( DietLog log)?  deleteLog,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.date);case _LogServing() when logServing != null:
return logServing(_that.log);case _DeleteLog() when deleteLog != null:
return deleteLog(_that.log);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements DietLoggerEvent {
  const _Started({this.date});
  

 final  DateTime? date;

/// Create a copy of DietLoggerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'DietLoggerEvent.started(date: $date)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $DietLoggerEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 DateTime? date
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of DietLoggerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = freezed,}) {
  return _then(_Started(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _LogServing implements DietLoggerEvent {
  const _LogServing({required this.log});
  

 final  DietLog log;

/// Create a copy of DietLoggerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogServingCopyWith<_LogServing> get copyWith => __$LogServingCopyWithImpl<_LogServing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogServing&&(identical(other.log, log) || other.log == log));
}


@override
int get hashCode => Object.hash(runtimeType,log);

@override
String toString() {
  return 'DietLoggerEvent.logServing(log: $log)';
}


}

/// @nodoc
abstract mixin class _$LogServingCopyWith<$Res> implements $DietLoggerEventCopyWith<$Res> {
  factory _$LogServingCopyWith(_LogServing value, $Res Function(_LogServing) _then) = __$LogServingCopyWithImpl;
@useResult
$Res call({
 DietLog log
});




}
/// @nodoc
class __$LogServingCopyWithImpl<$Res>
    implements _$LogServingCopyWith<$Res> {
  __$LogServingCopyWithImpl(this._self, this._then);

  final _LogServing _self;
  final $Res Function(_LogServing) _then;

/// Create a copy of DietLoggerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? log = null,}) {
  return _then(_LogServing(
log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as DietLog,
  ));
}


}

/// @nodoc


class _DeleteLog implements DietLoggerEvent {
  const _DeleteLog({required this.log});
  

 final  DietLog log;

/// Create a copy of DietLoggerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteLogCopyWith<_DeleteLog> get copyWith => __$DeleteLogCopyWithImpl<_DeleteLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteLog&&(identical(other.log, log) || other.log == log));
}


@override
int get hashCode => Object.hash(runtimeType,log);

@override
String toString() {
  return 'DietLoggerEvent.deleteLog(log: $log)';
}


}

/// @nodoc
abstract mixin class _$DeleteLogCopyWith<$Res> implements $DietLoggerEventCopyWith<$Res> {
  factory _$DeleteLogCopyWith(_DeleteLog value, $Res Function(_DeleteLog) _then) = __$DeleteLogCopyWithImpl;
@useResult
$Res call({
 DietLog log
});




}
/// @nodoc
class __$DeleteLogCopyWithImpl<$Res>
    implements _$DeleteLogCopyWith<$Res> {
  __$DeleteLogCopyWithImpl(this._self, this._then);

  final _DeleteLog _self;
  final $Res Function(_DeleteLog) _then;

/// Create a copy of DietLoggerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? log = null,}) {
  return _then(_DeleteLog(
log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as DietLog,
  ));
}


}

/// @nodoc
mixin _$DietLoggerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietLoggerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietLoggerState()';
}


}

/// @nodoc
class $DietLoggerStateCopyWith<$Res>  {
$DietLoggerStateCopyWith(DietLoggerState _, $Res Function(DietLoggerState) __);
}


/// Adds pattern-matching-related methods to [DietLoggerState].
extension DietLoggerStatePatterns on DietLoggerState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DietLog> logs)?  success,TResult Function( DietLogFailure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.logs);case _Failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DietLog> logs)  success,required TResult Function( DietLogFailure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.logs);case _Failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DietLog> logs)?  success,TResult? Function( DietLogFailure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.logs);case _Failure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DietLoggerState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietLoggerState.initial()';
}


}




/// @nodoc


class _Loading implements DietLoggerState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietLoggerState.loading()';
}


}




/// @nodoc


class _Success implements DietLoggerState {
  const _Success({required final  List<DietLog> logs}): _logs = logs;
  

 final  List<DietLog> _logs;
 List<DietLog> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of DietLoggerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._logs, _logs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'DietLoggerState.success(logs: $logs)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $DietLoggerStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<DietLog> logs
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of DietLoggerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? logs = null,}) {
  return _then(_Success(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<DietLog>,
  ));
}


}

/// @nodoc


class _Failure implements DietLoggerState {
  const _Failure({required this.failure});
  

 final  DietLogFailure failure;

/// Create a copy of DietLoggerState
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
  return 'DietLoggerState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $DietLoggerStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 DietLogFailure failure
});


$DietLogFailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of DietLoggerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as DietLogFailure,
  ));
}

/// Create a copy of DietLoggerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DietLogFailureCopyWith<$Res> get failure {
  
  return $DietLogFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
