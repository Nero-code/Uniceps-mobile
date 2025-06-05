import 'dart:typed_data';

import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/core/errors/exceptions.dart';

import '../../../data_layer_test.mocks.dart';
import 'practice_entities.dart';

void main() async {
  late db.AppDatabase database;
  late TSessionLocalSource sessionLocalSource;
  final imageMock = MockBox<Uint8List>();

  setUp(() async {
    database = db.AppDatabase(drift.DatabaseConnection(
      NativeDatabase.memory(),
      closeStreamsSynchronously: true,
    ));

    await database
        .into(database.exerciseGroups)
        .insert(mockGroups.toCompanion(true));
    await database
        .into(database.exercises)
        .insert(mockExercise.toCompanion(true));

    await database
        .into(database.routines)
        .insert(mockRoutine.toCompanion(true));
    await database.into(database.daysGroup).insert(mockDay.toCompanion(true));
    await database
        .into(database.routineItems)
        .insert(mockItem.toCompanion(true));
    await database.into(database.routineSets).insert(mockSet.toCompanion(true));

    sessionLocalSource =
        TSessionLocalSource(database: database, imagesCache: imageMock);
  });

  tearDown(() async {
    await database.close();
  });

  group('drift database tests', () {
    test('should return 1 muscle group on fresh creation', () async {
      final res = await database.select(database.exerciseGroups).get();

      expect(res.length, equals(1));
    });
    test('should return 1 exercise on fresh creation', () async {
      final res = await database.select(database.exercises).get();

      expect(res.length, equals(1));
    });
    test('should return 1 routine on fresh creation', () async {
      final res = await database.select(database.routines).get();

      expect(res.length, equals(1));
    });
    test('should return 1 day on fresh creation', () async {
      final res = await database.select(database.daysGroup).get();

      expect(res.length, equals(1));
    });

    test('should return 1 routineItem on fresh creation', () async {
      final res = await database.select(database.routineItems).get();

      expect(res.length, equals(1));
    });
    test('should return 1 set on fresh creation', () async {
      final res = await database.select(database.routineSets).get();

      expect(res.length, equals(1));
    });
  });
  group('getCurrentRoutine', () {
    test('should return null if no current routine is found', () async {
      // Database already has a routine(isCurrent: true)

      final result = await sessionLocalSource.getCurrentRoutine();

      expect(result.head, isNull);
      expect(result.tail, isNull);
    });

    test('should return a RoutineDto if a current routine is found', () async {
      await (database.update(database.routines)..where((f) => f.id.equals(0)))
          .write(db.RoutinesCompanion.custom(
              isCurrent: const drift.Constant(true)));

      final result = await sessionLocalSource.getCurrentRoutine();

      expect(result.head!.id, equals(0));
      expect(result.head!.name, equals(parseRoutine.name));
      expect(result.head!.isCurrent, equals(true));

      expect(
        result.head!.trainingDaysDto.length,
        equals(parseRoutine.trainingDaysDto.length),
      );
      expect(
        result.head!.trainingDays.length,
        equals(parseRoutine.trainingDays.length),
      );
    });

    test('should return a Tuple (Routine, dayId) if a current routine is found',
        () async {
      await (database.update(database.routines)..where((f) => f.id.equals(0)))
          .write(db.RoutinesCompanion.custom(
              isCurrent: const drift.Constant(true)));
      await database.into(database.tSessions).insert(mockFinishedTSession);

      final result = await sessionLocalSource.getCurrentRoutine();

      // Head Tests
      expect(result.head!.id, equals(0));
      expect(result.head!.name, equals(parseRoutine.name));
      expect(result.head!.isCurrent, equals(true));

      expect(
        result.head!.trainingDaysDto.length,
        equals(parseRoutine.trainingDaysDto.length),
      );
      expect(
        result.head!.trainingDays.length,
        equals(parseRoutine.trainingDays.length),
      );

      // Tail Tests
      expect(result.tail, isNotNull);
      expect(result.tail, equals(0));
    });
  });
  group('getPreviousSession', () {
    test('should return sessionDto if a previous unfinished session exists',
        () async {
      await database
          .into(database.tSessions)
          .insert(mockUnfinishedTSession.toCompanion(true));

      final result = await sessionLocalSource.getPreviousSession();

      expect(result!, isNotNull);
      expect(result.id, equals(mockUnfinishedTSession.tsId));
      expect(result.dayId, equals(mockUnfinishedTSession.dayId));
      expect(result.finishedAt, isNull);
    });
    test('should return null if no session exists', () async {
      // database has no session saved.

      final result = await sessionLocalSource.getPreviousSession();

      expect(result, isNull);
    });
    test('should return null if no unfinished session exists', () async {
      await database
          .into(database.tSessions)
          .insert(mockFinishedTSession.toCompanion(true));

      final result = await sessionLocalSource.getPreviousSession();

      expect(result, isNull);
    });
  });
  group('startTrainingSession', () {
    test('should start a new training session', () async {
      final result = await sessionLocalSource.startTrainingSession(0);

      expect(result.id, isNotNull);
      expect(result.dayId, equals(0));
      expect(result.createdAt, isNotNull);
      expect(result.finishedAt, isNull);
      expect(result.logs, isEmpty);
    });
  });
  group('logSet', () {
    test('should insert a new log', () async {
      await database.into(database.tSessions).insert(mockUnfinishedTSession);
      final result = await sessionLocalSource.logSet(mockTLogModel);

      expect(result.sessionId, equals(mockTLogModel.sessionId));
      expect(result.exerciseId, equals(mockTLogModel.exerciseId));
      expect(result.completedAt, equals(mockTLogModel.completedAt));
      expect(result.exerciseIndex, equals(mockTLogModel.exerciseIndex));
      expect(result.reps, equals(mockTLogModel.reps));
      expect(result.weight, equals(mockTLogModel.weight));
    });

    test('should update an existing log', () async {
      await database.into(database.tSessions).insert(mockUnfinishedTSession);
      await database.into(database.tLogs).insert(mockTLog);

      final updatedLog = TLogModel.fromTable(mockTLog.copyWith(weight: 30));
      final result = await sessionLocalSource.logSet(updatedLog);

      expect(result.id, equals(updatedLog.id));
      expect(result.sessionId, equals(updatedLog.sessionId));
      expect(result.weight, equals(updatedLog.weight));
    });
  });
  group('finishTrainingSession', () {
    test('should update session as finished', () async {
      await database.into(database.tSessions).insert(mockUnfinishedTSession);

      final oldUnfinishedSession =
          await sessionLocalSource.getPreviousSession();
      expect(oldUnfinishedSession, isNotNull);

      await sessionLocalSource.finishTrainingSession(
          TSessionModel.fromTable(mockUnfinishedTSession));

      final newUnfinishedSession =
          await sessionLocalSource.getPreviousSession();
      expect(newUnfinishedSession, isNull);
    });
  });
  group('getDayItems', () {
    test('should throw EmptyCacheExeption if day does not exist', () async {
      // database has full routine already stored

      expect(() async => await sessionLocalSource.getDayItems(1),
          throwsA(isA<EmptyCacheExeption>()));
    });
    test('should fetch routine items and return correct structure', () async {
      // database has full routine already stored

      final res = await sessionLocalSource.getDayItems(0);

      expect(res, isNotNull);
      expect(res.id, equals(0));
      expect(res.items.length, equals(1));
      expect(res.name, equals('day 1'));
    });
  });
}
