import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class RoutineRepo {
  //  ROUTINE MANAGEMENT
  Future<Either<Failure, List<Routine>>> getAllRoutines();
  Future<Either<Failure, Routine>> createRoutine(Routine routine);
  Future<Either<Failure, Routine>> updateRoutine(Routine routine);
  Future<Either<Failure, Unit>> deleteRoutine(Routine routine);
  Future<Either<Failure, Unit>> shareRoutine(Routine routine, int userId);
}
