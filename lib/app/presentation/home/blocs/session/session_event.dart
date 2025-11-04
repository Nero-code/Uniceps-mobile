part of 'session_bloc.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.getLastActiveSession() = _GetLastActiveSession;
  const factory SessionEvent.startSession(int dayId) = _StartSession;
  const factory SessionEvent.logSet(TLog log) = _LogSet;
  const factory SessionEvent.stopSession(TSession session) = _StopSession;
}

// final class GetCurrentRoutine extends SessionEvent {}

// final class GetLastActiveSessionEvent extends SessionEvent {}

// final class StartSessionEvent extends SessionEvent {
//   final int dayId;
//   const StartSessionEvent({required this.dayId});
// }

// final class LogSetEvent extends SessionEvent {
//   final TLog log;
//   const LogSetEvent({required this.log});
// }

// final class StopSessionEvent extends SessionEvent {
//   final TSession session;
//   const StopSessionEvent({required this.session});
// }
