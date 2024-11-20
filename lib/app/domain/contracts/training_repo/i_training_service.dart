import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/training_entities/exercise.dart';
import 'package:uniceps/app/domain/classes/training_entities/training_program.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class ITrainingService {
  Future<Either<Failure, TrainingProgram>> getTrainingProgram();

  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(int filter);

  Future<Either<Failure, bool>> completeExercise(String eId);

  Future<Either<Failure, Unit>> saveNewWeight(Map<String, double> val);
}
