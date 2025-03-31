import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';

class RoutineItem {
  const RoutineItem({
    required this.id,
    required this.exercise,
    required this.sets,
  });

  final int? id;
  final ExerciseV2 exercise;
  final List<RoutineSets> sets;
}
