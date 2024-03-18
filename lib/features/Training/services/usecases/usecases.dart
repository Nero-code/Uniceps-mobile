import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';

class TrainingUsecases implements TrainingRepo {
  final TrainingRepo _repo;

  TrainingUsecases({required TrainingRepo repo}) : _repo = repo;

  @override
  Future<Either<Failure, Unit>> getPlayerMeasurments() async {
    return await _repo.getPlayerMeasurments();
  }

  @override
  Future<Either<Failure, Unit>> getPlayerSubscriptions() async {
    return await _repo.getPlayerSubscriptions();
  }

  @override
  Future<Either<Failure, Unit>> getTrainingProgram() async {
    return await _repo.getTrainingProgram();
  }
}
