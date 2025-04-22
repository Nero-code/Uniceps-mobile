import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/routines_table.dart';

class Sets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();
  IntColumn get roundIndex => integer()();
  IntColumn get repsCount => integer()();
  IntColumn get version => integer().clientDefault(() => 0)();

  BoolColumn get isSynced => boolean().clientDefault(() => false)();

  // Foreign Key
  IntColumn get routineItemId => integer().references(Routines, #id,
      onDelete: KeyAction.cascade, onUpdate: KeyAction.cascade)();
}
