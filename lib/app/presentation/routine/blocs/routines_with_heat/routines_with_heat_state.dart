part of 'routines_with_heat_bloc.dart';

@freezed
class RoutinesWithHeatState with _$RoutinesWithHeatState {
  const factory RoutinesWithHeatState.initial() = _Initial;
  const factory RoutinesWithHeatState.loading() = _Loading;
  const factory RoutinesWithHeatState.loaded(List<({Routine routine, RoutineHeat heat})> routines) = _Loaded;
  const factory RoutinesWithHeatState.error(Failure f) = _Error;
}
