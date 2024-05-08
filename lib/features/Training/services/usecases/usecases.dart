import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
// import 'package:uniceps/features/Profile/domain/measrument.dart';
// import 'package:uniceps/features/Profile/domain/subscription.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';

class TrainingUsecases {
  final TrainingRepo _repo;

  TrainingUsecases({required TrainingRepo repo}) : _repo = repo;

  // Future<Either<Failure, List<Measurement>>> getPlayerMeasurments() async {
  //   return await _repo.getPlayerMeasurments();
  // }

  // Future<Either<Failure, List<Subscription>>> getPlayerSubscriptions() async {
  //   return await _repo.getPlayerSubscriptions();
  // }

  Future<Either<Failure, TrainingProgram>> getTrainingProgram() async {
    return await _repo.getTrainingProgram();
  }
}
