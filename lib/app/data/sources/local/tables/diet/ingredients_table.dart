import 'package:drift/drift.dart';

@DataClassName('IngredientData')
class Ingredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get apiId => text().nullable()();

  BoolColumn get isUserGenerated => boolean()();
  TextColumn get name => text()();
  IntColumn get categoryId => integer()();
  TextColumn get categoryName => text()();
  RealColumn get servingSizeInGrams => real()();
  RealColumn get calories => real()();
  RealColumn get protein => real()();
  RealColumn get carbs => real()();
  RealColumn get fats => real()();

  IntColumn get version => integer()();
  BoolColumn get isSynced => boolean()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
}
