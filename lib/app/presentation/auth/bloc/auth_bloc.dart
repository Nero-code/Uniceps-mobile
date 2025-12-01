import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/commands/auth_usecases/otp_usecases.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final OtpUsecases _usecases;

  AuthBloc(this._usecases) : super(const _Initial()) {
    on<_RequestEmailAuth>((event, emit) async {
      emit(const AuthState.loading());

      final res = await _usecases.verifyCredential(credential: event.email);
      res.fold(
        (l) => emit(AuthState.error(l)),
        (r) => emit(const AuthState.codeSent()),
      );
    });
    on<_VerifyCode>((event, emit) async {
      emit(const AuthState.loading());

      final res = await _usecases.validateOTP(credential: event.email, otp: event.code);

      res.fold(
        (l) => emit(AuthState.error(l)),
        (r) => emit(const AuthState.authenticated()),
      );
    });
  }
}
