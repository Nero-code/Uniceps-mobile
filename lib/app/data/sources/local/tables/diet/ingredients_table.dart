import 'package:drift/drift.dart';

@DataClassName('IngredientData')
class Ingredients extends Table {
  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  TextColumn get category => text()();
  TextColumn get servingSizeInGrams => text()();
  TextColumn get calories => text()();
  TextColumn get protein => text()();
  TextColumn get carbs => text()();
  TextColumn get fats => text()();

  @override
  Set<Column> get primaryKey => {code};
}
