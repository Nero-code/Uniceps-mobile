import 'package:equatable/equatable.dart';
import 'package:uniceps/app/Training/data/models/exercise_model.dart';

class TrainingProgram extends Equatable {
  final String id, gymId, pid;
  final DateTime createdAt;
  final Map<dynamic, dynamic> daysGroupMap;
  final List<ExerciseModel> exercises;

  const TrainingProgram({
    required this.id,
    required this.gymId,
    required this.pid,
    required this.createdAt,
    required this.daysGroupMap,
    required this.exercises,
  });

  @override
  List<Object?> get props => [id, gymId, pid];
}
