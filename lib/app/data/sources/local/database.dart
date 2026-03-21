import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uniceps/app/data/sources/local/database.steps.dart';
import 'package:uniceps/app/data/sources/local/tables/account/account_table.dart';
import 'package:uniceps/app/data/sources/local/tables/measurement/measurement_table.dart';
import 'package:uniceps/app/data/sources/local/tables/practice/t_logs_table.dart';
import 'package:uniceps/app/data/sources/local/tables/practice/t_sessions_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/days_group_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/exercises_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/routine_items_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/routines_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/sets_table.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    // - User
    Accounts,
    // - Training
    Routines,
    DaysGroup,
    RoutineItems,
    RoutineSets,
    Exercises,
    // ExerciseGroups,
    TSessions,
    TLogs,
    // - Measurements
    Measurements,
  ],
)
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        // databasePath: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => await m.createAll(),
    onUpgrade: _schemaUpgrade,
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  @override
  int get schemaVersion => 2;
}

extension Migrations on GeneratedDatabase {
  // Extracting the `stepByStep` call into a static field or method ensures that you're not
  // accidentally referring to the current database schema (via a getter on the database class).
  // This ensures that each step brings the database into the correct snapshot.
  OnUpgrade get _schemaUpgrade => stepByStep(
    from1To2: (m, schema) async {
      // 1. DISABLE foreign keys for the duration of this step
      await m.database.customStatement('PRAGMA foreign_keys = OFF;');

      await m.alterTable(
        TableMigration(
          schema.exercises,
          columnTransformer: {
            schema.exercises.apiId: const CustomExpression<String>('CAST(api_id AS TEXT)'),
            schema.exercises.muscleGroupName: CustomExpression<String>(
              "COALESCE(json_extract(muscle_group_translations, '\$.ar'), '')",
            ), // Extracting 'ar' key from JSON
            schema.exercises.muscleGroupCode: const Constant(''),
            schema.exercises.muscleHeadCode: const Constant(''),
            schema.exercises.muscleHeadName: const Constant(''),
            schema.exercises.auxMuscle1: const Constant(null),
            schema.exercises.auxMuscle2: const Constant(null),
            schema.exercises.auxMuscle3: const Constant(null),
            schema.exercises.laterals: const Constant(''),
            schema.exercises.description: const Constant(null),
            schema.exercises.toolCode: const Constant(''),
            schema.exercises.toolName: const Constant(''),
            schema.exercises.timestamp: Constant(DateTime(2000).toIso8601String()),
          },
        ),
      );

      await m.alterTable(
        TableMigration(
          schema.routineItems,
          columnTransformer: {
            schema.routineItems.exerciseId: const CustomExpression<String>('CAST(exercise_id AS TEXT)'),
          },
        ),
      );

      await m.alterTable(
        TableMigration(
          schema.tLogs,
          columnTransformer: {schema.tLogs.exerciseId: const CustomExpression<String>('CAST(exercise_id AS TEXT)')},
        ),
      );

      await m.alterTable(TableMigration(schema.routines));
      await m.alterTable(TableMigration(schema.accounts));
      await m.alterTable(TableMigration(schema.daysGroup));
      await m.alterTable(TableMigration(schema.tSessions));
      await m.alterTable(TableMigration(schema.measurements));

      // 3. RE-ENABLE foreign keys
      await m.database.customStatement('PRAGMA foreign_keys = ON;');
    },
  );
}
