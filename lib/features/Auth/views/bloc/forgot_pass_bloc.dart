import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/usecases/usecases.dart';

part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';

class FogotPassBloc extends Bloc<FogotPassEvent, FogotPassState> {
  final AuthUsecases usecases;
  FogotPassBloc({required this.usecases}) : super(FogotPassInitial()) {
    on<FogotPassEvent>((event, emit) async {
      if (event is FPassEmailVerifyEvent) {
        emit(FPassLoadingState());
        final either = await usecases.emailSignin(email: event.email);
        either.fold(
          (l) => emit(FPassErrorState(f: l)),
          (r) => emit(FPassCodeSentState()),
        );
      } else if (event is FPassCodeVerifyEvent) {
        emit(FPassLoadingState());
        final either = await usecases.validateCode(
            code: event.code, email: event.email, notifyToken: "");
        either.fold(
          (l) => emit(FPassErrorState(f: l)),
          (r) => emit(FPassNewPassState()),
        );
      } else if (event is FPassChangePasswordEvent) {
        emit(FPassLoadingState());
        final either = await usecases.changePassword(pass: event.newPass);
        either.fold(
          (l) => emit(FPassErrorState(f: l)),
          (r) => emit(FPassDoneState()),
        );
      }
    });
  }
}
