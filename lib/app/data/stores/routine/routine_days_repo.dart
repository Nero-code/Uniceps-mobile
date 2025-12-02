import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_days_local_source.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_days_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineDaysRepo implements IRoutineDaysContract {
  RoutineDaysRepo({required IRoutineDaysLocalSourceContract localSource, required Logger logger})
      : _localSource = localSource,
        _logger = logger;

  final IRoutineDaysLocalSourceContract _localSource;
  final Logger _logger;

  final List<RoutineDay> currentRoutineDays = [];

  @override
  Future<Either<Failure, List<RoutineDay>>> getDaysUnderRoutine(int routineId) async {
    _logger.t("Current Routine Days Initial Len: ${currentRoutineDays.length}");
    try {
      final res = await _localSource.getDays(routineId);
      currentRoutineDays.clear();
      currentRoutineDays.addAll(res.map((r) => r.toEntity()).toList());

      _logger.t("Current Routine Days Len: ${currentRoutineDays.length}");
      return Right(currentRoutineDays);
    } catch (e) {
      _logger.e('Error getDaysUnderRoutine', error: e);
      return Left(EmptyCacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> addDay(RoutineDay day) async {
    _logger.t("addDay:");
    _logger.t("Current Routine Days Initial Len: ${currentRoutineDays.length}");
    try {
      final dayWithId = await _localSource.addDay(RoutineDayDto.fromEntity(day));
      currentRoutineDays.add(dayWithId.toEntity());
      _logger.t("Current Routine Days Len: ${currentRoutineDays.length}");
      return Right(currentRoutineDays);
    } catch (e) {
      _logger.e('Error addDay', error: e);
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> removeDay(RoutineDay day) async {
    try {
      await _localSource.removeDay(RoutineDayDto.fromEntity(day));
      currentRoutineDays.remove(day);
      for (int i = day.index; i < currentRoutineDays.length; i++) {
        _logger.t("currentRoutineDays ----> ${currentRoutineDays[i].index} : $i");
        currentRoutineDays[i] = currentRoutineDays[i].copyWith(index: i);
      }
      await _localSource.saveOrder(currentRoutineDays.map(RoutineDayDto.fromEntity).toList());
      return Right(currentRoutineDays);
    } catch (e) {
      _logger.e('Error removeDay', error: e);
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
      _logger.e('Error renameDay', error: e);
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineDay>>> reorderDays(List<RoutineDay> days) async {
    try {
      final newOrder = await _localSource.saveOrder(days.map(RoutineDayDto.fromEntity).toList());
      _logger.t("newOrder algorithm");
      for (int i = 0; i < days.length; i++) {
        _logger.t("$i : ${days[i].index} : ${days[i].id}");
      }
      currentRoutineDays.clear();
      currentRoutineDays.addAll(newOrder.map((d) => d.toEntity()));
      _logger.t("currentRoutineDays reorder algorithm");
      for (int i = 0; i < currentRoutineDays.length; i++) {
        _logger.t("$i : ${currentRoutineDays[i].index} : ${currentRoutineDays[i].id}");
      }

      _logger.t("reorderDays : repo : after");
      return Right(List.from([...currentRoutineDays]));
    } catch (e) {
      _logger.e('Error reorderDays', error: e);
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
