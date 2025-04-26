import 'package:drift/drift.dart';

// part 'database.g.dart';

class ExerciseGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer()();

  TextColumn get arName => text()();
  TextColumn get enName => text()();
}
