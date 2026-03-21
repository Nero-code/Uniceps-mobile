import 'package:drift/drift.dart';

class Exercises extends Table {
  // IntColumn get apiId => integer()();
  TextColumn get apiId => text()(); // TODO: migrate v2-UPDATED

  TextColumn get name => text()();
  // TextColumn get imageName => text().nullable()(); // TODO: migrate v2-DELETE

  // TextColumn get muscleGroupTranslations => text()();
  TextColumn get muscleGroupCode => text()(); // TODO: migrate v2-NEW
  TextColumn get muscleGroupName => text()(); // TODO: migrate v2-UPDATED

  TextColumn get muscleHeadCode => text()(); // TODO: migrate v2-NEW
  TextColumn get muscleHeadName => text()(); // TODO: migrate v2-NEW

  TextColumn get auxMuscle1 => text().nullable()(); // TODO: migrate v2-NEW
  TextColumn get auxMuscle2 => text().nullable()(); // TODO: migrate v2-NEW
  TextColumn get auxMuscle3 => text().nullable()(); // TODO: migrate v2-NEW
  TextColumn get laterals => text()(); // TODO: migrate v2-NEW
  TextColumn get description => text().nullable()(); // TODO: migrate v2-NEW

  TextColumn get toolCode => text()(); // TODO: migrate v2-NEW
  TextColumn get toolName => text()(); // TODO: migrate v2-NEW

  DateTimeColumn get timestamp => dateTime().clientDefault(() => DateTime(2000))(); // TODO: migrate v2-NEW

  @override
  Set<Column<Object>>? get primaryKey => {apiId};
}
