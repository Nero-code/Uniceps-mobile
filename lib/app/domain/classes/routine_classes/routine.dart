import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

@freezed
class Routine {
  const Routine({
    required this.id,
    required this.apiId,
    required this.issuerId,
    required this.version,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.trainingDays,
    required this.isSynced,
    this.isCurrent = false,
  });

  final int? id, apiId;
  final int version, issuerId;
  final String name;
  final String? description;
  final bool isCurrent, isSynced;
  final DateTime createdAt, updatedAt;
  final List<RoutineDay> trainingDays;
}
