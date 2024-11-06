import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/app/domain/models/training_models/exercise_model.dart';
import 'package:uniceps/app/data/sources/local/training_local_data_source.dart';
import 'package:uniceps/app/data/sources/remote/training_remote_data_source.dart';
import 'package:uniceps/app/domain/classes/training_entities/exercise.dart';
import 'package:uniceps/app/domain/classes/training_entities/training_program.dart';
import 'package:uniceps/app/contracts/training_repository.dart';

class TrainingRepoImple implements TrainingRepo {
  final LocalTrainingSource local;
  final RemoteTrainingSource remote;
  final InternetConnectionChecker connection;
  final Logger logger;

  TrainingRepoImple({
    required this.local,
    required this.remote,
    required this.connection,
    required this.logger,
  });

  TrainingProgram? tp;

  @override
  Future<Either<Failure, TrainingProgram>> getTrainingProgram() async {
    logger.d("Training_Feature --> Repo --> getTrainingProgram");

    if (await connection.hasConnection) {
      try {
        final temp = await remote.getSubscribedToGyms();
        final myGems = await local.cacheSubsToGyms(temp);
        final currentGym = myGems.firstWhere(
          (element) => element.isCurrent,
          orElse: () {
            local.setSelectedGym(myGems.first.id);
            return myGems.first;
          },
        );
        final weights = await local.getWeights();
        final res = await remote.getTrainingProgram(
          gymId: currentGym.id,
          pid: currentGym.pid,
          weights: weights,
        );
        logger.t("TrainingProgram finished");

        await local.saveTrainingProgram(res);

        logger.t("TrainingProgram saved locally");
        tp = res;
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        return Right(res);
      } on NoGymSpecifiedException {
        logger.d("DEBUG: NoGymSpecified yoyo");

        return const Left(
            NoTrainingProgramFailure("No handshakes found for player"));
      } on NoTrainingProgramException {
        logger.d("DEBUG: NoTrainingProgram yoyo");
        // await local.deleteTrainingProgram(gymId);
        return const Left(
            NoTrainingProgramFailure("No handshakes found for player"));
      } on NotAMemberOfGymException {
        return const Left(NotAMemberOfGymFailure(errorMessage: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        logger.e("DEBUG: Server EXC");
        return Left(ServerFailure(errMsg: "Error happened serverside"));
      } catch (e) {
        logger.f("DEBUG: GeneralP EXC", error: e);
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
        logger.d("getTrainingProgram finished! ${res.runtimeType}");
        tp = res;
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        return Right(res);
      } on NotAMemberOfGymException {
        logger.i("Not a member of any gym");
        return const Left(NotAMemberOfGymFailure(errorMessage: ""));
      } on NoGymSpecifiedException {
        logger.i("No gym specified");
        return Left(NoGymSpecifiedFailure(errMsg: "No Gym Specified"));
      } on NoTrainingProgramException {
        logger.d("NoTrainingProgram");
        return const Left(
            NoTrainingProgramFailure("No handshakes found for player"));
      } on EmptyCacheExeption {
        logger.d("No TrainingProgram Found: EmptyCacheExeption");
        return Left(OfflineFailure(errorMessage: "no internet"));
      } catch (e) {
        logger.e("Training Repo Remote getTrainingProgram Unknown Error",
            error: e);
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(
      int filter) async {
    logger.d("Get Exercise ByFilter");
    if (tp == null) {
      return const Left(
          NoTrainingProgramFailure("repo imple -> getExercisesByFilter"));
    }
    logger.d("tp not null");
    logger.d("tp.list : ${tp!.exercises.length}");
    List<Exercise> list = [];
    for (var i in tp!.exercises) {
      if (i.muscleGroup == filter) {
        list.add(i);
      }
    }
    if (list.isEmpty) {
      logger.i("No Exercises found for filter: $filter");
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
  Future<Either<Failure, List<Gym>>> getSubscribedToGyms() async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.getSubscribedToGyms();
        logger.t("Debug: 3: Subscribed to gym (myGyms) => $res");
        final list = await local.cacheSubsToGyms(res);

        return Right(list);
      } on NoGymSpecifiedException {
        return Left(NoGymSpecifiedFailure(errMsg: ""));
      } on ClientException {
        logger.d("SubS: remote Client EXC");
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        logger.d("SubS: remote server EXC");
        return Left(ServerFailure(errMsg: ""));
      } on EmptyCacheExeption {
        logger.d("SubS: remote empty");
        return Left(NoGymSpecifiedFailure(errMsg: "errMsg"));
      } catch (e) {
        logger.f("SubS remote unknown:", error: e);
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final res = await local.getSubscribedToGyms();
        return Right(res);
      } on NotAMemberOfGymException {
        return const Left(
            NotAMemberOfGymFailure(errorMessage: "No Gyms Specified"));
      } catch (e) {
        logger.f("SubS local unknown:", error: e);
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Gym>>> setSelectedGym(String gymId) async {
    logger.d("repo: SetSelectedGym Function:");
    try {
      final res = await local.setSelectedGym(gymId);
      logger.d("local Responce: $res");
      return Right(res);
    } on ClientException {
      return Left(NoInternetConnectionFailure(errMsg: ""));
    } on ServerException {
      return Left(ServerFailure(errMsg: ""));
    } catch (e) {
      logger.d(e.toString());
      return Left(GeneralPurposFailure(errorMessage: "error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveNewWeight(Map<String, double> val) async {
    logger.d("inside NewWeight");
    try {
      await local.saveNewWeight(val);
      final e =
          tp!.exercises.firstWhere((element) => element.id == val.keys.first);
      tp!.exercises.remove(e);
      final isCompl = e.isCompleted;
      final image = e.imageBitMap;
      // final map = e.toJson();
      // map.addAll({"lastWeight": val.values.first});
      logger.d("Training -> RepoImle -> local saveNewWeight: DATA");
      logger.d("${{
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
      logger.d("Training -> RepoImle -> local saveNewWeight: ${e.toString()}");
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
    return const Right(unit);
  }
}
