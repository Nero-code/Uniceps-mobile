import 'package:drift/drift.dart';

@DataClassName('IngredientData')
class Ingredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  // TextColumn get code => text()(); // Replace with id
  TextColumn get name => text()();
  // TextColumn get nameAr => text()();
  // TextColumn get nameEn => text()(); // remove
  TextColumn get categoryText => text().nullable()();
  RealColumn get servingSizeInGrams => real()();
  RealColumn get calories => real()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fats => real()();

  // @override
  // Set<Column> get primaryKey => {code}; // USELESS
}
