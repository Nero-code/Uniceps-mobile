import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/data/sources/local_source.dart';
import 'package:uniceps/features/Profile/data/sources/remote_source.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/domain/entities/player_in_gym.dart';
import 'package:uniceps/features/Profile/domain/repo.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

class ProfileRepoImpl implements ProfileRepo {
  final LocalProfileSource local;
  final RemoteProfileSource remote;
  final InternetConnectionChecker checker;

  ProfileRepoImpl({
    required this.local,
    required this.remote,
    required this.checker,
  });

  @override
  Future<Either<Failure, List<Measurement>>> getMeasurement() async {
    if (await checker.hasConnection) {
      print("Connected");
      try {
        final res = await remote.getMeasurements();
        await local.saveMeasurements(res);
        return Right(res);
      } on EmptyCacheExeption {
        return const Left(EmptyMeasureFailure(errorMessage: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        print(e.toString());
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
        print(e.toString());
        return Left(
            GeneralPurposFailure(errorMessage: "UNknown Err: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, Player>> getProfileData() async {
    print("ProfileBloc --> Repo --> getProfileData");
    if (await checker.hasConnection) {
      try {
        print("REMOTE_S --> ");
        final res = await remote.getProfileData();
        await local.savePlayerData(res);
        print("profile res: $res");
        return Right(res);
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        print(e.toString());
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    } else {
      print("LOCAL_S -->");
      try {
        final res = await local.getProfileData();
        print("after getProfileData: ${res.toJson()}");
        return Right(res);
      } on EmptyCacheExeption {
        print("No RECORD");
        return const Left(EmptyCacheFailure(errorMessage: "No records"));
      } catch (e) {
        print("Error: $e");
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
    if (await checker.hasConnection) {
      try {
        final res = await remote.getSubs(gymId, pid);
        await local.saveSubs(gymId, res);
        return Right(res);
      } on ServerException {
        print("Server Execption");
        return Left(
            ServerFailure(errMsg: "ServerF! |> Profile -> repo -> getSubs"));
      } on EmptyCacheExeption {
        print("Empty Execption");
        return Left(EmptySubsFailure(
            errorMessage: "EmptyCacheF! |> Profile -> repo -> getSubs"));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } catch (e) {
        print("General Execption"
            "\n"
            "Error: ${e.runtimeType} > ${e.toString()}");
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
        print("LOCAL_S --> getSubs --> EmptyCacheExeption");
        return Left(EmptySubsFailure(
            errorMessage: "no Subscriptions found for gym: $gymId"));
      } catch (e) {
        print("LOCAL_S --> getSubs --> Error: $e");
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
    if (await checker.hasConnection) {
      try {
        final res = await remote.getGyms();
        final localRes = await local.getSubscribedToGyms();
        final list = <GymModel>[];
        for (var i in localRes) {
          print("DEBUG: GETGYMS: ${i.toJson()}");
          var map = i.toJson();
          map.addAll({"isSelected": true});
          final temp = GymModel.fromJson(
              i.toJson()..update("isSelected", (value) => true));

          list.add(temp);
        }
        await local.saveGyms(res);
        // for (int i = 0; i < res.length; i++) {
        //   if (res[i].id == localRes[i].id) {
        //     list.add(res[i]);
        //   }
        // }
        print("before remove: ${res.length}");
        for (var gym in list) {
          res.forEach((e) {
            if (e.id == gym.id) {
              res.remove(e);
              res.insert(0, gym);
            }
          });
        }

        return Right(res);
      } on ServerException {
        return Left(ServerFailure(errMsg: ""));
      } on EmptyCacheExeption {
        return const Left(EmptyGymsListFailure(errorMessage: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } catch (e) {
        return Left(DatabaseFailure(errorMsg: "Error on fetching data"));
      }
    } else {
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
        print("before remove: ${res.length}");
        for (var gym in list) {
          res.forEach((e) {
            if (e.id == gym.id) {
              res.remove(e);
              res.insert(0, gym);
            }
          });
        }
        print("after remove: ${res.length}");

        return Right(res);
      } on EmptyCacheExeption {
        return const Left(EmptyCacheFailure(errorMessage: "Empty Cache"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: "Unknown Error"));
      }
    }
  }

  @override
  Future<void> saveGyms(List<GymModel> list) async {
    await local.saveGyms(list);
  }

  @override
  Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
      {required bool isCreate}) async {
    print("REPO: Submit profile");
    if (await checker.hasConnection) {
      try {
        print("SubmitProfile --> Check 1:");
        final uid =
            await remote.submitProfileData(playerModel, isCreate: isCreate);
        final pm = PlayerModel.fromJson({...playerModel.toJson(), "uid": uid});
        print("SubmitProfile --> Check 2:");
        await local.savePlayerData(pm);
        print("SubmitProfile --> Check 3:");
        return Right(playerModel);
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        print("Submit Profile --> ServerEXception");
        return Left(ServerFailure(errMsg: "Server Error"));
      } catch (e) {
        print("Submit Profile --> GeneralEXception: ${e.toString()}");
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
    return Left(NoInternetConnectionFailure(errMsg: "Offline"));
  }

  @override
  Future<Either<Failure, List<Attendence>>> gymAttendence(
      String gymId, String pid) async {
    print("Attenence --> RepoImpl --> gymAttendence $gymId");
    if (await checker.hasConnection) {
      try {
        final res = await remote.getAllAttendance(gymId, pid);
        res.sort(
          (a, b) => a.date.compareTo(b.date),
        );
        await local.saveAttenenceAtGym(gymId, res);
        return Right(res);
      } on NoAttendenceLogFoundException {
        return const Left(NoAttendenceFoundFailure("not a member in the gym"));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        return Left(ServerFailure(errMsg: "Error on ServerSide"));
      } catch (e) {
        print(e.toString());
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final res = await local.getAttendenceAtGym(gymId);
        return Right(res);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFailure(errorMessage: "No Records Found"));
      } catch (e) {
        print(e.toString());
        return Left(GeneralPurposFailure(
            errorMessage:
                "GeneralP |> Profile -> repoImpl -> local getAttendence"
                "\n$e"));
      }
    }
  }

  @override
  Future<Either<Failure, List<HandShake>>> getAllGymHandshake() async {
    if (await checker.hasConnection) {
      try {
        final list = await remote.getAllHandshake();

        await local.saveHandshakes(list);
        return Right(list);
      } on NoGymSpecifiedException {
        return Left(NoGymSpecifiedFailure(errMsg: "NO Handshakes Found"));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        print(
            "GeneralPurposFailure! |>>> Profile -> repoImpl -> getAllGymHandshake: ${e.toString()}");
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    } else {
      try {
        final list = await local.getAllHandshakes();
        return Right(list);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFailure(
            errorMessage: "No Handshakes found in local box"));
      } catch (e) {
        return Left(GeneralPurposFailure(
            errorMessage:
                "Unknown err! |>>> Profile -> localS -> getAllHandshakes: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, PlayerInGym>> getPlayerInGym(String gymId) async {
    String? pid;
    try {
      final list = await local.getSubscribedToGyms();
      pid = list.firstWhere((gym) => gym.id == gymId).pid;
    } on EmptyCacheExeption {
      return Left(NoGymSpecifiedFailure(errMsg: "errMsg"));
    } catch (e) {
      print("Gym Not Found, Therefor not a member");
      return Right(PlayerInGym(gymId: gymId, balance: 0.0, subs: 0));
    }

    if (await checker.hasConnection) {
      try {
        final player = await remote.getPlayerInGym(gymId, pid);
        // final subs = await remote.getSubs(gymId, pid);
        final res = PlayerInGym(gymId: gymId, balance: player.balance, subs: 0);
        await local.savePlayerInGym(res);
        return Right(res);
      } on NotFoundException {
        return Left(NotFoundFailure(errMsg: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } catch (e) {
        return Right(PlayerInGym(gymId: gymId, balance: 0.0, subs: 0));
      }
    } else {
      try {
        final res = await local.getPlayerInGym(gymId);

        return Right(res);
      } catch (e) {
        print(e);
        return Right(PlayerInGym(gymId: gymId, balance: 0.0, subs: 0));
      }
    }
  }
}
