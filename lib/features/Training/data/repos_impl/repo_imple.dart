import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/entities/presence.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';
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
  Future<Either<Failure, TrainingProgram>> getTrainingProgram() async {
    print("Checking Connection");
    if (await connection.hasConnection) {
      print("Connected!!");
      try {
        final res = await remote.getTrainingProgram();
        return Right(res);
      } catch (e) {
        return Left(
          GeneralPurposFailure(errorMessage: "asdasda"),
        );
      }
    }
    print("NO Connection!");
    return Left(EmptyCacheFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, List<Presence>>> getPresenceAtGym(
      {required String gymId}) async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.getPresence(gymId);
        await local.savePresenceUnderGym(res, gymId);
        return Right(res);
      } catch (e) {
        return Left(ServerFailure(errMsg: "ServerError!"));
      }
    } else {
      try {
        final res = await local.getPresence(gymId);
        return Right(res);
      } catch (e) {
        return Left(EmptyCacheFailure(errorMessage: "No Records!"));
      }
    }
  }
}
