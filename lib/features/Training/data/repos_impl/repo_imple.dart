import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/repos/repository.dart';

class TrainingRepoImple implements TrainingRepo {
  final LocalTrainingSource local;
  final RemoteTrainingSource remote;
  final InternetConnectionChecker connection;

  TrainingRepoImple({
    required this.local,
    required this.remote,
    required this.connection,
  });

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
