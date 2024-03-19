part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthRequestEvent extends AuthEvent {}

// final class AuthCodeSentEvent extends AuthEvent {}

final class AuthCodeVerifyEvent extends AuthEvent {}

// final class AuthDoneEvent extends AuthEvent {}

// final class AuthFailedEvent extends AuthEvent {}

final class AuthProfileSubmitEvent extends AuthEvent {}

// final class AuthProfileFailedEvent extends AuthEvent {}
