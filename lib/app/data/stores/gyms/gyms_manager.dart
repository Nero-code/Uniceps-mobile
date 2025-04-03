import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/sources/local/dal_gym_local_source/gyms_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_gym_local_source/my_gyms_local_source.dart';
import 'package:uniceps/app/domain/contracts/gyms/i_gyms_service.dart';
import 'package:uniceps/app/data/sources/remote/gym_remote_source/gyms_remote_source.dart';
import 'package:uniceps/app/data/sources/remote/gym_remote_source/my_gyms_remote_source.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/app/data/models/profile_models/gym_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';

class GymsManager implements IGymsService {
  const GymsManager({
    required this.gymsLocal,
    required this.gymsRemote,
    required this.myGymsLocal,
    required this.myGymsRemote,
    required this.logger,
    required this.connection,
  });
  final Logger logger;
  final IGymsLocalSource gymsLocal;
  final IGymsRemoteSource gymsRemote;
  final IMyGymsLocalSource myGymsLocal;
  final IMyGymsRemoteSource myGymsRemote;
  final InternetConnectionChecker connection;

  final title = 'GymsManager';

  @override
  Future<Either<Failure, List<Gym>>> getAllGyms() async {
    logger.t("$title getAllGyms");
    if (await connection.hasConnection) {
      try {
        final res = await gymsRemote.getGyms();
        await gymsLocal.saveGyms(res);
        return Right(res);
      } catch (e) {
        return Left(NotFoundFailure(errMsg: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ''));
  }

  @override
  Future<Either<Failure, List<Gym>>> getMyGyms() async {
    if (await connection.hasConnection) {
      try {
        final res = await myGymsRemote.getSubscribedToGyms();
        await myGymsLocal.cacheSubsToGyms(res);
        return Right(res);
      } catch (e) {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      }
    } else {
      try {
        final res = await myGymsLocal.getSubscribedToGyms();
        return Right(res);
      } catch (e) {
        return const Left(EmptyCacheFailure(errorMessage: ""));
      }
    }
  }

  @override
  Future<Either<Failure, List<Gym>>> getRestGyms() async {
    logger.t("$title getAllGyms");
    if (await connection.hasConnection) {
      try {
        logger.t("$title gymsRemote.getGyms");
        final res = await gymsRemote.getGyms();

        logger.t("$title remote getting subscribed to gyms");
        final localRes = await myGymsLocal.getSubscribedToGyms();

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

        await gymsLocal.saveGyms(res);

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
        logger.f("$title remote getGyms", error: e);

        return Left(DatabaseFailure(errorMsg: "Error on fetching data"));
      }
    } else {
      logger.t("$title local getGyms");

      try {
        final res = await gymsLocal.getGyms();
        final localRes = await myGymsLocal.getSubscribedToGyms();
        final list = <GymModel>[];
        for (var i in localRes) {
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

  @override
  Future<Either<Failure, List<Gym>>> selectGym(String gymId) async {
    logger.d("$title: SetSelectedGym()");
    try {
      final res = await myGymsLocal.setSelectedGym(gymId);
      logger.d("local Response: $res");
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
}
