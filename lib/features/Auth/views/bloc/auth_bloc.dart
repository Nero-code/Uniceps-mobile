import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Auth/services/usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecases usecases;

  AuthBloc({required this.usecases}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEvent) {
        bool isLogged = false;

        final either = await usecases.isLoggedIn();
        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) async {
            isLogged = r;
          },
        );
        if (!isLogged) {
          emit(AuthErrorState(
              f: AuthFailure(errorMessage: "Not Authenticated!")));
          return;
        }
        final e = await usecases.getProfile();
        e.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(AuthDoneState(player: r)),
        );
      } else if (event is EmailSigninRequestEvent) {
        emit(AuthLoadingState());
        final either = await usecases.emailSignin(email: event.email);
        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(AuthCodeSentState()),
        );
      } else if (event is AuthEmailCodeVerifyEvent) {
        emit(AuthLoadingState());
        final either =
            await usecases.validateCode(code: event.code, email: event.email);
        either.fold(
          (l) => emit(AuthWrongCodeState()),
          (r) => emit(AuthNewPassword()),
        );
      } else if (event is AuthProfileSubmitEvent) {
        emit(AuthLoadingState());
        final either = await usecases.submitProfile(player: event.player);
        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(ProfileSubmitionDone()),
        );
      } else if (event is GymCodeVerifyEvent) {
        emit(AuthLoadingState());
        final either = await usecases.checkGymCode(gymCode: event.gymCode);
        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(GymVerifiedState()),
        );
      }
    });
  }
}
