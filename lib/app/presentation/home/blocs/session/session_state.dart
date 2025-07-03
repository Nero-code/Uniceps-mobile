part of 'session_bloc.dart';

sealed class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

final class SessionInitial extends SessionState {}

final class SessionLoadingState extends SessionState {}

final class NoActiveSessionState extends SessionState {
  // final int? lastDayId;
  const NoActiveSessionState();
}

final class SessionLoadedState extends SessionState {
  const SessionLoadedState({required this.session});
  final TSession session;
}

final class SessionErrorState extends SessionState {
  const SessionErrorState({required this.failure});
  final Failure failure;
}
