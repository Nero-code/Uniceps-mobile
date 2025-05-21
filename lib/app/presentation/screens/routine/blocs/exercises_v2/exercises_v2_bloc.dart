import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'exercises_v2_event.dart';
part 'exercises_v2_state.dart';

class ExercisesV2Bloc extends Bloc<ExercisesV2Event, ExercisesV2State> {
  final ExercisesCommands _commands;
  final selectedExercises = <ExerciseV2>[];
  ExercisesV2Bloc({required ExercisesCommands commands})
      : _commands = commands,
        super(ExercisesV2Initial()) {
    on<GetExercisesByFilterEvent>((event, emit) async {
      // final list = <ExerciseV2Dto>[];
      // final res = jsonDecode(exercisesJson) as Iterable;
      // res.map((e) => list.add(ExerciseV2Dto.fromJson(e)));
      emit(ExercisesV2LoadingState());

      final either = await _commands.getExercisesByGroup(event.filter);
      either.fold(
          (l) => emit(ExercisesV2ErrorState(failure: l)),
          (r) => emit(
              ExercisesV2LoadedState(list: r, selected: selectedExercises)));
    });
    on<AddOrRemoveExerciseEvent>((event, emit) {
      if (event.isAdd) {
        selectedExercises.add(event.exerciseV2);
      } else {
        selectedExercises.remove(event.exerciseV2);
      }
      emit(
          ExercisesV2LoadedState(list: event.all, selected: selectedExercises));
    });
  }
}
