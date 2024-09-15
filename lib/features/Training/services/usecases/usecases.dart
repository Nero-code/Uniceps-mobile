import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Training/services/entities/avatar.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/features/Training/services/entities/presence.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';

class TrainingUsecases {
  final TrainingRepo _repo;

  TrainingUsecases({required TrainingRepo repo}) : _repo = repo;

  Future<Either<Failure, TrainingProgram>> getTrainingProgram() async {
    return await _repo.getTrainingProgram();
  }

  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(
      int filter) async {
    return await _repo.getExercisesByFilter(filter);
  }

  Future<Either<Failure, bool>> completeExercise(String eId) async {
    return await _repo.completeExercise(eId);
  }

  Future<Either<Failure, HandShake>> getCurrentHandshake() async {
    return await _repo.getCurrentHandshake();
  }

  Future<Either<Failure, List<Presence>>> getPresenceAtGym(
      {required String gymId}) async {
    return await _repo.getPresenceAtGym(gymId);
  }

  Future<Either<Failure, Avatar>> getAvatar() async {
    return await _repo.getAvatar();
  }

  Future<Either<Failure, Unit>> saveNewWeight(Map<String, double> val) async {
    return await _repo.saveNewWeight(val);
  }
}
