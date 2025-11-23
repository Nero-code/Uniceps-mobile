import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/services/internet_client/client_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_management_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineManagementRepo implements IRoutineManagementContract {
  final IRoutineManagementLocalSourceContract _localSource;
  // final RoutineRemoteSource _remoteSource;
  // final InternetConnectionChecker _internet;

  final List<Routine> routines = [];

  RoutineManagementRepo(
      {required IRoutineManagementLocalSourceContract localSource,
      // required IRoutineManagementRemoteSourceContract remoteSource,
      required InternetConnectionChecker internet,
      required ClientHelper clientHelper})
      : _localSource = localSource;
  // _remoteSource = remoteSource,
  // _internet = internet;

  @override
  Future<Either<Failure, List<Routine>>> getAllRoutines() async {
    try {
      final res = await _localSource.getAllRoutines();
      if (res.isEmpty) return const Left(EmptyCacheFailure(errorMessage: ""));

      routines.clear();
      routines.addAll(res.map((r) => r.toEntity()));
      return Right(routines);
    } catch (e) {
      return const Left(EmptyCacheFailure(errorMessage: ""));
    }
  }

  // @override
  // Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> getAllRoutinesWithHeat() async {
  //   try {
  //     final res = await _localSource.getAllRoutines();
  //     routines.clear();
  //     routines.addAll(res.map((r) => r.toEntity()));
  //     return Right(routines.map((r) => (routine: r, heat: RoutineHeat.cold(r.name))).toList());
  //   } catch (e) {
  //     return const Left(EmptyCacheFailure(errorMessage: ""));
  //   }
  // }

  @override
  Future<Either<Failure, List<Routine>>> createRoutine(String routineName) async {
    try {
      final res = await _localSource.createRoutine(routineName);
      routines.add(res.toEntity());
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Routine>>> updateRoutine(Routine routine) async {
    try {
      await _localSource.updateRoutine(routine.toDto());

      for (int i = 0; i < routines.length; i++) {
        if (routines[i].id == routine.id) {
          routines.removeAt(i);
          routines.insert(i, routine);
          break;
        }
      }
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, List<Routine>>> deleteRoutine(Routine routine) async {
    try {
      await _localSource.deleteRoutine(routine.toDto());
      routines.removeWhere((e) => e.id == routine.id);
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, List<Routine>>> setCurrentRoutine(Routine routine) async {
    try {
      await _localSource.setCurrentRoutine(routine.toDto());

      for (int i = 0; i < routines.length; i++) {
        if (routines[i].isCurrent) {
          routines[i] = routines[i].copyWith(isCurrent: false);
        } else if (routines[i].id == routine.id) {
          routines[i] = routine.copyWith(isCurrent: true);
        }

        // This line is the result of reducing the above lines (but has performance issues!).
        //
        //   `routines[i]= routines[i].copyWith(isCurrent: routines[i].id == routine.id);`
      }

      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> shareRoutine(Routine routine, int userId) async {
    try {
      await _localSource.shareRoutine(routine.toDto());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }
}
