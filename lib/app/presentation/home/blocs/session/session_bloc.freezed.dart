// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLastActiveSession,
    required TResult Function(int dayId, String dayName) startSession,
    required TResult Function(TLog log, double progress) logSet,
    required TResult Function(TSession session, bool fullSession) stopSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLastActiveSession,
    TResult? Function(int dayId, String dayName)? startSession,
    TResult? Function(TLog log, double progress)? logSet,
    TResult? Function(TSession session, bool fullSession)? stopSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLastActiveSession,
    TResult Function(int dayId, String dayName)? startSession,
    TResult Function(TLog log, double progress)? logSet,
    TResult Function(TSession session, bool fullSession)? stopSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLastActiveSession value) getLastActiveSession,
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_LogSet value) logSet,
    required TResult Function(_StopSession value) stopSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_LogSet value)? logSet,
    TResult? Function(_StopSession value)? stopSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult Function(_StartSession value)? startSession,
    TResult Function(_LogSet value)? logSet,
    TResult Function(_StopSession value)? stopSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res, SessionEvent>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res, $Val extends SessionEvent>
    implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetLastActiveSessionImplCopyWith<$Res> {
  factory _$$GetLastActiveSessionImplCopyWith(_$GetLastActiveSessionImpl value,
          $Res Function(_$GetLastActiveSessionImpl) then) =
      __$$GetLastActiveSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLastActiveSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$GetLastActiveSessionImpl>
    implements _$$GetLastActiveSessionImplCopyWith<$Res> {
  __$$GetLastActiveSessionImplCopyWithImpl(_$GetLastActiveSessionImpl _value,
      $Res Function(_$GetLastActiveSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLastActiveSessionImpl implements _GetLastActiveSession {
  const _$GetLastActiveSessionImpl();

  @override
  String toString() {
    return 'SessionEvent.getLastActiveSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLastActiveSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLastActiveSession,
    required TResult Function(int dayId, String dayName) startSession,
    required TResult Function(TLog log, double progress) logSet,
    required TResult Function(TSession session, bool fullSession) stopSession,
  }) {
    return getLastActiveSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLastActiveSession,
    TResult? Function(int dayId, String dayName)? startSession,
    TResult? Function(TLog log, double progress)? logSet,
    TResult? Function(TSession session, bool fullSession)? stopSession,
  }) {
    return getLastActiveSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLastActiveSession,
    TResult Function(int dayId, String dayName)? startSession,
    TResult Function(TLog log, double progress)? logSet,
    TResult Function(TSession session, bool fullSession)? stopSession,
    required TResult orElse(),
  }) {
    if (getLastActiveSession != null) {
      return getLastActiveSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLastActiveSession value) getLastActiveSession,
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_LogSet value) logSet,
    required TResult Function(_StopSession value) stopSession,
  }) {
    return getLastActiveSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_LogSet value)? logSet,
    TResult? Function(_StopSession value)? stopSession,
  }) {
    return getLastActiveSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult Function(_StartSession value)? startSession,
    TResult Function(_LogSet value)? logSet,
    TResult Function(_StopSession value)? stopSession,
    required TResult orElse(),
  }) {
    if (getLastActiveSession != null) {
      return getLastActiveSession(this);
    }
    return orElse();
  }
}

abstract class _GetLastActiveSession implements SessionEvent {
  const factory _GetLastActiveSession() = _$GetLastActiveSessionImpl;
}

/// @nodoc
abstract class _$$StartSessionImplCopyWith<$Res> {
  factory _$$StartSessionImplCopyWith(
          _$StartSessionImpl value, $Res Function(_$StartSessionImpl) then) =
      __$$StartSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dayId, String dayName});
}

/// @nodoc
class __$$StartSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$StartSessionImpl>
    implements _$$StartSessionImplCopyWith<$Res> {
  __$$StartSessionImplCopyWithImpl(
      _$StartSessionImpl _value, $Res Function(_$StartSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayId = null,
    Object? dayName = null,
  }) {
    return _then(_$StartSessionImpl(
      null == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int,
      null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartSessionImpl implements _StartSession {
  const _$StartSessionImpl(this.dayId, this.dayName);

  @override
  final int dayId;
  @override
  final String dayName;

  @override
  String toString() {
    return 'SessionEvent.startSession(dayId: $dayId, dayName: $dayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartSessionImpl &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            (identical(other.dayName, dayName) || other.dayName == dayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dayId, dayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartSessionImplCopyWith<_$StartSessionImpl> get copyWith =>
      __$$StartSessionImplCopyWithImpl<_$StartSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLastActiveSession,
    required TResult Function(int dayId, String dayName) startSession,
    required TResult Function(TLog log, double progress) logSet,
    required TResult Function(TSession session, bool fullSession) stopSession,
  }) {
    return startSession(dayId, dayName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLastActiveSession,
    TResult? Function(int dayId, String dayName)? startSession,
    TResult? Function(TLog log, double progress)? logSet,
    TResult? Function(TSession session, bool fullSession)? stopSession,
  }) {
    return startSession?.call(dayId, dayName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLastActiveSession,
    TResult Function(int dayId, String dayName)? startSession,
    TResult Function(TLog log, double progress)? logSet,
    TResult Function(TSession session, bool fullSession)? stopSession,
    required TResult orElse(),
  }) {
    if (startSession != null) {
      return startSession(dayId, dayName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLastActiveSession value) getLastActiveSession,
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_LogSet value) logSet,
    required TResult Function(_StopSession value) stopSession,
  }) {
    return startSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_LogSet value)? logSet,
    TResult? Function(_StopSession value)? stopSession,
  }) {
    return startSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult Function(_StartSession value)? startSession,
    TResult Function(_LogSet value)? logSet,
    TResult Function(_StopSession value)? stopSession,
    required TResult orElse(),
  }) {
    if (startSession != null) {
      return startSession(this);
    }
    return orElse();
  }
}

