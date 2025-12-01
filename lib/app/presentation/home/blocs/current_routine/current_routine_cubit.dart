import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/domain/commands/practice_usecases/practice_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'current_routine_state.dart';
part 'current_routine_cubit.freezed.dart';

class CurrentRoutineCubit extends Cubit<CurrentRoutineState> {
  final PracticeCommands _commands;
  CurrentRoutineCubit({required PracticeCommands commands})
      : _commands = commands,
        super(const _Initial());

  Future<void> getCurrentRoutine() async {
    emit(const CurrentRoutineState.loading());

    final either = await _commands.getCurrentRoutineWithHeat();
    either.fold(
      (l) => emit(CurrentRoutineState.error(l)),
      (r) => emit(CurrentRoutineState.loaded(r.head, r.tail!)),
    );
  }
}
