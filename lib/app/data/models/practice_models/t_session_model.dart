import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';

class TSessionModel extends TSession {
  const TSessionModel({
    required super.id,
    required super.dayId,
    required super.logs,
    required super.createdAt,
    required super.finishedAt,
    super.apiId,
    super.version = 0,
    super.isSynced = false,
  });

  factory TSessionModel.fromTable(db.TSession table) => TSessionModel(
        id: table.tsId,
        dayId: table.dayId,
        logs: <TLog>[],
        createdAt: table.startedAt,
        finishedAt: table.finishedAt,
      );
}
