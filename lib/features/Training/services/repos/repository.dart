import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';

abstract class TrainingRepo {
  Future<Either<Failure, TrainingProgram>> getTrainingProgram(
      /**String gymId*/);

  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(int filter);

  Future<Either<Failure, bool>> completeExercise(String eId);

  Future<Either<Failure, Unit>> saveNewWeight(Map<String, double> val);

  Future<Either<Failure, HandShake>> getCurrentHandshake();

  Future<Either<Failure, List<Gym>>> getSubscribedToGyms();
  Future<Either<Failure, List<Gym>>> setSelectedGym(String gymId);
}
