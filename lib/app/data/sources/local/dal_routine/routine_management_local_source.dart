import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';

abstract class IRoutineManagementLocalSourceContract {
  Future<List<RoutineDto>> getAllRoutines();
  Future<List<({RoutineDto routine, RoutineHeat heat})>> getAllRoutinesWithHeat();
  Future<RoutineDto> createRoutine(String routineName);
  Future<RoutineDto> updateRoutine(RoutineDto dto);
  Future<void> setCurrentRoutine(RoutineDto dto);
  Future<void> deleteRoutine(RoutineDto dto);
  Future<void> shareRoutine(RoutineDto dto);
}

class RoutineManagementLocalSourceImpl implements IRoutineManagementLocalSourceContract {
  const RoutineManagementLocalSourceImpl({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  @override
  Future<List<RoutineDto>> getAllRoutines() async {
    final res = (await _database.managers.routines.get()).map((r) => RoutineDto.fromTable(r)).toList();
    return res;
  }

  @override
  Future<RoutineDto> createRoutine(String routineName) async {
    print("create routine => inside local source");
    final id = await _database.managers.routines.create((o) => o(name: routineName));
    final routine = await _database.managers.routines.filter((f) => f.id(id)).getSingle();
    print("create routine => inside local source finished");
    return RoutineDto.fromTable(routine);
  }

  @override
  Future<RoutineDto> updateRoutine(RoutineDto dto) async {
    await (_database.update(_database.routines)..where((f) => f.id.equals(dto.id!)))
        .write(RoutinesCompanion.custom(name: Constant(dto.name)));
    return dto;
  }

  @override
  Future<void> setCurrentRoutine(RoutineDto dto) async {
    // Remove flag from old routine.
    await (_database.update(_database.routines)..where((f) => f.isCurrent.equals(true)))
        .write(RoutinesCompanion.custom(isCurrent: const Constant(false)));

    // Add flag to new routine.
    await (_database.update(_database.routines)..where((f) => f.id.equals(dto.id!)))
        .write(RoutinesCompanion.custom(isCurrent: const Constant(true)));
  }

  @override
  Future<void> deleteRoutine(RoutineDto dto) async {
    await (_database.delete(_database.routines)..where((f) => f.id.equals(dto.id!))).go();
  }

  @override
  Future<void> shareRoutine(RoutineDto dto) async {
    // TODO: implement shareRoutine
    throw UnimplementedError();
  }

  @override
  Future<List<({RoutineHeat heat, RoutineDto routine})>> getAllRoutinesWithHeat() async {
    // Part 1:
    //   Get all routines.
    final routines = await _database.select(_database.routines).get();
    final List<({RoutineHeat heat, RoutineDto routine})> result = [];

    print("step 1: routines.length = ${routines.length}");

    // Part 2:
    //   Get Heat objects.
    for (final routine in routines) {
      int dc, ic, sc, tc;
      dc = ic = sc = tc = 0;
      Duration duration = Duration.zero;
      final days = await (_database.select(_database.daysGroup)..where((f) => f.routineId.equals(routine.id))).get();
      print("step 2: days.length = ${days.length}");
      for (final day in days) {
        final sessions = await (_database.select(_database.tSessions)..where((f) => f.dayId.equals(day.id))).get();
        tc = sessions.length;
        final range = sessions.map((e) => e.startedAt).toList()..sort();

        if (range.isNotEmpty) {
          duration = DateTime.now().difference(range.first);
        }

        final items = await (_database.select(_database.routineItems)..where((f) => f.dayId.equals(day.id))).get();

        print("step 3: items.length = ${items.length}");
        for (final item in items) {
          final sets =
              await (_database.select(_database.routineSets)..where((f) => f.routineItemId.equals(item.id))).get();
          sc += sets.length;
          print("step 4: sets.length = ${sets.length}");
        }
        ic = items.length;
      }
      dc = days.length;
      result.add((
        routine: RoutineDto.fromTable(routine),
        heat: RoutineHeat(
          routineName: routine.name,
          sessionCount: tc,
          duration: duration,
          days: dc,
          exercises: ic,
          sets: sc,
        )
      ));
    }
    return result;
  }
}
