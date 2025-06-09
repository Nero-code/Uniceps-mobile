part of 'session_bloc.dart';

sealed class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

// final class GetCurrentRoutine extends SessionEvent {}

final class GetLastActiveSessionEvent extends SessionEvent {}

final class StartSessionEvent extends SessionEvent {
  final int dayId;
  const StartSessionEvent({required this.dayId});
}

final class LogSetEvent extends SessionEvent {
  final TLog log;
  const LogSetEvent({required this.log});
}

final class StopSessionEvent extends SessionEvent {
  final TSession session;
  const StopSessionEvent({required this.session});
}
