import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';

class TrainingProgram {
  final String id, name;
  final Map<MuscleGroup, Exercise> program;

  TrainingProgram({
    required this.id,
    required this.name,
    required this.program,
  });
}
