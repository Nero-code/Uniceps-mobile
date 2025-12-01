import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/models/routine_result.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IRoutineManagementLocalSourceContract {
  Future<List<RoutineDto>> getAllRoutines();
  Future<List<({RoutineDto routine, RoutineHeat heat})>> getAllRoutinesWithHeat();
  Future<RoutineDto> createRoutine(String routineName);
  Future<RoutineDto> updateRoutine(RoutineDto dto);
  Future<void> setCurrentRoutine(RoutineDto dto);
  Future<void> deleteRoutine(RoutineDto dto);
  Stream<Stage> insertFullRoutine(RoutineDto dto);
}

class RoutineManagementLocalSourceImpl implements IRoutineManagementLocalSourceContract {
  final AppDatabase _database;
  final Logger _logger;

  const RoutineManagementLocalSourceImpl({required AppDatabase database, required Logger logger})
      : _database = database,
        _logger = logger;

  @override
  Future<List<RoutineDto>> getAllRoutines() async {
    final res = (await _database.managers.routines.get()).map((r) => RoutineDto.fromTable(r)).toList();
    return res;
  }

  @override
  Future<RoutineDto> createRoutine(String routineName) async {
    _logger.t("create routine => inside local source");
    final id = await _database.managers.routines.create((o) => o(name: routineName));
    final routine = await _database.managers.routines.filter((f) => f.id(id)).getSingle();
    _logger.t("create routine => inside local source finished");
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
  Future<List<({RoutineHeat heat, RoutineDto routine})>> getAllRoutinesWithHeat() async {
    // Part 1:
    //   Get all routines.
    final routines = await _database.select(_database.routines).get();
    final List<({RoutineHeat heat, RoutineDto routine})> result = [];

    _logger.t("step 1: routines.length = ${routines.length}");

    // Part 2:
    //   Get Heat objects.
    for (final routine in routines) {
      int dc, ic, sc, tc;
      dc = ic = sc = tc = 0;
      int? lastDayId;
      Duration duration = Duration.zero;
      DateTime newestSessionDate = DateTime(2000);
      DateTime oldestSessionDate = DateTime.now();
      final days = await (_database.select(_database.daysGroup)..where((f) => f.routineId.equals(routine.id))).get();
      _logger.t("step 2: days.length = ${days.length}");
      for (final day in days) {
        final sessions = await (_database.select(_database.tSessions)..where((f) => f.dayId.equals(day.id))).get();
        tc += sessions.length;
        final range = sessions.map((e) => e.startedAt).toList()..sort();

        if (range.isNotEmpty) {
          // Get first-ever session and start from there
          if (oldestSessionDate.difference(range.first).inHours > 0) {
            oldestSessionDate = range.first;
          }

          // Get latest session and map to its day
          if (newestSessionDate.difference(range.last).inHours < 0) {
            newestSessionDate = range.last;
            lastDayId = day.id;
          }
        }

        final items = await (_database.select(_database.routineItems)..where((f) => f.dayId.equals(day.id))).get();

        _logger.t("step 3: items.length = ${items.length}");
        for (final item in items) {
          final sets =
              await (_database.select(_database.routineSets)..where((f) => f.routineItemId.equals(item.id))).get();
          sc += sets.length;
          _logger.t("step 4: sets.length = ${sets.length}");
        }
        ic += items.length;
      }
      dc += days.length;
      result.add((
        routine: RoutineDto.fromTable(routine),
        heat: RoutineHeat(
          routineName: routine.name,
          sessionCount: tc,
          duration: duration,
          days: dc,
          exercises: ic,
          sets: sc,
          lastdayId: lastDayId,
        )
      ));
    }
    return result;
  }

  @override
  Stream<Stage> insertFullRoutine(RoutineDto dto) async* {
    // Create New Routine
    final routineId = await _database.into(_database.routines).insert(RoutinesCompanion.insert(name: dto.name));
    // Create Days
    for (final d in dto.daysDto) {
      final dayId = await _database
          .into(_database.daysGroup)
          .insert(DaysGroupCompanion.insert(index: d.index, dayName: d.name, routineId: routineId));
      yield Stage.days; // move one step for Day
      // Create Items
      for (final i in d.items) {
        var ex = await (_database.select(_database.exercises)..where((f) => f.apiId.equals(i.exerciseV2Dto.apiId)))
            .getSingleOrNull();
        if (ex == null) {
          await _database.into(_database.exercises).insert(ExercisesCompanion.insert(
                apiId: Value(i.exerciseV2Dto.apiId),
                name: i.exerciseV2Dto.name,
                imageUrl: i.exerciseV2Dto.imageUrl,
                muscleGroupTranslations: encodeTranslations(i.exerciseV2Dto.muscleGroupTranslations),
              ));
        }
        final itemId = await _database
            .into(_database.routineItems)
            .insert(RoutineItemsCompanion.insert(index: i.index, exerciseId: i.exerciseV2Dto.apiId, dayId: dayId));
        yield Stage.items; // move one step for Item
        // Create Sets
        for (final s in i.setsDto) {
          await _database
              .into(_database.routineSets)
              .insert(RoutineSetsCompanion.insert(roundIndex: s.index, repsCount: s.reps, routineItemId: itemId));
          yield Stage.sets; // move one step for Set
        }
      }
    }
  }
}
