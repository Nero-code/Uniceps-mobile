import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IRoutineManagementContract {
  //  ROUTINE MANAGEMENT
  Future<Either<Failure, List<Routine>>> getAllRoutines();
  Future<Either<Failure, List<Routine>>> createRoutine(String routineName);
  Future<Either<Failure, List<Routine>>> updateRoutine(Routine routine);
  Future<Either<Failure, List<Routine>>> deleteRoutine(Routine routine);
  Future<Either<Failure, Unit>> shareRoutine(Routine routine, int userId);
}