abstract class _StartSession implements SessionEvent {
  const factory _StartSession(final int dayId, final String dayName) =
      _$StartSessionImpl;

  int get dayId;
  String get dayName;
  @JsonKey(ignore: true)
  _$$StartSessionImplCopyWith<_$StartSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogSetImplCopyWith<$Res> {
  factory _$$LogSetImplCopyWith(
          _$LogSetImpl value, $Res Function(_$LogSetImpl) then) =
      __$$LogSetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TLog log, double progress});
}

/// @nodoc
class __$$LogSetImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$LogSetImpl>
    implements _$$LogSetImplCopyWith<$Res> {
  __$$LogSetImplCopyWithImpl(
      _$LogSetImpl _value, $Res Function(_$LogSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? log = null,
    Object? progress = null,
  }) {
    return _then(_$LogSetImpl(
      null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as TLog,
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LogSetImpl implements _LogSet {
  const _$LogSetImpl(this.log, this.progress);

  @override
  final TLog log;
  @override
  final double progress;

  @override
  String toString() {
    return 'SessionEvent.logSet(log: $log, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogSetImpl &&
            (identical(other.log, log) || other.log == log) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, log, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogSetImplCopyWith<_$LogSetImpl> get copyWith =>
      __$$LogSetImplCopyWithImpl<_$LogSetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLastActiveSession,
    required TResult Function(int dayId, String dayName) startSession,
    required TResult Function(TLog log, double progress) logSet,
    required TResult Function(TSession session, bool fullSession) stopSession,
  }) {
    return logSet(log, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLastActiveSession,
    TResult? Function(int dayId, String dayName)? startSession,
    TResult? Function(TLog log, double progress)? logSet,
    TResult? Function(TSession session, bool fullSession)? stopSession,
  }) {
    return logSet?.call(log, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLastActiveSession,
    TResult Function(int dayId, String dayName)? startSession,
    TResult Function(TLog log, double progress)? logSet,
    TResult Function(TSession session, bool fullSession)? stopSession,
    required TResult orElse(),
  }) {
    if (logSet != null) {
      return logSet(log, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLastActiveSession value) getLastActiveSession,
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_LogSet value) logSet,
    required TResult Function(_StopSession value) stopSession,
  }) {
    return logSet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_LogSet value)? logSet,
    TResult? Function(_StopSession value)? stopSession,
  }) {
    return logSet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult Function(_StartSession value)? startSession,
    TResult Function(_LogSet value)? logSet,
    TResult Function(_StopSession value)? stopSession,
    required TResult orElse(),
  }) {
    if (logSet != null) {
      return logSet(this);
    }
    return orElse();
  }
}

abstract class _LogSet implements SessionEvent {
  const factory _LogSet(final TLog log, final double progress) = _$LogSetImpl;

  TLog get log;
  double get progress;
  @JsonKey(ignore: true)
  _$$LogSetImplCopyWith<_$LogSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopSessionImplCopyWith<$Res> {
  factory _$$StopSessionImplCopyWith(
          _$StopSessionImpl value, $Res Function(_$StopSessionImpl) then) =
      __$$StopSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TSession session, bool fullSession});
}

