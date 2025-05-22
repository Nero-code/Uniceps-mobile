import 'package:drift/drift.dart';

class Routines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();
  IntColumn get version => integer().clientDefault(() => 0)();

  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().nullable()();

  BoolColumn get isCurrent => boolean().clientDefault(() => false)();
  BoolColumn get isSynced => boolean().clientDefault(() => false)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
