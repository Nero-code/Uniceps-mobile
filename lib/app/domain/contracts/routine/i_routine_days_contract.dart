import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IRoutineDaysContract {
  //  ROUTINE DAYS EDIT
  Future<Either<Failure, List<RoutineDay>>> getDaysUnderRoutine(int routineId);
  Future<Either<Failure, List<RoutineDay>>> addDay(RoutineDay day);
  Future<Either<Failure, List<RoutineDay>>> removeDay(RoutineDay day);
  Future<Either<Failure, List<RoutineDay>>> renameDay(RoutineDay day);
  Future<Either<Failure, List<RoutineDay>>> reorderDays(List<RoutineDay> days);
}
