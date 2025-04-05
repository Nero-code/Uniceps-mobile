import 'package:drift/drift.dart';

class Routines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  BoolColumn get isCurrent => boolean().clientDefault(() => false)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
