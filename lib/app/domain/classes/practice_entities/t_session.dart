import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';

class TSession extends Equatable {
  final int? id;
  final int dayId;
  final List<TLog> logs;
  final DateTime createdAt;
  final DateTime? finishedAt;

  final double progress;

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
    this.progress = 0,
    this.version = 0,
    this.isSynced = false,
  });

  @override
  List<Object?> get props => [id, dayId, logs.length, progress];
}
