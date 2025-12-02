import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/days_group_table.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/exercises_table.dart';

// part 'database.g.dart';

class RoutineItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();
  IntColumn get index => integer()();
  TextColumn get notes => text().nullable()();

  IntColumn get version => integer().clientDefault(() => 0)();
  BoolColumn get isSynced => boolean().clientDefault(() => false)();

  // Foreign Keys
  IntColumn get exerciseId =>
      integer().references(Exercises, #apiId, onUpdate: KeyAction.cascade, onDelete: KeyAction.cascade)();
  IntColumn get dayId =>
      integer().references(DaysGroup, #id, onUpdate: KeyAction.cascade, onDelete: KeyAction.cascade)();
}
