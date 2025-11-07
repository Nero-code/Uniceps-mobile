part of 'routines_with_heat_bloc.dart';

@freezed
class RoutinesWithHeatEvent with _$RoutinesWithHeatEvent {
  const factory RoutinesWithHeatEvent.getRoutines() = _GetRoutines;
  const factory RoutinesWithHeatEvent.create(String name) = _Create;
  const factory RoutinesWithHeatEvent.update(Routine update) = _Update;
  const factory RoutinesWithHeatEvent.delete(Routine delete) = _Delete;
  const factory RoutinesWithHeatEvent.setCurrent(Routine update) = _SetCurrent;
}
