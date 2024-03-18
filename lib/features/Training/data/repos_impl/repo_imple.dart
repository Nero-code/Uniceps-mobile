import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';

class TrainingRepoImple implements TrainingRepo {
  /**
   *  LocalDataSource local
   *  RemoteDataSource remot
   *  InternetConnectionChecker connection
   */
  TrainingRepoImple();

  @override
  Future<Either<Failure, Unit>> getPlayerMeasurments() {
    // TODO: implement getPlayerMeasurments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> getPlayerSubscriptions() {
    // TODO: implement getPlayerSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> getTrainingProgram() {
    // TODO: implement getTrainingProgram
    throw UnimplementedError();
  }
}
