import 'package:drift/drift.dart';

class Exercises extends Table {
  // IntColumn get apiId => integer()();
  TextColumn get apiId => text()();

  TextColumn get name => text()();
  TextColumn get imageName => text().nullable()();

  TextColumn get muscleGroupCode => text()();
  TextColumn get muscleGroupName => text()();

  TextColumn get muscleHeadCode => text()();
  TextColumn get muscleHeadName => text()();

  TextColumn get laterals => text()();
  TextColumn get toolCode => text()();
  TextColumn get toolName => text()();

  TextColumn get auxMuscle1 => text().nullable()();
  TextColumn get auxMuscle2 => text().nullable()();
  TextColumn get auxMuscle3 => text().nullable()();
  TextColumn get description => text().nullable()();

  DateTimeColumn get timestamp => dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column<Object>>? get primaryKey => {apiId};
}
