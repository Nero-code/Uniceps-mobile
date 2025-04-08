import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';

abstract class RoutineLocalSource {
  Future<List<RoutineDto>> getAllRoutines();
  Future<void> saveRoutines(List<RoutineDto> list);
  Future<RoutineDto> createRoutine(RoutineDto dto);
  Future<RoutineDto> updateRoutine(RoutineDto dto);
  Future<void> deleteRoutine(RoutineDto dto);
  Future<void> shareRoutine(RoutineDto dto);
}
