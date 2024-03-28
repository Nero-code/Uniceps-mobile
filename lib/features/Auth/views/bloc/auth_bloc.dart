import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/features/Auth/services/usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecases usecases;

  AuthBloc({required this.usecases}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is AuthRequestEvent) {
        emit(AuthLoadingState());
      } else if (event is AuthCodeVerifyEvent) {
        emit(AuthLoadingState());
      } else if (event is AuthProfileSubmitEvent) {
        emit(AuthLoadingState());
      } else if (event is FPassEmailVerifyEvent) {
        emit(AuthLoadingState());
      } else if (event is FPassCodeVerifyEvent) {
        emit(AuthLoadingState());
      } else if (event is FPassChangePasswordEvent) {
        emit(AuthLoadingState());
      }
    });
  }
}
