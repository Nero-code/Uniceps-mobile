import 'package:drift/drift.dart';

class Subscriptions extends Table {
  TextColumn get id => text()();
  TextColumn get planName => text()();
  RealColumn get price => real()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isActive => boolean()();
  BoolColumn get isGift => boolean()();
}
