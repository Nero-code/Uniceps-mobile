// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_common.dart' as comm;
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(
              db,
              toVersion,
              options: const comm.ValidationOptions(
                validateColumnConstraints: true,
              ),
            );
            await db.close();
          });
        }
      });
    }
  });

  test('migration from v1 to v2 preserves and transforms data', () async {
    final now = DateTime.now();

    final oldExercisesData = [
      v1.ExercisesData(
        apiId: 101,
        name: 'Bench Press',
        imageUrl: 'bench_press.png',
        muscleGroupTranslations: '{"en": "Chest", "ar": "صدر"}',
      ),
    ];

    final oldRoutinesData = [
      v1.RoutinesData(
        id: 1,
        name: 'Strength Routine',
        version: 1,
        isCurrent: true,
        isSynced: false,
        createdAt: now,
        updatedAt: now,
      ),
    ];

    final oldDaysGroupData = [
      v1.DaysGroupData(
        id: 1,
        index: 0,
        version: 1,
        dayName: 'Day 1',
        isSynced: false,
        routineId: 1,
      ),
    ];

    final oldRoutineItemsData = [
      v1.RoutineItemsData(
        id: 1,
        index: 0,
        notes: 'Focus on form',
        version: 1,
        isSynced: false,
        exerciseId: 101,
        dayId: 1,
      ),
    ];

    final oldTSessionsData = [
      v1.TSessionsData(
        tsId: 1,
        dayId: 1,
        dayName: 'Day 1',
        startedAt: now,
        progress: 1.0,
        version: 1,
        isSynced: false,
      ),
    ];

    final oldTLogsData = [
      v1.TLogsData(
        logId: 1,
        exerciseId: 101,
        exerciseIndex: 0,
        setIndex: 0,
        reps: 10,
        weight: 60.0,
        completedAt: now,
        version: 1,
        isSynced: false,
        sessionId: 1,
      ),
    ];

    final expectedNewExercisesData = [
      v2.ExercisesData(
        apiId: '101',
        name: 'Bench Press',
        muscleGroupCode: '',
        muscleGroupName: 'صدر',
        muscleHeadCode: '',
        muscleHeadName: '',
        laterals: '',
        toolCode: '',
        toolName: '',
        timestamp: DateTime(2000).toIso8601String(),
      ),
    ];

    final expectedNewRoutineItemsData = [
      v2.RoutineItemsData(
        id: 1,
        index: 0,
        notes: 'Focus on form',
        version: 1,
        isSynced: 0,
        exerciseId: '101',
        dayId: 1,
      ),
    ];

    final expectedNewTLogsData = [
      v2.TLogsData(
        logId: 1,
        exerciseId: '101',
        exerciseIndex: 0,
        setIndex: 0,
        reps: 10,
        weight: 60.0,
        completedAt:
            "${now.toIso8601String()} +${now.timeZoneOffset.inHours.toString().padLeft(2, '0')}:00",
        version: 1,
        isSynced: 0,
        sessionId: 1,
      ),
    ];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.routines, oldRoutinesData);
        batch.insertAll(oldDb.daysGroup, oldDaysGroupData);
        batch.insertAll(oldDb.exercises, oldExercisesData);
        batch.insertAll(oldDb.routineItems, oldRoutineItemsData);
        batch.insertAll(oldDb.tSessions, oldTSessionsData);
        batch.insertAll(oldDb.tLogs, oldTLogsData);
      },
      validateItems: (newDb) async {
        expect(
          await newDb.select(newDb.exercises).get(),
          expectedNewExercisesData,
        );
        expect(
          await newDb.select(newDb.routineItems).get(),
          expectedNewRoutineItemsData,
        );
        expect(await newDb.select(newDb.tLogs).get(), expectedNewTLogsData);
      },
    );
  });
}
