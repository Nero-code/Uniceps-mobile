import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final PracticeCommands _commands;
  SessionBloc({required PracticeCommands commands})
      : _commands = commands,
        super(const _Initial()) {
    // ------------------------------------------------
    // Get Last Active Session Event
    on<_GetLastActiveSession>((event, emit) async {
      emit(const SessionState.loading());

      final either = await _commands.getLastActiveSession();

      either.fold(
        (failure) => (failure is EmptyCacheFailure)
            ? emit(const SessionState.noActiveSession())
            : emit(SessionState.error(failure)),
        // ---------------
        (r) => emit(SessionState.loaded(r)),
      );
    });

    // ------------------------------------------------
    // Start Session Event
    on<_StartSession>((event, emit) async {
      final either = await _commands.startTrainingSession(event.dayId, event.dayName);

      either.fold(
        (l) => emit(SessionState.error(l)),
        (r) => emit(SessionState.loaded(r)),
      );
    });

    // ------------------------------------------------
    // Log Set Event
    on<_LogSet>((event, emit) async {
      emit(const SessionState.loading());

      final either = await _commands.logSetComplete(event.log, event.progress);
      either.fold(
        (l) => emit(SessionState.error(l)),
        (r) => emit(SessionState.loaded(r)),
      );
    });

    // ------------------------------------------------
    // Stop Session Event
    on<_StopSession>((event, emit) async {
      emit(const SessionState.loading());

      final either = await _commands.finishTrainingSession(event.session, event.fullSession);
      either.fold(
        (l) => emit(SessionState.error(l)),
        (r) => emit(const SessionState.noActiveSession()),
      );
    });
  }
}
