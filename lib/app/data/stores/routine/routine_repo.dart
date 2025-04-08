import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/routine_remote_source.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/routine_management_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineRepoImpl implements RoutineRepo {
  final RoutineLocalSource _localSource;
  final RoutineRemoteSource _remoteSource;
  final InternetConnectionChecker _internet;

  const RoutineRepoImpl(
      {required RoutineLocalSource localSource,
      required RoutineRemoteSource remoteSource,
      required InternetConnectionChecker internet,
      required ClientHelper clientHelper})
      : _localSource = localSource,
        _remoteSource = remoteSource,
        _internet = internet;

  @override
  Future<Either<Failure, List<Routine>>> getAllRoutines() async {
    // if (await _internet.hasConnection) {
    //   try {
    //     final res = await _remoteSource.getAllRoutines();
    //     await _localSource.saveRoutines(res);
    //     return Right(res);
    //   } catch (e) {}
    // } else {
    //   try {
    //     return Right(await _localSource.getAllRoutines());
    //   } catch (e) {
    //     return const Left(EmptyCacheFailure(errorMessage: ""));
    //   }
    // }
    try {
      return Right(await _localSource.getAllRoutines());
    } catch (e) {
      return const Left(EmptyCacheFailure(errorMessage: ""));
    }
  }

  @override
  Future<Either<Failure, Routine>> createRoutine(Routine routine) async {
    // if (await _internet.hasConnection) {
    //   try {
    //     return Right(await _localSource.createRoutine(routine.asDto()));
    //   } catch (e) {
    //     return Left(DatabaseFailure(errorMsg: e.toString()));
    //   }
    // } else {
    //   try {} catch (e) {}
    // }

    try {
      return Right(await _localSource.createRoutine(routine.asDto()));
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Routine>> updateRoutine(Routine routine) async {
    // if (await _internet.hasConnection) {
    //   try {} catch (e) {}
    // } else {
    //   try {} catch (e) {}
    // }

    try {
      return Right(await _localSource.updateRoutine(routine.asDto()));
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteRoutine(Routine routine) async {
    // if (await _internet.hasConnection) {
    //   try {} catch (e) {}
    // } else {
    //   try {} catch (e) {}
    // }

    try {
      await _localSource.deleteRoutine(routine.asDto());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, Unit>> shareRoutine(
      Routine routine, int userId) async {
    // if (await _internet.hasConnection) {
    //   try {} catch (e) {}
    // } else {
    //   try {} catch (e) {}
    // }

    try {
      await _localSource.shareRoutine(routine.asDto());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }
}