/// @nodoc
class __$$StopSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$StopSessionImpl>
    implements _$$StopSessionImplCopyWith<$Res> {
  __$$StopSessionImplCopyWithImpl(
      _$StopSessionImpl _value, $Res Function(_$StopSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? fullSession = null,
  }) {
    return _then(_$StopSessionImpl(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as TSession,
      null == fullSession
          ? _value.fullSession
          : fullSession // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StopSessionImpl implements _StopSession {
  const _$StopSessionImpl(this.session, this.fullSession);

  @override
  final TSession session;
  @override
  final bool fullSession;

  @override
  String toString() {
    return 'SessionEvent.stopSession(session: $session, fullSession: $fullSession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopSessionImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.fullSession, fullSession) ||
                other.fullSession == fullSession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session, fullSession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopSessionImplCopyWith<_$StopSessionImpl> get copyWith =>
      __$$StopSessionImplCopyWithImpl<_$StopSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLastActiveSession,
    required TResult Function(int dayId, String dayName) startSession,
    required TResult Function(TLog log, double progress) logSet,
    required TResult Function(TSession session, bool fullSession) stopSession,
  }) {
    return stopSession(session, fullSession);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLastActiveSession,
    TResult? Function(int dayId, String dayName)? startSession,
    TResult? Function(TLog log, double progress)? logSet,
    TResult? Function(TSession session, bool fullSession)? stopSession,
  }) {
    return stopSession?.call(session, fullSession);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLastActiveSession,
    TResult Function(int dayId, String dayName)? startSession,
    TResult Function(TLog log, double progress)? logSet,
    TResult Function(TSession session, bool fullSession)? stopSession,
    required TResult orElse(),
  }) {
    if (stopSession != null) {
      return stopSession(session, fullSession);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLastActiveSession value) getLastActiveSession,
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_LogSet value) logSet,
    required TResult Function(_StopSession value) stopSession,
  }) {
    return stopSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_LogSet value)? logSet,
    TResult? Function(_StopSession value)? stopSession,
  }) {
    return stopSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLastActiveSession value)? getLastActiveSession,
    TResult Function(_StartSession value)? startSession,
    TResult Function(_LogSet value)? logSet,
    TResult Function(_StopSession value)? stopSession,
    required TResult orElse(),
  }) {
    if (stopSession != null) {
      return stopSession(this);
    }
    return orElse();
  }
}

abstract class _StopSession implements SessionEvent {
  const factory _StopSession(final TSession session, final bool fullSession) =
      _$StopSessionImpl;

  TSession get session;
  bool get fullSession;
  @JsonKey(ignore: true)
  _$$StopSessionImplCopyWith<_$StopSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noActiveSession,
    required TResult Function(TSession session) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noActiveSession,
    TResult? Function(TSession session)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noActiveSession,
    TResult Function(TSession session)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoActiveSession value) noActiveSession,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoActiveSession value)? noActiveSession,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoActiveSession value)? noActiveSession,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SessionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noActiveSession,
    required TResult Function(TSession session) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noActiveSession,
    TResult? Function(TSession session)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noActiveSession,
    TResult Function(TSession session)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoActiveSession value) noActiveSession,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoActiveSession value)? noActiveSession,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoActiveSession value)? noActiveSession,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SessionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SessionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noActiveSession,
    required TResult Function(TSession session) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noActiveSession,
    TResult? Function(TSession session)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noActiveSession,
    TResult Function(TSession session)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoActiveSession value) noActiveSession,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoActiveSession value)? noActiveSession,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoActiveSession value)? noActiveSession,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SessionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$NoActiveSessionImplCopyWith<$Res> {
  factory _$$NoActiveSessionImplCopyWith(_$NoActiveSessionImpl value,
          $Res Function(_$NoActiveSessionImpl) then) =
      __$$NoActiveSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoActiveSessionImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$NoActiveSessionImpl>
    implements _$$NoActiveSessionImplCopyWith<$Res> {
  __$$NoActiveSessionImplCopyWithImpl(
      _$NoActiveSessionImpl _value, $Res Function(_$NoActiveSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoActiveSessionImpl implements _NoActiveSession {
  const _$NoActiveSessionImpl();

  @override
  String toString() {
    return 'SessionState.noActiveSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoActiveSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noActiveSession,
    required TResult Function(TSession session) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return noActiveSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noActiveSession,
    TResult? Function(TSession session)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return noActiveSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noActiveSession,
    TResult Function(TSession session)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (noActiveSession != null) {
      return noActiveSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoActiveSession value) noActiveSession,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return noActiveSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoActiveSession value)? noActiveSession,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return noActiveSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoActiveSession value)? noActiveSession,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (noActiveSession != null) {
      return noActiveSession(this);
    }
    return orElse();
  }
}

abstract class _NoActiveSession implements SessionState {
  const factory _NoActiveSession() = _$NoActiveSessionImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TSession session});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$LoadedImpl(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as TSession,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.session);

  @override
  final TSession session;

  @override
  String toString() {
    return 'SessionState.loaded(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noActiveSession,
    required TResult Function(TSession session) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noActiveSession,
    TResult? Function(TSession session)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noActiveSession,
    TResult Function(TSession session)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoActiveSession value) noActiveSession,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoActiveSession value)? noActiveSession,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoActiveSession value)? noActiveSession,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SessionState {
  const factory _Loaded(final TSession session) = _$LoadedImpl;

  TSession get session;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'SessionState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noActiveSession,
    required TResult Function(TSession session) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noActiveSession,
    TResult? Function(TSession session)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noActiveSession,
    TResult Function(TSession session)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoActiveSession value) noActiveSession,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoActiveSession value)? noActiveSession,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoActiveSession value)? noActiveSession,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SessionState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
