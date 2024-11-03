import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/classes/gym.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';

class TrainingUsecases {
  final TrainingRepo _repo;

  TrainingUsecases({required TrainingRepo repo}) : _repo = repo;

  Future<Either<Failure, TrainingProgram>> getTrainingProgram(
      /**String gymId*/) async {
    return await _repo.getTrainingProgram(/**gymId*/);
  }

  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(
      int filter) async {
    return await _repo.getExercisesByFilter(filter);
  }

  Future<Either<Failure, bool>> completeExercise(String eId) async {
    return await _repo.completeExercise(eId);
  }

  Future<Either<Failure, List<Gym>>> getSubscribedToGyms() async {
    return await _repo.getSubscribedToGyms();
  }

  Future<Either<Failure, List<Gym>>> setSelectedGym(String gymId) async {
    return await _repo.setSelectedGym(gymId);
  }

  Future<Either<Failure, Unit>> saveNewWeight(Map<String, double> val) async {
    return await _repo.saveNewWeight(val);
  }
}
