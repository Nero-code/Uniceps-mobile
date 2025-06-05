import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';

class TSession {
  final int? id;
  final int dayId;
  final List<TLog> logs;
  final DateTime createdAt;
  final DateTime? finishedAt;

  final int? apiId;
  final int version;
  final bool isSynced;

  const TSession({
    required this.id,
    required this.dayId,
    required this.logs,
    required this.apiId,
    required this.createdAt,
    required this.finishedAt,
    this.version = 0,
    this.isSynced = false,
  });

  // TSession copywith({
  //   int? id,
  //   int? apiId,
  //   DateTime? createdAt,
  //   DateTime? finishedAt,
  //   int? version,
  //   bool? isSynced,
  // }) =>
  //     TSession(
  //       id: id ?? this.id,
  //       logs: logs ?? this.logs,
  //       apiId: apiId ?? this.apiId,
  //       createdAt: createdAt ?? this.createdAt,
  //       finishedAt: finishedAt ?? this.finishedAt,
  //       version: version ?? this.version,
  //       isSynced: isSynced ?? this.isSynced,
  //     );
}
