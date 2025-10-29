import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/account/memberships_table.dart';

class Permissions extends Table {
  TextColumn get action => text()();
  IntColumn get maxCount => integer().nullable()();

  // Foreign key
  TextColumn get planId => text().references(Memberships, #id,
      onUpdate: KeyAction.cascade, onDelete: KeyAction.cascade)();
}
