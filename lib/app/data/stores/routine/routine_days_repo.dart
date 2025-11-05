import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
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
    print("Current Routine Days Initial Len: ${currentRoutineDays.length}");
    try {
      final res = await _localSource.getDays(routineId);
      currentRoutineDays.clear();
      currentRoutineDays.addAll(res.map((r) => r.toEntity()).toList());

      print("Current Routine Days Len: ${currentRoutineDays.length}");
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(EmptyCacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> addDay(RoutineDay day) async {
    print("addDay:");
    print("Current Routine Days Initial Len: ${currentRoutineDays.length}");
    try {
      final dayWithId =
          await _localSource.addDay(RoutineDayDto.fromEntity(day));
      currentRoutineDays.add(dayWithId.toEntity());
      print("Current Routine Days Len: ${currentRoutineDays.length}");
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> removeDay(RoutineDay day) async {
    try {
      await _localSource.removeDay(RoutineDayDto.fromEntity(day));
      currentRoutineDays.remove(day);
      for (int i = day.index; i < currentRoutineDays.length; i++) {
        print("currentRoutineDays ----> ${currentRoutineDays[i].index} : $i");
        currentRoutineDays[i] = currentRoutineDays[i].copyWith(index: i);
      }
      await _localSource
          .saveOrder(currentRoutineDays.map(RoutineDayDto.fromEntity).toList());
      return Right(currentRoutineDays);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> renameDay(RoutineDay day) async {
    try {
      await _localSource.renameDay(RoutineDayDto.fromEntity(day));
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
      final newOrder = await _localSource
          .saveOrder(days.map(RoutineDayDto.fromEntity).toList());
      print("newOrder algorithm");
      for (int i = 0; i < days.length; i++) {
        print("$i : ${days[i].index} : ${days[i].id}");
      }
      currentRoutineDays.clear();
      currentRoutineDays.addAll(newOrder.map((d) => d.toEntity()));
      print("currentRoutineDays reorder algorithm");
      for (int i = 0; i < currentRoutineDays.length; i++) {
        print(
            "$i : ${currentRoutineDays[i].index} : ${currentRoutineDays[i].id}");
      }

      print("reorderDays : repo : after");
      return Right(List.from([...currentRoutineDays]));
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
