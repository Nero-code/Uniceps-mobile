part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

///
///   Main Email Auth
///
final class AuthRequestEvent extends AuthEvent {}

final class AuthCodeVerifyEvent extends AuthEvent {}

final class AuthProfileSubmitEvent extends AuthEvent {}

///
///   Forgot Password Auth
///

final class FPassEmailVerifyEvent extends AuthEvent {}

final class FPassCodeVerifyEvent extends AuthEvent {}

final class FPassChangePasswordEvent extends AuthEvent {}
