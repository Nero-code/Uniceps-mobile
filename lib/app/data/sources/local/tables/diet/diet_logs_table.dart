import 'package:drift/drift.dart';

@DataClassName('DietLogData')
class DietLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiId => integer().nullable().unique()();
  TextColumn get name => text()();
  RealColumn get totalGrams => real()();
  RealColumn get calories => real()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fats => real()();
  DateTimeColumn get timestamp => dateTime()();

  IntColumn get version => integer()();
  BoolColumn get isSynced => boolean()();
}
