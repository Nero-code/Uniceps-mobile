import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/data/sources/local/profile_local_source.dart';
import 'package:uniceps/app/data/sources/remote/profile_remote_source.dart';
import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';
import 'package:uniceps/app/domain/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/subscription.dart';
import 'package:uniceps/app/data/models/profile_models/gym_model.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';

class ProfileRepoImpl implements ProfileRepo {
  final LocalProfileSource local;
  final RemoteProfileSource remote;
  final InternetConnectionChecker checker;
  final Logger logger;

  ProfileRepoImpl({
    required this.local,
    required this.remote,
    required this.checker,
    required this.logger,
  });

  @override
  Future<Either<Failure, List<Measurement>>> getMeasurement() async {
    if (await checker.hasConnection) {
      // logger.d("Connected");
      try {
        final res = await remote.getMeasurements();
        await local.saveMeasurements(res);
        return Right(res);
      } on EmptyCacheExeption {
        return const Left(EmptyMeasureFailure(errorMessage: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        logger.e(
          "server exception",
          error: StackTrace.current,
        );
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        logger.f("profile repo --> remote get measurements unknown error",
            error: e);
        return Left(GeneralPurposFailure(errorMessage: "something went wrong"));
      }
    } else {
      try {
        final res = await local.getMeasurements();
        return Right(res);
      } on EmptyCacheExeption {
        return const Left(
            EmptyCacheFailure(errorMessage: "No Measurments saved"));
      } catch (e) {
        logger.f("Profile repo local get measurements", error: e);
        return Left(
            GeneralPurposFailure(errorMessage: "UNknown Err: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, Player>> getProfileData() async {
    logger.d("ProfileBloc --> Repo --> getProfileData");
    logger.d(await checker.hasConnection);

    if (await checker.hasConnection) {
      try {
        logger.d("REMOTE_S --> ");
        final res = await remote.getProfileData();
        await local.savePlayerData(res);
        logger.d("profile res: $res");
        return Right(res);
      } on ClientException {
        logger.i("Internet Exception");
        try {
          final res = await local.getProfileData();
          logger.i("found in local");
          return Right(res);
        } catch (e) {
          logger.i("nothing found");
          return Left(NoInternetConnectionFailure(errMsg: ""));
        }
      } on ServerException {
        logger.e("profile repo remote server exception");
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        logger.f("profile repo remote unknown exception", error: e.toString());
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    } else {
      // return Left(NoInternetConnectionFailure(errMsg: ""));

      try {
        logger.d("before: local getProfileData");
        final res = await local.getProfileData();
        logger.d("after getProfileData: ${res.toJson()}");
        return Right(res);
      } on EmptyCacheExeption {
        logger.d("No RECORD");
        return const Left(EmptyCacheFailure(errorMessage: "No records"));
      } catch (e) {
        logger.d("Error: $e");
        return Left(
          GeneralPurposFailure(
              errorMessage: "unknown Error!"
                  "\n"
                  "Error: ${e.runtimeType} > ${e.toString()}"),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<Subscription>>> getSubscriptions(
      String gymId, String pid) async {
    logger.t("profile repo START getSubscrptions");
    if (await checker.hasConnection) {
      try {
        final res = await remote.getSubs(gymId, pid);
        await local.saveSubs(gymId, res);
        for (var element in res) {
          logger.d("DEBUG SUBS: ${element.toJson()}");
        }

        res.sort((a, b) => b.startDate.compareTo(a.startDate));
        final l = res.length;
        for (int i = 0; i < l - 1; i++) {
          if (res[i].endDate.compareTo(DateTime.now()) < 0) {
            logger.t("DATE SORT ALGORITHM");
            logger.t(res[i].endDate);
            final temp = res[i];
            res.remove(temp);
            res.add(temp);
          }
        }
        logger.t("profile repo ");
        return Right(res);
      } on ServerException {
        logger.e("Server Execption");
        return Left(
            ServerFailure(errMsg: "ServerF! |> Profile -> repo -> getSubs"));
      } on EmptyCacheExeption {
        logger.d("Empty Execption");
        return const Left(EmptySubsFailure(
            errorMessage: "EmptyCacheF! |> Profile -> repo -> getSubs"));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } catch (e) {
        logger.f(
            "General Execption"
            "\n",
            error: e);
        return Left(
          GeneralPurposFailure(
              errorMessage:
                  "Unknown Err! |> Profile -> RepoImple -> localGetSubs, gymId = $gymId"
                  "\n"
                  "Error: ${e.runtimeType} > ${e.toString()}"),
        );
      }
    } else {
      try {
        final res = await local.getSubs(gymId);
        return Right(res);
      } on EmptyCacheExeption {
        logger.d("LOCAL_S --> getSubs --> EmptyCacheExeption");
        return Left(EmptySubsFailure(
            errorMessage: "no Subscriptions found for gym: $gymId"));
      } catch (e) {
        logger.d("LOCAL_S --> getSubs --> Error: $e");
        return Left(
          GeneralPurposFailure(
              errorMessage:
                  "Unknown Err! |> Profile -> RepoImple -> localGetSubs, gymId = $gymId"
                  "\n"
                  "Error: ${e.runtimeType} > ${e.toString()}"),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<Gym>>> getGyms() async {
    logger.t("profile repo getGyms");
    if (await checker.hasConnection) {
      try {
        logger.t("profile repo remote getting gyms");
        final res = await remote.getGyms();

        logger.t("profile repo remote getting subscribed to gyms");
        final localRes = await local.getSubscribedToGyms();

        if (localRes.isEmpty) {
          logger.t("profile repo remote my gyms list is empty");
          return Right(res);
        }
        final list = <GymModel>[];
        logger.t("profile repo remote GETGYMS: $localRes");
        for (var i in localRes) {
          var map = i.toJson();
          map.addAll({"isSelected": true});
          final temp = GymModel.fromJson(
              i.toJson()..update("isSelected", (value) => true));

          list.add(temp);
        }

        logger.t("profile repo saving gyms");

        await local.saveGyms(res);

        // for (int i = 0; i < res.length; i++) {
        //   if (res[i].id == localRes[i].id) {
        //     list.add(res[i]);
        //   }
        // }

        logger.t(
            "profile repo remote get gyms sorting by isMyGym: ${res.length}");

        for (var gym in list) {
          for (var e in res) {
            if (e.id == gym.id) {
              res.remove(e);
              res.insert(0, gym);
            }
          }
        }

        return Right(res);
      } on ServerException {
        logger.e("serverException");

        return Left(ServerFailure(errMsg: ""));
      } on EmptyCacheExeption {
        logger.d("EmptyCache");

        return const Left(EmptyGymsListFailure(errorMessage: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } catch (e) {
        logger.f("profile repo remote getGyms", error: e);

        return Left(DatabaseFailure(errorMsg: "Error on fetching data"));
      }
    } else {
      logger.t("profile repo local getGyms");

      try {
        final res = await local.getGyms();
        final localRes = await local.getSubscribedToGyms();
        final list = <GymModel>[];
        for (var i in localRes) {
          // var map = i.toJson();
          // map.addAll({"isSelected": true});
          final temp = GymModel.fromJson(
              i.toJson()..update("isSelected", (value) => true));

          list.add(temp);
        }

        logger.t("before remove: ${res.length}");

        for (var gym in list) {
          for (var e in res) {
            if (e.id == gym.id) {
              res.remove(e);
              res.insert(0, gym);
            }
          }
        }

        logger.t("after remove: ${res.length}");

        return Right(res);
      } on EmptyCacheExeption {
        return const Left(EmptyCacheFailure(errorMessage: "Empty Cache"));
      } catch (e) {
        logger.f("profile repo local unknown", error: e);
        return Left(GeneralPurposFailure(errorMessage: "Unknown Error"));
      }
    }
  }

  // @override
  // Future<void> saveGyms(List<GymModel> list) async {
  //   logger.t("profile repo saveGyms $list");
  //   await local.saveGyms(list);
  // }

  @override
  Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
      {required bool isCreate}) async {
    logger.t("REPO: Submit profile");
    if (await checker.hasConnection) {
      try {
        logger.t("SubmitProfile --> submitting profile data:");

        final uid =
            await remote.submitProfileData(playerModel, isCreate: isCreate);

        logger.t("SubmitProfile --> parsing PlayerModel");

        final pm = PlayerModel.fromJson({...playerModel.toJson(), "uid": uid});

        logger.t("SubmitProfile --> saving player data");

        await local.savePlayerData(pm);

        logger.t("SubmitProfile --> DONE");

        return Right(playerModel);
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        logger.e("Submit Profile --> ServerEXception");
        return Left(ServerFailure(errMsg: "Server Error"));
      } on MethodNotAllowedException {
        logger.t("Guest Mode tried to edit profile");
        return const Left(MethodNotAllowedFailure("Not Allowed"));
      } catch (e) {
        logger.f("Submit Profile --> GeneralEXception", error: e);
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
    return Left(NoInternetConnectionFailure(errMsg: "Offline"));
  }

  @override
  Future<Either<Failure, List<Attendence>>> gymAttendence(
      String gymId, String pid) async {
    logger.t("Attenence --> RepoImpl --> gymAttendence START");
    if (await checker.hasConnection) {
      try {
        logger.t("Attenence --> RepoImpl --> Remote gymAttendence $gymId");

        final res = await remote.getAllAttendance(gymId, pid);

        logger.t("sorting records");

        res.sort(
          (a, b) => a.date.compareTo(b.date),
        );

        logger.t("saving new data");

        await local.saveAttendenceAtGym(gymId, res);

        logger.t("Attenence --> RepoImpl --> Remote gymAttendence DONE");

        return Right(res);
      } on NoAttendenceLogFoundException {
        logger.t("No Attendence log found for gym $gymId");
        return const Left(NoAttendenceFoundFailure("not a member in the gym"));
      } on NotAMemberOfGymException {
        logger.t("Not a member in gym $gymId");
        return const Left(
            NotAMemberOfGymFailure(errorMessage: "not a member in the gym"));
      } on ClientException {
        logger.t("No Internet Connection");
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        logger.e("Server Exception");
        return Left(ServerFailure(errMsg: "Error on ServerSide"));
      } catch (e) {
        logger.f("Attenence --> RepoImpl --> gymAttendence START", error: e);
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        logger.t("getting attendence locally");
        final res = await local.getAttendenceAtGym(gymId);
        return Right(res);
      } on EmptyCacheExeption {
        return const Left(EmptyCacheFailure(errorMessage: "No Records Found"));
      } catch (e) {
        logger.f("profile repo local Unknown exception", error: e);
        return Left(GeneralPurposFailure(
            errorMessage:
                "GeneralP |> Profile -> repoImpl -> local getAttendence"
                "\n$e"));
      }
    }
  }

  @override
  Future<Either<Failure, PlayerInGym>> getPlayerInGym(
      String gymId, String pid) async {
    // String? pid;
    // try {
    //   final list = await local.getSubscribedToGyms();
    //   pid = list.firstWhere((gym) => gym.id == gymId).pid;
    // } on EmptyCacheExeption {
    //   return Left(NoGymSpecifiedFailure(errMsg: "errMsg"));
    // } catch (e) {
    //   logger.d("Gym Not Found, Therefor not a member");
    //   return Right(PlayerInGym(gymId: gymId, balance: 0.0, subs: 0));
    // }

    logger.d("------------------GET-PLAYER-IN-GYM--------------------");
    logger.d("PLAYER IN GYM: $pid");
    if (pid.isEmpty) {
      return const Left(NotAMemberOfGymFailure(errorMessage: ""));
    }

    if (await checker.hasConnection) {
      logger.d("PLAYER IN GYM: Connected!");
      try {
        final player = await remote.getPlayerInGym(gymId, pid);
        logger.d("PLAYER IN GYM: ${player.balance}");
        // final subs = await remote.getSubs(gymId, pid);
        final res = PlayerInGym(
            gymId: gymId, balance: player.balance, startDate: player.startDate);
        logger.d("PLAYER IN GYM: ${res.balance}");
        await local.savePlayerInGym(res);
        return Right(res);
      } on NotAMemberOfGymException {
        return const Left(NotAMemberOfGymFailure(errorMessage: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        logger.d("Exc = ${e.toString()}");
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final res = await local.getPlayerInGym(gymId);

        logger.d("PLAYER ${res.balance}");
        return Right(res);
      } on EmptyCacheExeption {
        logger.d("PLAYER EMPTY");
        return Left(NotFoundFailure(errMsg: ""));
      } catch (e) {
        logger.d("PLAYER $e");
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }
  }
}
