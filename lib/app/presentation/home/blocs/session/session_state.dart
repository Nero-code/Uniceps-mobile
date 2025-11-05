part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.noActiveSession() = _NoActiveSession;
  const factory SessionState.loaded(TSession session) = _Loaded;
  const factory SessionState.error(Failure failure) = _Error;
}

// final class SessionInitial extends SessionState {}

// final class SessionLoadingState extends SessionState {}

// final class NoActiveSessionState extends SessionState {
//   // final int? lastDayId;
//   const NoActiveSessionState();
// }

// final class SessionLoadedState extends SessionState {
//   const SessionLoadedState({required this.session});
//   final TSession session;
// }

// final class SessionErrorState extends SessionState {
//   const SessionErrorState({required this.failure});
//   final Failure failure;
// }
