import 'package:drift/drift.dart';

class Memberships extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get planId => text()();
  TextColumn get planName => text()();
  RealColumn get price => real()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isActive => boolean()();
  BoolColumn get isGift => boolean()();
}
