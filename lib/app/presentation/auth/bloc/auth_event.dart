part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.requestEmailAuth(String email) = _RequestEmailAuth;
  const factory AuthEvent.verifyCode(String email, String code) = _VerifyCode;
}
