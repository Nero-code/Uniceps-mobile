part of 'exercise_lib_cubit.dart';

@freezed
class ExerciseLibState with _$ExerciseLibState {
  const factory ExerciseLibState.initial() = _Initial;
  const factory ExerciseLibState.needsUpdate() = _NeedsUpdate;
  const factory ExerciseLibState.statusGood() = _StatusGood;
}
