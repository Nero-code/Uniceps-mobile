import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';

class RoutineDay {
  const RoutineDay({
    required this.id,
    required this.apiId,
    required this.name,
    required this.index,
    required this.exercises,
  });
  final int? id, apiId;
  final String name;
  final int index;
  final List<RoutineItem> exercises;
}
