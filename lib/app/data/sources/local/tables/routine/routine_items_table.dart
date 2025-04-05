import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/days_group_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/exercises_table.dart';

// part 'database.g.dart';

class RoutineItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();
  IntColumn get index => integer()();

  TextColumn get notes => text().nullable()();

  // Foreign Keys
  IntColumn get exercise => integer().references(Exercises, #id,
      onUpdate: KeyAction.cascade, onDelete: KeyAction.cascade)();
  IntColumn get day => integer().references(DaysGroup, #id,
      onUpdate: KeyAction.cascade, onDelete: KeyAction.cascade)();
}
