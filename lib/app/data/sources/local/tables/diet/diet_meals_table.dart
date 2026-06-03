import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/diet/diet_days_table.dart';

@DataClassName('DietMealData')
class DietMeals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get index => integer()();
  TextColumn get description => text().nullable()();

  IntColumn get dietDayId => integer().references(DietDays, #id, onDelete: KeyAction.cascade)();
}
