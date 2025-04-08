import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';

class RoutineDay {
  const RoutineDay({
    required this.id,
    required this.apiId,
    required this.routineId,
    required this.version,
    required this.name,
    required this.index,
    required this.exercises,
    required this.isSynced,
  });
  final int? id, apiId;
  final int index, routineId, version;
  final String name;
  final List<RoutineItem> exercises;
  final bool isSynced;
}
