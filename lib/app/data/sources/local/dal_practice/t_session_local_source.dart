import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/data/models/practice_models/routine_table_parser.dart';
import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/core/errors/exceptions.dart';

abstract class ITSessionLocalSourceContract {
  Future<Tuple2<RoutineDto?, int?>> getCurrentRoutine();
  Future<RoutineDayDto> getDayItems(int dayId);

  Future<TSessionModel?> getPreviousSession();
  Future<TSessionModel> startTrainingSession(int dayId);
  Future<TLogModel> logSet(TLogModel log);
  Future<void> finishTrainingSession(TSessionModel session);
}

class TSessionLocalSource implements ITSessionLocalSourceContract {
  const TSessionLocalSource({
    required Box<Uint8List> imagesCache,
    required db.AppDatabase database,
  })  : _database = database,
        _imagesCache = imagesCache;

  final db.AppDatabase _database;
  final Box<Uint8List> _imagesCache;

  @override
  Future<Tuple2<RoutineDto?, int?>> getCurrentRoutine() async {
    // First of all we search for the existance of the current routine
    final currentRoutine = await (_database.select(_database.routines)
          ..where((f) => f.isCurrent.equals(true)))
        .get();
    if (currentRoutine.isEmpty) {
      return const Tuple2(null, null); // No CurrentRoutine available!
    }

    // --- THE JOIN QUERY ---

    final daysAlias = _database.alias(_database.daysGroup, 'd');
    final sessionsAlias = _database.alias(_database.tSessions, 'ts');

    final res = await (_database.select(_database.daysGroup).join([
      // First, join [routines] with [days].
      leftOuterJoin(
          daysAlias, daysAlias.routineId.equals(currentRoutine.first.id)),

      // Then, join [days] with [tsessions]
      leftOuterJoin(sessionsAlias, sessionsAlias.dayId.equalsExp(daysAlias.id)),
    ])).get();

    // --- Routine Parse Algorithm ---
    //
    // These properties purpose is to hold parsing data.
    final List<db.DaysGroupData> days = [];
    final List<db.TSession> sessions = [];

    // Algorithm for fetching [routine] Starting Point.
    for (final row in res) {
      // Get day from row and add if absent
      final day = row.readTableOrNull(daysAlias);
      if (day != null && !days.contains(day)) days.add(day);
      print("drift day: ${day.runtimeType}");

      final session = row.readTableOrNull(sessionsAlias);
      if (session != null && !sessions.contains(session)) sessions.add(session);
      print("drift day: ${day.runtimeType}");
    }
    // ----------------------------------------------------------

    // Parse routine data Algorithm.
    final routine = RoutineTableParser(
      imagesCache: _imagesCache,
      routine: currentRoutine.first,
      days: days,
      items: [],
      exercises: [],
      groups: [],
      sets: [],
    ).toDto();
    // -----------------------------------
    // print("training days:  ${days.length}");
    // print("training items: ${items.length}");

    final lastDayId = (sessions
          ..sort((a, b) => b.startedAt.compareTo(a.startedAt)))
        .firstOrNull;

    return Tuple2(routine, lastDayId?.dayId);
  }

