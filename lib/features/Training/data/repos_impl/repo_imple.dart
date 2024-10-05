import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Training/data/models/exercise_model.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
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
  Future<Either<Failure, TrainingProgram>> getTrainingProgram(
      /**String gymId*/) async {
    print("Training_Feature --> Repo --> getTrainingProgram");

    if (await connection.hasConnection) {
      try {
        final temp = await remote.getSubscribedToGyms();
        final myGems = await local.cacheSubsToGyms(temp);
        final currentGym = myGems.firstWhere(
          (element) => element.isCurrent,
          orElse: () => myGems.first,
        );
        final weights = await local.getWeights();
        final res = await remote.getTrainingProgram(
          gymId: currentGym.id,
          pid: currentGym.pid,
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
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        print("Server EXC");
        return Left(ServerFailure(errMsg: "Error happened serverside"));
      } catch (e) {
        print("GeneralP EXC: ${e.toString()}");
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final myGems = await local.getSubscribedToGyms();
        final currentGym = myGems.firstWhere(
          (element) => element.isSelected,
          orElse: () => myGems.first,
        );
        final res = await local.getTrainingProgram(currentGym.id);
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
      // print("${i.muscleGroup} : $filter");
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
      final lasW = element.lastWaight;
      final image = element.imageBitMap;
      tp!.exercises.removeAt(index);
      final ex = ExerciseModel.fromJson({
        ...element.toJson(),
        'lastWaight': lasW,
        'image': image,
        "isCompleted": !element.isCompleted,
      });
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
  Future<Either<Failure, List<Gym>>> getSubscribedToGyms() async {
    print("Debug: 1");

    if (await connection.hasConnection) {
      try {
        print("Debug: 2");
        final res = await remote.getSubscribedToGyms();
        final list = await local.cacheSubsToGyms(res);

        return Right(list);
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        return Left(ServerFailure(errMsg: ""));
      } on EmptyCacheExeption {
        return Left(NoGymSpecifiedFailure(errMsg: "errMsg"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final res = await local.getSubscribedToGyms();
        return Right(res);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFailure(errorMessage: "No Gyms Specified"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Gym>>> setSelectedGym(String gymId) async {
    print("repo: SetSelectedGym Function:");
    try {
      final res = await local.setSelectedGym(gymId);
      print("local Responce: $res");
      return Right(res);
    } on ClientException {
      return Left(NoInternetConnectionFailure(errMsg: ""));
    } on ServerException {
      return Left(ServerFailure(errMsg: ""));
    } catch (e) {
      print(e.toString());
      return Left(GeneralPurposFailure(errorMessage: "error: ${e.toString()}"));
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
      final isCompl = e.isCompleted;
      final image = e.imageBitMap;
      // final map = e.toJson();
      // map.addAll({"lastWeight": val.values.first});
      print("Training -> RepoImle -> local saveNewWeight: DATA");
      print("${{
        ...e.toJson(),
        "lastWaight": val.values.first,
      }}");
      tp!.exercises.add(ExerciseModel.fromJson({
        ...e.toJson(),
        'image': image,
        "lastWaight": val.values.first,
        "isCompleted": isCompl,
      }));
    } on ClientException {
      return Left(NoInternetConnectionFailure(errMsg: ""));
    } on ServerException {
      return Left(ServerFailure(errMsg: ""));
    } catch (e) {
      print("Training -> RepoImle -> local saveNewWeight: ${e.toString()}");
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
    return const Right(unit);
  }
}
