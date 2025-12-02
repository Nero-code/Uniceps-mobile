import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';

part 'exercises_v2_selection_state.dart';

class ExercisesV2SelectionCubit extends Cubit<ExercisesV2SelectionState> {
  ExercisesV2SelectionCubit() : super(const ExercisesV2SelectionState(selected: []));

  final selected = <ExerciseV2>[];

  void selectExercise(ExerciseV2 exercise) {
    selected.add(exercise);
    emit(ExercisesV2SelectionState(selected: selected));
  }

  void deselectExersice(ExerciseV2 exercise) {
    selected.removeWhere((e) => e.apiId == exercise.apiId);
    emit(ExercisesV2SelectionState(selected: selected));
  }
}
