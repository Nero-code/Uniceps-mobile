import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';

abstract class RoutineRemoteSource {
  Future<List<Routine>> getAllRoutines();
  Future<void> createRoutines(RoutineDto dto);
  Future<void> updateRoutines(RoutineDto dto);
  Future<void> deleteRoutines(RoutineDto dto);
  Future<void> shareRoutines(RoutineDto dto, String userId);
}
