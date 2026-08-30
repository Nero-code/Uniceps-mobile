import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_result.dart';
import 'package:uniceps/app/data/services/unifile/unifile.dart';
import 'package:uniceps/app/domain/classes/routine_classes/premade_routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IRoutineWithHeatContract {
  //  ROUTINE MANAGEMENT
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> getAllRoutinesWithHeat();
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> createRoutine(String routineName);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> updateRoutine(Routine routine);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> deleteRoutine(Routine routine);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> setCurrentRoutine(Routine routine);

  Stream<RoutineResult> importRoutineFromFile();
  Stream<RoutineResult> importRoutine(UniFile file);
  Future<bool> exportRoutineToFile(int routineId);
  Future<bool> shareRoutine(int routineId);

  Future<Either<PremadeFailure, List<PremadeRoutine>>> getPremadeRoutines(Gender gender, String languageCode);

  Future<Either<PremadeFailure, Unit>> downloadAndAddRoutine(String apiId, String languageCode);
}