  @override
  Future<RoutineDayDto> getDayItems(int dayId) async {
    // First we check if day exists.
    final day = await (_database.select(_database.daysGroup)
          ..where((f) => f.id.equals(dayId)))
        .get();
    if (day.isEmpty) throw EmptyCacheExeption(); // No day exists

    // Second, we fetch the day items.
    final itemsAlias = _database.alias(_database.routineItems, 'it');
    final exAlias = _database.alias(_database.exercises, 'ex');
    final setsAlias = _database.alias(_database.routineSets, 'se');
    final logsAlias = _database.alias(_database.tLogs, 'lo');

    // You're about to witness a developers' worst nightmare...
    //
    // --- THE JOIN QUERY ---
    final res = await (_database.select(_database.routineItems).join([
      // Get `Items` under `dayId`.
      leftOuterJoin(itemsAlias, itemsAlias.dayId.equals(dayId)),

      // Get `Exercises` for these `items`.
      leftOuterJoin(exAlias, exAlias.apiId.equalsExp(itemsAlias.exerciseId)),

      // Get `Sets` for these `items`.
      leftOuterJoin(
          setsAlias, setsAlias.routineItemId.equalsExp(itemsAlias.id)),

      // Get TLogs for these exercises.
      leftOuterJoin(logsAlias, logsAlias.exerciseId.equalsExp(exAlias.apiId)),
      // Logs are needed because they hold information about the weights in the
      // sets and it's order in each exercise, which is needed to get set wieght
    ])).get();

    final List<db.RoutineItem> items = [];
    final List<db.Exercise> exercises = [];
    final List<db.RoutineSet> sets = [];
    final List<db.TLog> logs = [];

    final groups = await _database.select(_database.exerciseGroups).get();

    // Algorithm for fetching [routine] Starting Point.
    for (final row in res) {
      // Get item from row and add if absent
      final item = row.readTableOrNull(itemsAlias);
      if (item != null && !items.contains(item)) items.add(item);

      // Get exercises an muscle-group from row and add it
      final ex = row.readTableOrNull(exAlias);
      if (ex != null && !exercises.contains(ex)) exercises.add(ex);

      // Get set (ready... Go!) from row and add if absent
      final set = row.readTableOrNull(setsAlias);
      if (set != null && !sets.contains(set)) sets.add(set);

      // Get TLogs from row
      final log = row.readTableOrNull(logsAlias);
      if (log != null && !logs.contains(log)) logs.add(log);
    }
    // ------ ------

    // Reduce logs table algorithm
    final logsByEx = <int, List<db.TLog>>{};
    for (final i in logs) {
      if (logsByEx.containsKey(i.exerciseId)) continue;
      logsByEx.addAll({
        i.exerciseId: logs.where((log) {
          return log.exerciseId == i.exerciseId;
        }).toList()
      });
    }
    // ---------------------------

    List<RoutineItemDto> dayItems = [];
    for (final itemTable in items) {
      //
      List<RoutineSetDto> itemSets = [];
      for (final setTable in sets) {
        print("found set");
        if (setTable.routineItemId == itemTable.id &&
            logsByEx.containsKey(itemTable.exerciseId)) {
          // To get the last weight on a [set] there are multiple things to do.
          //
          // * First, we get all the logs of an exercise, logs include set index
          //   and weight.
          final weights = logsByEx[itemTable.exerciseId]!
              // * Then we filter those logs by the setIndex... Why?
              //   to filter out-of-range sets of old sessions.
              .where((log) => log.setIndex == setTable.roundIndex)
              .toList();
          // * Then we sort in a descending order, so that the first item is the last.
          weights.sort((a, b) => b.completedAt.compareTo(a.completedAt));
          // print("----------------");
          // for (final w in weights) {
          //   print("""
          //     logid:     ${w.logId}
          //     exId:      ${w.exerciseId}
          //     setIndex:  ${w.setIndex}
          //     weights:    ${w.weights}
          //     completed: ${w.completedAt}
          // """);
          // }
          // print("----------------");
          itemSets.add(RoutineSetDto.fromTable(
              setTable, (weights.isEmpty) ? null : weights.first.weight));
        }
      }

      // itemSets.toSet().toList();

      final exercise =
          exercises.firstWhere((e) => e.apiId == itemTable.exerciseId);
      final img = _imagesCache.get(exercise.imageUrl);
      final group = groups.firstWhere((g) => g.apiId == exercise.muscleGroup);
      final itemDto = RoutineItemDto.fromTable(
          itemTable,
          ExerciseV2Dto.fromTable(exercise, group, exercise.imageUrl, img),
          itemSets);

      dayItems.add(itemDto);
    }

    return RoutineDayDto.fromTable(day.first, dayItems);
  }

  @override
  Future<TSessionModel?> getPreviousSession() async {
    final old = await (_database.select(_database.tSessions)
          ..where((f) => f.finishedAt.isNull()))
        .get();

    if (old.isNotEmpty) return TSessionModel.fromTable(old.first);

    return null;
  }

  @override
  Future<TSessionModel> startTrainingSession(int dayId) async {
    final session = await _database.into(_database.tSessions).insertReturning(
        db.TSessionsCompanion.insert(dayId: dayId, startedAt: DateTime.now()));

    return TSessionModel.fromTable(session);
  }

  @override
  Future<TLogModel> logSet(TLogModel log) async {
    if (log.id == null) {
      final newLog = await _database
          .into(_database.tLogs)
          .insertReturning(db.TLogsCompanion.insert(
            sessionId: log.sessionId,
            exerciseId: log.exerciseId,
            exerciseIndex: log.exerciseIndex,
            setIndex: log.setIndex,
            reps: log.reps,
            weight: log.weight,
            completedAt: log.completedAt,
          ));
      return TLogModel.fromTable(newLog);
    } else {
      final updatedLog = await (_database.update(_database.tLogs)
            ..where((f) => f.logId.equals(log.id!)))
          .writeReturning(db.TLogsCompanion.custom(
        weight: Constant(log.weight),
        version: Constant(log.version + 1),
        isSynced: const Constant(false),
      ));
      return TLogModel.fromTable(updatedLog.first);
    }
  }

  @override
  Future<void> finishTrainingSession(TSessionModel session) async {
    await (_database.update(_database.tSessions)
          ..where((f) => f.tsId.equals(session.id!)))
        .write(
      db.TSessionsCompanion.custom(
        finishedAt: Constant(DateTime.now()),
        version: Constant(session.version + 1),
        isSynced: const Constant(false),
      ),
    );
  }
}
