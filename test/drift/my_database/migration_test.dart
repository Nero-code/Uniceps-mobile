// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:test/test.dart';
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
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    final versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test("migration from v1 to v2 does not corrupt data", () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldRoutinesData = <v1.RoutinesData>[];
    final expectedNewRoutinesData = <v2.RoutinesData>[];

    final oldDaysGroupData = <v1.DaysGroupData>[];
    final expectedNewDaysGroupData = <v2.DaysGroupData>[];

    final oldExerciseGroupsData = <v1.ExerciseGroupsData>[];
    final expectedNewExerciseGroupsData = <v2.ExerciseGroupsData>[];

    final oldExercisesData = <v1.ExercisesData>[];
    final expectedNewExercisesData = <v2.ExercisesData>[];

    final oldRoutineItemsData = <v1.RoutineItemsData>[];
    final expectedNewRoutineItemsData = <v2.RoutineItemsData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.routines, oldRoutinesData);
        batch.insertAll(oldDb.daysGroup, oldDaysGroupData);
        batch.insertAll(oldDb.exerciseGroups, oldExerciseGroupsData);
        batch.insertAll(oldDb.exercises, oldExercisesData);
        batch.insertAll(oldDb.routineItems, oldRoutineItemsData);
      },
      validateItems: (newDb) async {
        expect(
            expectedNewRoutinesData, await newDb.select(newDb.routines).get());
        expect(expectedNewDaysGroupData,
            await newDb.select(newDb.daysGroup).get());
        expect(expectedNewExerciseGroupsData,
            await newDb.select(newDb.exerciseGroups).get());
        expect(expectedNewExercisesData,
            await newDb.select(newDb.exercises).get());
        expect(expectedNewRoutineItemsData,
            await newDb.select(newDb.routineItems).get());
      },
    );
  });
}
