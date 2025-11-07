part of 'current_routine_cubit.dart';

@freezed
class CurrentRoutineState with _$CurrentRoutineState {
  const factory CurrentRoutineState.initial() = _Initial;
  const factory CurrentRoutineState.loading() = _Loading;
  const factory CurrentRoutineState.loaded(Routine c, RoutineHeat heat) = _Loaded;
  const factory CurrentRoutineState.error(Failure f) = _Error;
}
