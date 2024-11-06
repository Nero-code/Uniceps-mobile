part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthCodeSentState extends AuthState {}

// final class AuthNewPassword extends AuthState {
//   // final String pass
// }

final class AuthAuthenticatedState extends AuthState {}

final class AuthDoneState extends AuthState {
  final bool hasData;
  final Player? player;
  const AuthDoneState({required this.hasData, this.player});
}

final class AuthErrorState extends AuthState {
  final Failure f;
  const AuthErrorState({required this.f});
}

final class AuthLoggedoutState extends AuthState {}

final class AuthNullProfile extends AuthState {}

final class ProfileSubmitionDone extends AuthState {
  final Player player;
  const ProfileSubmitionDone({required this.player});
}

final class GymVerifiedState extends AuthState {}

final class AuthInvalidCredentialsState extends AuthState {}

final class AuthWrongCodeState extends AuthState {}

final class AuthDeletedAccountState extends AuthState {}
