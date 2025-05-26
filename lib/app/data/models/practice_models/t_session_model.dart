import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';

class TSessionModel extends TSession {
  const TSessionModel({
    required super.id,
    required super.logs,
    required super.createdAt,
    required super.finishedAt,
    super.apiId,
    super.version = 0,
    super.isSynced = false,
  });
}
