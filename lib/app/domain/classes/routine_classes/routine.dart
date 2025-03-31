import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

class Routine {
  const Routine({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.trainingDays,
  });

  final int? id;
  final String name;
  final DateTime createdAt, updatedAt;
  final List<RoutineDay> trainingDays;
}
