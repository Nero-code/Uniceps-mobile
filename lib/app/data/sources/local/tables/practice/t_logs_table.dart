import 'package:drift/drift.dart';
import 'package:uniceps/app/data/sources/local/tables/practice/t_sessions_table.dart';

class TLogs extends Table {
  late final logId = integer().autoIncrement()();

  late final exerciseId = integer()();
  late final exerciseIndex = integer()();

  late final setIndex = integer()();
  late final reps = integer()();
  late final weight = real()();
  late final completedAt = dateTime()();

  // For Syncing
  late final apiId = integer().nullable()();
  late final version = integer().withDefault(const Constant(0))();
  late final isSynced = boolean().withDefault(const Constant(false))();

  // Foreign Key
  late final sessionId = integer().references(TSessions, #tsId,
      onDelete: KeyAction.cascade, onUpdate: KeyAction.cascade)();
}
