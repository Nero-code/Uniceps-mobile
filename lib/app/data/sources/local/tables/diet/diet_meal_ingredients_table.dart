import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/diet/diet_meals_table.dart';

@DataClassName('DietMealIngredientData')
class DietMealIngredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  IntColumn get index => integer()();
  TextColumn get description => text().nullable()();

  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  TextColumn get category => text()();
  RealColumn get servingSizeInGrams => real()();
  RealColumn get calories => real()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fats => real()();

  IntColumn get dietMealId => integer().references(DietMeals, #id, onDelete: KeyAction.cascade)();
}
