part of 'exercises_v2_bloc.dart';

sealed class ExercisesV2Event extends Equatable {
  const ExercisesV2Event();

  @override
  List<Object> get props => [];
}

class GetAllExercisesEvent extends ExercisesV2Event {
  const GetAllExercisesEvent();
}

class GetExercisesByFilterEvent extends ExercisesV2Event {
  final ExerciseFilter filter;
  const GetExercisesByFilterEvent({required this.filter});
}

class GetExercisesByMuscleGroup extends ExercisesV2Event {
  final MuscleGroup filter;
  const GetExercisesByMuscleGroup({required this.filter});
}

class AddOrRemoveExerciseEvent extends ExercisesV2Event {
  final Exercise exerciseV2;
  final bool isAdd;
  final List<Exercise> all;

  const AddOrRemoveExerciseEvent({required this.exerciseV2, required this.isAdd, required this.all});
}
