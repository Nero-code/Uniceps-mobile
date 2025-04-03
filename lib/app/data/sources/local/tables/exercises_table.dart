import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/exercise_groups_table.dart';

// part 'database.g.dart';

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();

  TextColumn get name => text()();

  // Foreign Key
  IntColumn get muscleGroup => integer().references(ExerciseGroups, #id)();
}
