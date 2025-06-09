import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'current_routine_state.dart';

class CurrentRoutineCubit extends Cubit<CurrentRoutineState> {
  final PracticeCommands _commands;
  CurrentRoutineCubit({required PracticeCommands commands})
      : _commands = commands,
        super(CurrentRoutineInitial());

  Future<void> getCurrentRoutine() async {
    emit(CurrentRoutineLoadingState());

    final either = await _commands.getCurrentRoutine();
    either.fold(
      (l) => emit(CurrentRoutineErrorState(failure: l)),
      (r) =>
          emit(CurrentRoutineLoadedState(routine: r.head, lastDayId: r.tail)),
    );
  }
}
