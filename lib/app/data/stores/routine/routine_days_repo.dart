import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_days_local_source.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_days_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineDaysRepo implements IRoutineDaysContract {
  RoutineDaysRepo({required IRoutineDaysLocalSourceContract localSource})
      : _localSource = localSource;

  final IRoutineDaysLocalSourceContract _localSource;

  final List<RoutineDay> currentRoutineDays = [];

  @override
  Future<Either<Failure, List<RoutineDay>>> getDaysUnderRoutine(
      int routineId) async {
    try {
      currentRoutineDays.clear();
      currentRoutineDays.addAll(await _localSource.getDays(routineId));
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(EmptyCacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> addDay(RoutineDay day) async {
    try {
      await _localSource.addDay(day.asDto());
      currentRoutineDays.add(day);
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> removeDay(RoutineDay day) async {
    try {
      await _localSource.removeDay(day.asDto());
      currentRoutineDays.remove(day);
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> renameDay(RoutineDay day) async {
    try {
      await _localSource.renameDay(day.asDto());
      currentRoutineDays.removeAt(day.index);
      currentRoutineDays.insert(day.index, day);
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> reorderDays(
      List<RoutineDay> days) async {
    try {
      await _localSource.saveOrder(days.map((day) => day.asDto()).toList());
      currentRoutineDays.replaceRange(0, days.length, days);
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
