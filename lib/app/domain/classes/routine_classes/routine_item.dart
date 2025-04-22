import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';

class RoutineItem {
  const RoutineItem({
    required this.id,
    required this.apiId,
    required this.dayId,
    required this.index,
    required this.version,
    required this.exercise,
    required this.sets,
    required this.isSynced,
  });

  final int? id, apiId;
  final int dayId, index, version;
  final ExerciseV2 exercise;
  final List<RoutineSet> sets;
  final bool isSynced;
}
