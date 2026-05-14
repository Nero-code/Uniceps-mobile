part of 'exercise_filter_cubit.dart';

@immutable
sealed class ExerciseFilterState {}

final class AvailableExercisesFilter extends ExerciseFilterState {
  final ExerciseFilter filter;
  AvailableExercisesFilter({required this.filter});
}
