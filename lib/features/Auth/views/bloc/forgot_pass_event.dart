part of 'forgot_pass_bloc.dart';

sealed class FogotPassEvent extends Equatable {
  const FogotPassEvent();

  @override
  List<Object> get props => [];
}

///
///   Forgot Password Auth
///

final class FPassEmailVerifyEvent extends FogotPassEvent {
  final String email;
  const FPassEmailVerifyEvent({required this.email});
}

final class FPassCodeVerifyEvent extends FogotPassEvent {
  final String email, code;
  const FPassCodeVerifyEvent({required this.code, required this.email});
}

final class FPassChangePasswordEvent extends FogotPassEvent {
  final String newPass;
  const FPassChangePasswordEvent({required this.newPass});
}
