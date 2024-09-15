part of 'exercises_bloc.dart';

sealed class ExercisesEvent extends Equatable {
  const ExercisesEvent();

  @override
  List<Object> get props => [];
}

final class GetExercisesByFilterEvent extends ExercisesEvent {
  final int filter;
  const GetExercisesByFilterEvent(this.filter);
}

final class UpdateLastWeightEvent extends ExercisesEvent {
  final double newVal;
  final String eId;
  const UpdateLastWeightEvent({required this.eId, required this.newVal});
}
