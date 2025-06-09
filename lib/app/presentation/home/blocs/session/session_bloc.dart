import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final PracticeCommands _commands;
  SessionBloc({required PracticeCommands commands})
      : _commands = commands,
        super(SessionInitial()) {
    on<GetLastActiveSessionEvent>((event, emit) async {
      emit(SessionLoadingState());

      final either = await _commands.getLastActiveSession();

      either.fold(
        (failure) => (failure is EmptyCacheFailure)
            ? emit(NoActiveSessionState())
            : emit(SessionErrorState(failure: failure)),
        // ---------------------------------------------
        (r) => emit(SessionLoadedState(session: r)),
      );
    });

    on<StartSessionEvent>((event, emit) async {
      final either = await _commands.startTrainingSession(event.dayId);

      either.fold(
        (l) => emit(SessionErrorState(failure: l)),
        (r) => emit(SessionLoadedState(session: r)),
      );
    });

    on<LogSetEvent>((event, emit) async {
      emit(SessionLoadingState());

      final either = await _commands.logSetComplete(event.log);
      either.fold(
        (l) => emit(SessionErrorState(failure: l)),
        (r) => emit(SessionLoadedState(session: r)),
      );
    });
    on<StopSessionEvent>((event, emit) async {
      emit(SessionLoadingState());

      final either = await _commands.finishTrainingSession(event.session);
      either.fold(
        (l) => emit(SessionErrorState(failure: l)),
        (r) => emit(NoActiveSessionState()),
      );
    });
  }
}
