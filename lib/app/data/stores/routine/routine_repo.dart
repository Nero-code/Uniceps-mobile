import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_local_source.dart';
import 'package:uniceps/app/data/sources/remote/client_helper.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/routine_remote_source.dart';
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
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getAllRoutines();
        await _localSource.saveRoutines(res);
        return Right(res);
      } catch (e) {}
    } else {
      try {} catch (e) {}
    }
    throw Exception();
  }

  @override
  Future<Either<Failure, Routine>> createRoutine(Routine routine) async {
    if (await _internet.hasConnection) {
      try {} catch (e) {}
    } else {
      try {} catch (e) {}
    }
    throw Exception();
  }

  @override
  Future<Either<Failure, Routine>> updateRoutine(Routine routine) async {
    if (await _internet.hasConnection) {
      try {} catch (e) {}
    } else {
      try {} catch (e) {}
    }
    throw Exception();
  }

  @override
  Future<Either<Failure, Unit>> deleteRoutine(Routine routine) async {
    if (await _internet.hasConnection) {
      try {} catch (e) {}
    } else {
      try {} catch (e) {}
    }
    throw Exception();
  }

  @override
  Future<Either<Failure, Unit>> shareRoutine(
      Routine routine, int userId) async {
    if (await _internet.hasConnection) {
      try {} catch (e) {}
    } else {
      try {} catch (e) {}
    }
    throw Exception();
  }
}
