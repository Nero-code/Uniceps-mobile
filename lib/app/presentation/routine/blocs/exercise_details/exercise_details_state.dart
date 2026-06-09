part of 'exercise_details_cubit.dart';

@freezed
abstract class ExerciseDetailsState with _$ExerciseDetailsState {
  const factory ExerciseDetailsState.initial() = _Initial;
  const factory ExerciseDetailsState.loading() = _Loading;
  const factory ExerciseDetailsState.success({required ExerciseDetailsResult result}) = _Success;
  const factory ExerciseDetailsState.failure({required Failure f}) = _Failure;
}
