import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_result.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IRoutineWithHeatContract {
  //  ROUTINE MANAGEMENT
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> getAllRoutinesWithHeat();
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> createRoutine(String routineName);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> updateRoutine(Routine routine);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> deleteRoutine(Routine routine);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> setCurrentRoutine(Routine routine);

  Stream<RoutineResult> importRoutineFromFile();
  Future<bool> exportRoutineToFile(int routineId);
}
