import 'package:drift/drift.dart';

class TSessions extends Table {
  late final tsId = integer().autoIncrement()();

  late final startedAt = dateTime()();
  late final finishedAt = dateTime().nullable()();

  // For Syncing...
  late final apiId = integer().nullable()();
  late final version = integer().withDefault(const Constant(0))();
  late final isSynced = boolean().withDefault(const Constant(false))();
}
