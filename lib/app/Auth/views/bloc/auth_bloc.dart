import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
// import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/app/Auth/services/enitites/player.dart';
import 'package:uniceps/app/Auth/services/usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecases usecases;

  AuthBloc({required this.usecases}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEvent) {
        // bool isLogged = false;
        final either = await usecases.isLoggedIn();

        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(AuthAuthenticatedState()),
        );

        // either.fold(
        //   (l) => emit(AuthErrorState(f: l)),
        //   (r) async {
        //     isLogged = r;
        //   },
        // );
        // if (!isLogged) {
        //   emit(
        //     AuthErrorState(f: AuthFailure(errorMessage: "Not Authenticated!")),
        //   );
        //   return;
        // }
        // final e = await usecases.getProfile();
        // e.fold(
        //   (l) => emit(AuthErrorState(f: l)),
        //   (r) => emit(AuthDoneState(player: r)),
        // );
        //
        //
        //
        // } else if (event is AuthGetProfileEvent) {
        //   final either = await usecases.getProfile();
        //   either.fold(
        //     (l) => emit(AuthNullProfile()),
        //     (r) => emit(AuthDoneState(player: r)),
        //   );
      } else if (event is EmailSigninRequestEvent) {
        emit(AuthLoadingState());
        final either = await usecases.emailSignin(email: event.email);
        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(AuthCodeSentState()),
        );
        //
        //
        //
      } else if (event is AuthEmailCodeVerifyEvent) {
        //
        //  Check if code is valid and authenticate user
        //
        emit(AuthLoadingState());
        final either = await usecases.validateCode(
            code: event.code, email: event.email, notifyToken: "");
        bool isLogged = false;
        either.fold(
          (l) => emit(AuthWrongCodeState()),
          (isLoggedd) => isLogged = isLoggedd,
        );
        if (!isLogged) {
          return;
        }
        //
        //  Then, Chack if a profile is present for the user
        //
        final profileEither = await usecases.getProfile();
        profileEither.fold(
          (l) => emit(const AuthDoneState(hasData: false)),
          (r) => emit(AuthDoneState(hasData: true, player: r)),
        );
      } else if (event is LogoutEvent) {
        emit(AuthLoadingState());
        final either = await usecases.logout();
        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(AuthLoggedoutState()),
        );
      } else if (event is DeleteAccountEvent) {
        // print("Delete Account Event");
        emit(AuthLoadingState());
        final either = await usecases.deleteAccount();
        either.fold(
          (l) => emit(AuthErrorState(f: l)),
          (r) => emit(AuthDeletedAccountState()),
        );
      }
    });
  }
}
