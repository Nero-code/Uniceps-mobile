import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IRoutineManagementLocalSourceContract {
  Future<List<RoutineDto>> getAllRoutines();
  Future<RoutineDto> createRoutine(String routineName);
  Future<RoutineDto> updateRoutine(RoutineDto dto);
  Future<List<RoutineDto>> setCurrentRoutine(RoutineDto dto);
  Future<void> deleteRoutine(RoutineDto dto);
  Future<void> saveRoutines(List<RoutineDto> list);
  Future<void> shareRoutine(RoutineDto dto);
}

class RoutineManagementLocalSourceImpl
    implements IRoutineManagementLocalSourceContract {
  const RoutineManagementLocalSourceImpl({required AppDatabase database})
      : _database = database;

  final AppDatabase _database;

  @override
  Future<List<RoutineDto>> getAllRoutines() async {
    final res = (await _database.managers.routines.get())
        .map((r) => RoutineDto.fromTable(r))
        .toList();
    return res;
  }

  @override
  Future<RoutineDto> createRoutine(String routineName) async {
    print("create routine => inside local source");
    final id =
        await _database.managers.routines.create((o) => o(name: routineName));
    final routine =
        await _database.managers.routines.filter((f) => f.id(id)).getSingle();
    print("create routine => inside local source finished");
    return RoutineDto.fromTable(routine);
  }

  @override
  Future<RoutineDto> updateRoutine(RoutineDto dto) async {
    await (_database.update(_database.routines)
          ..where((f) => f.id.equals(dto.id!)))
        .write(RoutinesCompanion.custom(name: Constant(dto.name)));
    return dto;
  }

  @override
  Future<List<RoutineDto>> setCurrentRoutine(RoutineDto dto) async {
    await (_database.update(_database.routines)
          ..where((f) => f.isCurrent.equals(true)))
        .write(RoutinesCompanion.custom(isCurrent: const Constant(false)));

    await (_database.update(_database.routines)
          ..where((f) => f.id.equals(dto.id!)))
        .write(RoutinesCompanion.custom(isCurrent: const Constant(true)));

    final res = await _database.select(_database.routines).get();
    return res.map((r) => RoutineDto.fromTable(r)).toList();
  }

  @override
  Future<void> deleteRoutine(RoutineDto dto) async {
    await (_database.delete(_database.routines)
          ..where((f) => f.id.equals(dto.id!)))
        .go();
  }

  @override
  Future<void> saveRoutines(List<RoutineDto> list) async {
    // TODO: implement saveRoutines
    throw UnimplementedError();
  }

  @override
  Future<void> shareRoutine(RoutineDto dto) async {
    // TODO: implement shareRoutine
    throw UnimplementedError();
  }
}
