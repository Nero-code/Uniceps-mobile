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

      // 2. Clear tables (Drop and Recreate)
      // Drop in reverse order of dependencies
      await m.drop(schema.routineSets);
      await m.drop(schema.routineItems);
      await m.drop(schema.daysGroup);
      await m.drop(schema.routines);
      await m.drop(schema.exercises);
      await m.drop(schema.tLogs);
      await m.drop(schema.tSessions);

      // Recreate with new schema
      await m.createTable(schema.tSessions);
      await m.createTable(schema.tLogs);
      await m.createTable(schema.routines);
      await m.createTable(schema.exercises);
      await m.createTable(schema.daysGroup);
      await m.createTable(schema.routineItems);
      await m.createTable(schema.routineSets);

      // 3. Migrate tables to preserve (using alterTable to sync schema/defaults)

      await m.alterTable(TableMigration(schema.accounts));
      await m.alterTable(TableMigration(schema.measurements));

      // 4. RE-ENABLE foreign keys
      await m.database.customStatement('PRAGMA foreign_keys = ON;');
    },
  );
}
