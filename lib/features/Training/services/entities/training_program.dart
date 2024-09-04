import 'package:uniceps/features/Training/data/models/exercise_model.dart';

class TrainingProgram {
  final String id, gymId, pid;
  final DateTime createdAt;
  final Map<String, String> daysGroupMap;
  final List<ExerciseModel> exercises;

  TrainingProgram({
    required this.id,
    required this.gymId,
    required this.pid,
    required this.createdAt,
    required this.daysGroupMap,
    required this.exercises,
  });
}
