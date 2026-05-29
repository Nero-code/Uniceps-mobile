import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';

class ExerciseDetailsResult {
  final Exercise exercise;
  final List<Exercise> similars;
  const ExerciseDetailsResult({required this.exercise, required this.similars});
}
