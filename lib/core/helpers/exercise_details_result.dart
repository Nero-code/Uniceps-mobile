import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';

class ExerciseDetailsResult {
  final Exercise exercise;
  final List<Exercise> similars;
  final List<TLog> timeline;
  const ExerciseDetailsResult({required this.exercise, required this.similars, required this.timeline});
}
