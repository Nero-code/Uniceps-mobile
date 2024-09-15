import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Training/data/models/exercise_model.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/entities/avatar.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
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

  TrainingProgram? tp;

  @override
  Future<Either<Failure, TrainingProgram>> getTrainingProgram() async {
    // print("Check: Inside training repo");
    // return Left(ServerFailure(errMsg: "something went wrong!"));
    // return Left(NoInternetConnectionFailure(errMsg: "No Internet connection!"));
    // return Left(NoGymSpecifiedFailure(errMsg: "Not a participent in a gym"));

    // bool? isSignedToAGym;

    print("Training_F --> Repo --> getTrainingProgram");

    if (await connection.hasConnection) {
      try {
        final allHandshakes = await remote.getAllHandshakes();
        final handshake = allHandshakes.first;
        await local.saveHandshakes(allHandshakes);
        print("gymId: ${handshake.gymId}\n" "playerId: ${handshake.playerId}");
        final weights = await local.getWeights();
        final res = await remote.getTrainingProgram(
          gymId: handshake.gymId,
          pid: handshake.playerId,
          weights: weights,
        );
        print("TrainingProgram finished");

        await local.saveTrainingProgram(res);
        tp = res;

        return Right(res);
      } on NoGymSpecifiedException {
        print("NoGymSpecified EXC");
        return Left(
            NoGymSpecifiedFailure(errMsg: "No handshakes found for player"));
      } on ServerException {
        print("Server EXC");
        return Left(ServerFailure(errMsg: "Error happened serverside"));
      } catch (e) {
        print("GeneralP EXC: ${e.toString()}");
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final res = await local.getTrainingProgram();
        print("getTrainingProgram finished! ${res.runtimeType}");
        tp = res;

        return Right(res);
      } on EmptyCacheExeption {
        print("No TrainingProgram Found: EmptyCacheExeption");
        return Left(OfflineFailure(errorMessage: "no internet"));
      } catch (e) {
        print("Error: $e");
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(
      int filter) async {
    print("Get Exercise ByFilter");
    if (tp == null) {
      return const Left(
          NoTrainingProgramFailure("repo imple -> getExercisesByFilter"));
    }
    print("tp not null");
    print("tp.list : ${tp!.exercises.length}");
    List<Exercise> list = [];
    for (var i in tp!.exercises) {
      print("${i.muscleGroup} : $filter");
      if (i.muscleGroup == filter) {
        list.add(i);
      }
    }
    if (list.isEmpty) {
      return Left(EmptyCacheFailure(
          errorMessage: "No Exercises found for filter: $filter"));
    }
    list.sort((a, b) => a.itemOrder.compareTo(b.itemOrder));
    return Right(list);
  }

  @override
  Future<Either<Failure, bool>> completeExercise(String eId) async {
    if (tp == null) {
      return const Left(
          NoTrainingProgramFailure("repo imple ->  completeExercise"));
    }
    int? index;

    for (var i in tp!.exercises) {
      if (i.id == eId) {
        index = tp!.exercises.indexOf(i);
        break;
      }
    }
    if (index != null) {
      final element = tp!.exercises[index];
      tp!.exercises.removeAt(index);
      final ex = ExerciseModel.fromJson(
          {...element.toJson(), "isCompleted": !element.isCompleted});
      tp!.exercises.insert(index, ex);
      return const Right(true);
    }
    return const Right(false);
  }

  @override
  Future<Either<Failure, HandShake>> getCurrentHandshake() async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.getAllHandshakes();
        await local.saveHandshakes(res);
        return Right(res.first);
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
  Future<Either<Failure, List<Presence>>> getPresenceAtGym(gymId) async {
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
    print("inside NewWeight");
    try {
      await local.saveNewWeight(val);
      final e =
          tp!.exercises.firstWhere((element) => element.id == val.keys.first);
      tp!.exercises.remove(e);
      // final map = e.toJson();
      // map.addAll({"lastWeight": val.values.first});
      print("Training -> RepoImle -> local saveNewWeight: DATA");
      print("${{...e.toJson(), "lastWaight": val.values.first}}");
      tp!.exercises.add(ExerciseModel.fromJson(
          {...e.toJson(), "lastWaight": val.values.first}));
    } catch (e) {
      print("Training -> RepoImle -> local saveNewWeight: ${e.toString()}");
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
    return const Right(unit);
  }
}
