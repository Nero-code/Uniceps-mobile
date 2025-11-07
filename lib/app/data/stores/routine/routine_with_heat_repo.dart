import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_with_heat_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineWithHeatRepo implements IRoutineWithHeatContract {
  final IRoutineManagementLocalSourceContract _localSource;
  // final RoutineRemoteSource _remoteSource;
  // final InternetConnectionChecker _internet;

  final List<({Routine routine, RoutineHeat heat})> routines = [];

  RoutineWithHeatRepo(
      {required IRoutineManagementLocalSourceContract localSource,
      // required IRoutineManagementRemoteSourceContract remoteSource,
      required InternetConnectionChecker internet,
      required ClientHelper clientHelper})
      : _localSource = localSource;

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> getAllRoutinesWithHeat() async {
    try {
      final res = await _localSource.getAllRoutinesWithHeat();
      routines.clear();
      routines.addAll(res.map((e) => (routine: e.routine.toEntity(), heat: e.heat)));
      return Right(routines);
    } catch (e) {
      return const Left(EmptyCacheFailure(errorMessage: ""));
    }
  }

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> createRoutine(String routineName) async {
    try {
      final res = await _localSource.createRoutine(routineName);
      routines.add((routine: res.toEntity(), heat: RoutineHeat.cold(res.name)));
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> updateRoutine(Routine routine) async {
    try {
      await _localSource.updateRoutine(routine.toDto());

      for (int i = 0; i < routines.length; i++) {
        if (routines[i].routine.id == routine.id) {
          routines.removeAt(i);
          routines.insert(i, (routine: routine, heat: routines[i].heat));
          break;
        }
      }
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> setCurrentRoutine(Routine routine) async {
    try {
      await _localSource.setCurrentRoutine(routine.toDto());

      for (int i = 0; i < routines.length; i++) {
        if (routines[i].routine.isCurrent) {
          routines[i] = (routine: routines[i].routine.copyWith(isCurrent: false), heat: routines[i].heat);
        } else if (routines[i].routine.id == routine.id) {
          routines[i] = (routine: routine.copyWith(isCurrent: true), heat: routines[i].heat);
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
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> deleteRoutine(Routine routine) async {
    try {
      await _localSource.deleteRoutine(routine.toDto());
      routines.removeWhere((tuple) => tuple.routine.id == routine.id);
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
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
  // _remoteSource = remoteSource,
  // _internet = internet;
}
