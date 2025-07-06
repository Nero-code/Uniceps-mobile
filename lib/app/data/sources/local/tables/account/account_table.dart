import 'package:drift/drift.dart';

class Accounts extends Table {
  TextColumn get email => text().withLength(min: 1, max: 255)();
  TextColumn get type => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime()();
}
