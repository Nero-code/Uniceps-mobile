import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/exercise_groups_table.dart';

// part 'database.g.dart';

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();

  TextColumn get name => text()();
  TextColumn get imageUrl => text()();

  // Foreign Key
  IntColumn get muscleGroup => integer().references(ExerciseGroups, #id)();

  // Unique Columns
  @override
  List<Set<Column<Object>>> get uniqueKeys => [
        {apiId}
      ];
}
