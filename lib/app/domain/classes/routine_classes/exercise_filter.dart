import 'package:uniceps/app/domain/classes/routine_classes/exercise_tool.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

class ExerciseFilter {
  List<MuscleGroup> groups;
  List<ExerciseTool> tools;
  ExerciseFilter({required this.groups, required this.tools});

  factory ExerciseFilter.empty() => ExerciseFilter(groups: [], tools: []);
}
