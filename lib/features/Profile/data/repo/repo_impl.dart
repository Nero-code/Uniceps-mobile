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
        return Right(res);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: "something went wrong"));
      }
    }
    return Left(GeneralPurposFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, Player>> getProfileData() async {
    print("REMOTE_S --> ProfileBloc --> getProfileData");
    if (await checker.hasConnection) {
      try {
        final res = await remote.getProfileData();
        await local.savePlayerData(res);
        print("profile res: $res");
        return Right(res);
      } catch (e) {
        print(e.toString());
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    } else {
      try {
        final res = await local.getProfileData();
        return Right(res);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFailure(errorMessage: "No records"));
      } catch (e) {
        print(e.toString());
        return Left(GeneralPurposFailure(errorMessage: "unknown Error!"));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> changeLanguage() async {
    if (await checker.hasConnection) {
      try {
        return const Right(unit);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }
    return Left(GeneralPurposFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, List<Subscription>>> getSubscriptions(
      String gymId) async {
    if (await checker.hasConnection) {
      try {
        final res = await remote.getSubs(gymId);
        return Right(res);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: "Offline"));
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
        await remote.submitProfileData(playerModel, isCreate: isCreate);
        print("SubmitProfile --> Check 2:");
        await local.savePlayerData(playerModel);
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
    if (await checker.hasConnection) {
      try {
        final res = await remote.getAllAttendance(gymId);
        return Right(res);
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: "Offline"));
  }

  @override
  Future<Either<Failure, List<HandShake>>> getAllGymHandshake() async {
    if (await checker.hasConnection) {
      try {
        await remote.getAllHandshake();
      } catch (e) {
        print("getAllGymHandshake repoImpl: " + e.toString());
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }
}
