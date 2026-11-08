import 'package:uniceps/app/domain/classes/routine_classes/exercise_tool.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

class ExerciseFilter {
  List<MuscleGroup> groups;
  List<ExerciseTool> tools;
  Map<String, String> heads;
  ExerciseFilter({required this.groups, required this.tools, required this.heads});

  factory ExerciseFilter.empty() => ExerciseFilter(groups: [], tools: [], heads: {});
}
