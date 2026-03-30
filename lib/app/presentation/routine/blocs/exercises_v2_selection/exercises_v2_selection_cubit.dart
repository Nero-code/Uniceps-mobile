import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';

part 'exercises_v2_selection_state.dart';

class ExercisesV2SelectionCubit extends Cubit<ExercisesV2SelectionState> {
  ExercisesV2SelectionCubit() : super(const ExercisesV2SelectionState(selected: []));

  final selected = <Exercise>[];

  void selectExercise(Exercise exercise) {
    selected.add(exercise);
    emit(ExercisesV2SelectionState(selected: selected));
  }

  void deselectExersice(Exercise exercise) {
    selected.removeWhere((e) => e.apiId == exercise.apiId);
    emit(ExercisesV2SelectionState(selected: selected));
  }
}
