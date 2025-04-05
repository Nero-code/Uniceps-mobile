import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

class Routine {
  const Routine({
    required this.id,
    required this.apiId,
    required this.issuerId,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.trainingDays,
    this.isCurrent = false,
  });

  final int? id, apiId;
  final int issuerId;
  final String name;
  final String? description;
  final bool isCurrent;
  final DateTime createdAt, updatedAt;
  final List<RoutineDay> trainingDays;
}
