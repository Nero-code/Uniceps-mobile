import 'package:drift/drift.dart';

class Subscriptions extends Table {
  TextColumn get planName => text()();
  TextColumn get planId => text()();
  RealColumn get price => real()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isActive => boolean()();
  BoolColumn get isGift => boolean()();
}
