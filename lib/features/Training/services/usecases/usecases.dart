import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Training/services/entities/presence.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';

class TrainingUsecases {
  final TrainingRepo _repo;

  TrainingUsecases({required TrainingRepo repo}) : _repo = repo;

  Future<Either<Failure, TrainingProgram>> getTrainingProgram() async {
    return await _repo.getTrainingProgram();
  }

  Future<Either<Failure, List<Presence>>> getPresenceAtGym(
      {required String gymId}) async {
    return await _repo.getPresenceAtGym(gymId: gymId);
  }
}
