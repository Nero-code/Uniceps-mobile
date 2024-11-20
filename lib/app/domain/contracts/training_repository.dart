import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/app/domain/classes/training_entities/exercise.dart';
import 'package:uniceps/app/domain/classes/training_entities/training_program.dart';

abstract class TrainingRepo {
  Future<Either<Failure, TrainingProgram>> getTrainingProgram();

  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(int filter);

  Future<Either<Failure, bool>> completeExercise(String eId);

  Future<Either<Failure, Unit>> saveNewWeight(Map<String, double> val);

  Future<Either<Failure, List<Gym>>> getSubscribedToGyms();

  Future<Either<Failure, List<Gym>>> setSelectedGym(String gymId);
}
