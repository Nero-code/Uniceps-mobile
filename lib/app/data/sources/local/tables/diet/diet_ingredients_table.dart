import 'package:drift/drift.dart';

@DataClassName('DietIngredientsData')
class DietIngredients extends Table {
  TextColumn get code => text()();
  TextColumn get nameAr => text()();
  TextColumn get nameEn => text()();
  TextColumn get category => text()();
  TextColumn get servingSizeInGrams => text()();
  TextColumn get calories => text()();
  TextColumn get protein => text()();
  TextColumn get carbs => text()();
  TextColumn get fats => text()();
}
