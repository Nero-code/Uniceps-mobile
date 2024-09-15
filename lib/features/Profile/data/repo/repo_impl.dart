import 'package:dartz/dartz.dart';
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
      try {
        final res = await remote.getMeasurements();
        await local.saveMeasurements(res);
        return Right(res);
      } catch (e) {
        print(e.toString());
        return Left(GeneralPurposFailure(errorMessage: "something went wrong"));
      }
    }
    return Left(GeneralPurposFailure(errorMessage: ""));
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
        return Left(EmptyCacheFailure(errorMessage: "No records"));
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

  // @override
  // Future<Either<Failure, Unit>> changeLanguage() async {
  //   if (await checker.hasConnection) {
  //     try {
  //       return const Right(unit);
  //     } catch (e) {
  //       return Left(GeneralPurposFailure(errorMessage: ""));
  //     }
  //   }
  //   return Left(GeneralPurposFailure(errorMessage: ""));
  // }

  @override
  Future<Either<Failure, List<Subscription>>> getSubscriptions(
      String gymId) async {
    if (await checker.hasConnection) {
      try {
        final res = await remote.getSubs(gymId);
        await local.saveSubs(gymId, res);
        return Right(res);
      } on ServerException {
        print("Server Execption");
        return Left(
            ServerFailure(errMsg: "ServerF! |> Profile -> repo -> getSubs"));
      } on EmptyCacheExeption {
        print("Empty Execption");
        return Left(EmptyCacheFailure(
            errorMessage: "EmptyCacheF! |> Profile -> repo -> getSubs"));
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
        return Left(EmptyCacheFailure(
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
        await local.saveGyms(res);
        // final hands = await remote.getAllHandshake();
        // print("before Sort");
        // print(hands);
        // print("afterSort");
        // hands.sort(
        //   (a, b) => a.createdAt.compareTo(b.createdAt),
        // );
        // final temp =
        //     res.firstWhere((element) => element.id == hands.first.gymId);
        // res.remove(temp);
        // res.insert(0, temp);
        return Right(res);
      } catch (e) {
        return Left(DatabaseFailure(errorMsg: "Error on fetching data"));
      }
    } else {
      try {
        final res = await local.getGyms();
        return Right(res);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFailure(errorMessage: "Empty Cache"));
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
  Future<Either<Failure, List<Attendence>>> gymAttendence(String gymId) async {
    print("Attenence --> RepoImpl --> gymAttendence $gymId");
    if (await checker.hasConnection) {
      try {
        final res = await remote.getAllAttendance(gymId);
        await local.saveAttenenceAtGym(gymId, res);
        return Right(res);
      } on NoAttendenceLogFoundException {
        return const Left(NoAttendenceFoundFailure("not a member in the gym"));
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
}
