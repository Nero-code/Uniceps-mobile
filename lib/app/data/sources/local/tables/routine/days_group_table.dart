import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/routine/routines_table.dart';

// part 'database.g.dart';

class DaysGroup extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();
  IntColumn get index => integer()();

  TextColumn get dayName => text().withLength(min: 1, max: 50)();

  // ForeignKey -> routine_id
  IntColumn get routine => integer().references(Routines, #id,
      onUpdate: KeyAction.cascade, onDelete: KeyAction.cascade)();
}
