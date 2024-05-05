import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/data/sources.dart';
import 'package:uniceps/features/Profile/domain/measrument.dart';
import 'package:uniceps/features/Profile/domain/repo.dart';
import 'package:uniceps/features/Profile/domain/subscription.dart';

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
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }
    return Left(GeneralPurposFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, Player>> getProfileData() async {
    if (await checker.hasConnection) {
      try {
        final res = await remote.getProfileData();
        return Right(res);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    } else {
      try {
        final res = await local.getProfileData();
        return Right(res);
      } on EmptyCacheExeption {
        return Left(EmptyCacheFailure(errorMessage: "No records"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: "unknown Error!"));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> changeLanguage() async {
    if (await checker.hasConnection) {
      try {
        return Right(unit);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }
    return Left(GeneralPurposFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, List<Subscription>>> getSubscriptions() async {
    if (await checker.hasConnection) {
      try {
        final res = await remote.getSubs();
        return Right(res);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: "Offline"));
  }
}
