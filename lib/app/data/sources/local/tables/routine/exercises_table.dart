import 'package:drift/drift.dart';

class Exercises extends Table {
  IntColumn get apiId => integer()();

  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  TextColumn get muscleGroupTranslations => text()();

  @override
  Set<Column<Object>>? get primaryKey => {apiId};
}
