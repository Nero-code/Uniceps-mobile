part of 'session_bloc.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.getLastActiveSession() = _GetLastActiveSession;
  const factory SessionEvent.startSession(int dayId, String dayName) = _StartSession;
  const factory SessionEvent.logSet(TLog log, double progress) = _LogSet;
  const factory SessionEvent.stopSession(TSession session, bool fullSession) = _StopSession;
}
