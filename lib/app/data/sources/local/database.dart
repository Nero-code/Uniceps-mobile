import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uniceps/app/data/sources/local/schema_versions.dart';
import 'package:uniceps/app/data/sources/local/tables/account/account_table.dart';
import 'package:uniceps/app/data/sources/local/tables/account/permissions_table.dart';
import 'package:uniceps/app/data/sources/local/tables/account/subscriptions_table.dart';
import 'package:uniceps/app/data/sources/local/tables/practice/t_logs_table.dart';
import 'package:uniceps/app/data/sources/local/tables/practice/t_sessions_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/days_group_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/exercise_groups_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/exercises_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/routine_items_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/routines_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/sets_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    // - User
    Accounts,
    Subscriptions,
    Permissions,
    // - Training
    Routines,
    DaysGroup,
    RoutineItems,
    RoutineSets,
    Exercises,
    ExerciseGroups,
    TSessions,
    TLogs,
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
        onUpgrade: stepByStep(),
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  @override
  int get schemaVersion => 1;
}
