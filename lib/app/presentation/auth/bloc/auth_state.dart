part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.codeSent() = _CodeSent;
  const factory AuthState.authenticated() = _Authenticated;

  const factory AuthState.error(AuthFailure failure) = _Error;
  const factory AuthState.loading() = _Loading;
}
