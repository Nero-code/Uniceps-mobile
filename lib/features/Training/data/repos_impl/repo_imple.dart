import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/entities/avatar.dart';
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
    print("inside training repo");
    // return Left(ServerFailure(errMsg: "something went wrong!"));
    // return Left(NoInternetConnectionFailure(errMsg: "No Internet connection!"));
    // return Left(NoGymSpecifiedFailure(errMsg: "Not a participent in a gym"));

    // bool? isSignedToAGym;

    if (await connection.hasConnection) {
      print("CONNECTED !!!");
      try {
        final handshake = await remote.getCurrentHandshake();
        print("gymId: ${handshake.gymId}\n" "playerId: ${handshake.playerId}");
        final weights = await local.getWeights();
        final res = await remote.getTrainingProgram(
          gymId: handshake.gymId,
          pid: handshake.playerId,
          weights: weights,
        );
        print("TrainingProgram finished");

        await local.saveTrainingProgram(res);
        return Right(res);
      } on NoGymSpecifiedException {
        return Left(
            NoGymSpecifiedFailure(errMsg: "No handshakes found for player"));
      } on ServerException {
        return Left(ServerFailure(errMsg: "Error happened serverside"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final res = await local.getTrainingProgram();
        return Right(res);
      } on EmptyCacheExeption {
        return Left(OfflineFailure(errorMessage: "no internet"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, HandShake>> getCurrentHandshake() async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.getCurrentHandshake();
        return Right(res);
      } on NoGymSpecifiedException {
        return Left(NoGymSpecifiedFailure(errMsg: "no handshakes found"));
      } on ServerException {
        return Left(ServerFailure(errMsg: "Server Side Error"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: "no internet"));
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

  @override
  Future<Either<Failure, Avatar>> getAvatar() async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.getAvatar();
        return Right(res);
      } catch (e) {
        return Left(ServerFailure(errMsg: "ServerF"));
      }
    } else {
      try {
        final res = await local.getAvatar();
        return Right(res);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFailure(errorMessage: "Empty Records"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: "Unknown err occourd"));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> saveNewWeight(Map<String, double> val) async {
    try {
      await local.saveNewWeight(val);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
    return const Right(unit);
  }
}
