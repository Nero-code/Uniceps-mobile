part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthCodeSentState extends AuthState {}

final class AuthDoneState extends AuthState {}

final class AuthInvalidCredentialsState extends AuthState {}

final class AuthWrongCodeState extends AuthState {}
