part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

///
///   Main SignIn
///
final class EmailSigninRequestEvent extends AuthEvent {
  final String email;
  const EmailSigninRequestEvent({required this.email});
}

final class AuthEmailCodeVerifyEvent extends AuthEvent {
  final String email, code;
  const AuthEmailCodeVerifyEvent({required this.code, required this.email});
}

final class DeleteAccountEvent extends AuthEvent {}

///
///   Guest Mode
///

final class AuthGuestModeEvent extends AuthEvent {}

///
///   Main Login
///

final class LoginWithEmailAndPassEvent extends AuthEvent {
  final String email, pass;
  const LoginWithEmailAndPassEvent({required this.email, required this.pass});
}

final class LogoutEvent extends AuthEvent {}

final class AuthCheckEvent extends AuthEvent {}

///
///   Gym and Profile Events
///

final class GymCodeVerifyEvent extends AuthEvent {
  final String gymCode;
  const GymCodeVerifyEvent({required this.gymCode});
}
