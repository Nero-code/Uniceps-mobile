import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
// import 'package:uniceps/features/Profile/domain/measrument.dart';
// import 'package:uniceps/features/Profile/domain/subscription.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';

abstract class TrainingRepo {
  Future<Either<Failure, TrainingProgram>> getTrainingProgram();
  // Future<Either<Failure, List<Subscription>>> getPlayerSubscriptions();
  // Future<Either<Failure, List<Measurement>>> getPlayerMeasurments();
}
