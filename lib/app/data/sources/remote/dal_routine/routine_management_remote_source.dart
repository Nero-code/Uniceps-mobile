import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';

abstract class IRoutineManagementRemoteSourceContract {
  Future<List<RoutineDto>> getAllRoutines();
  Future<void> createRoutines(RoutineDto dto);
  Future<void> updateRoutines(RoutineDto dto);
  Future<void> deleteRoutines(RoutineDto dto);
  Future<void> shareRoutines(RoutineDto dto, String userId);
}

class RoutineManagementRemoteSourceImpl
    implements IRoutineManagementRemoteSourceContract {
  @override
  Future<void> createRoutines(RoutineDto dto) {
    // TODO: implement createRoutines
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRoutines(RoutineDto dto) {
    // TODO: implement deleteRoutines
    throw UnimplementedError();
  }

  @override
  Future<List<RoutineDto>> getAllRoutines() {
    // TODO: implement getAllRoutines
    throw UnimplementedError();
  }

  @override
  Future<void> shareRoutines(RoutineDto dto, String userId) {
    // TODO: implement shareRoutines
    throw UnimplementedError();
  }

  @override
  Future<void> updateRoutines(RoutineDto dto) {
    // TODO: implement updateRoutines
    throw UnimplementedError();
  }
}
