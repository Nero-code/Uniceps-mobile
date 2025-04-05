import 'package:drift/drift.dart';

class Account extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get phone => text().withLength(min: 1, max: 20)();
  TextColumn get email => text().withLength(min: 1, max: 255)();
  DateTimeColumn get birthDate => dateTime()();
  BoolColumn get gender => boolean()();
}
