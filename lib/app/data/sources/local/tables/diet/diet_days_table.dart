import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/diet/diet_plans_table.dart';

@DataClassName('DietDayData')
class DietDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get index => integer()();
  IntColumn get dietPlanId => integer().references(DietPlans, #id, onDelete: KeyAction.cascade)();
}
