import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class TrainingRepo {
  Future<Either<Failure, Unit>> getTrainingProgram();
  Future<Either<Failure, Unit>> getPlayerSubscriptions();
  Future<Either<Failure, Unit>> getPlayerMeasurments();
}
