part of 'exercises_v2_bloc.dart';

sealed class ExercisesV2Event extends Equatable {
  const ExercisesV2Event();

  @override
  List<Object> get props => [];
}

class GetExercisesByFilterEvent extends ExercisesV2Event {
  final MuscleGroup filter;

  const GetExercisesByFilterEvent({required this.filter});
}

class AddOrRemoveExerciseEvent extends ExercisesV2Event {
  final ExerciseV2 exerciseV2;
  final bool isAdd;
  final List<ExerciseV2> all;

  const AddOrRemoveExerciseEvent(
      {required this.exerciseV2, required this.isAdd, required this.all});
}
