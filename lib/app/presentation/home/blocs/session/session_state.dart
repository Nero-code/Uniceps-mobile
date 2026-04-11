part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.noActiveSession({TSession? lastSession, bool? isFullSession}) = _NoActiveSession;
  const factory SessionState.loaded(TSession session) = _Loaded;
  const factory SessionState.error(Failure failure) = _Error;
}
