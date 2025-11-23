import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_with_heat_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineWithHeatCommands {
  final IRoutineWithHeatContract _repo;

  RoutineWithHeatCommands({required IRoutineWithHeatContract repo}) : _repo = repo;

  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> getAllRoutinesWithHeat() =>
      _repo.getAllRoutinesWithHeat();
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> createRoutine(String routineName) =>
      _repo.createRoutine(routineName);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> updateRoutine(Routine routine) =>
      _repo.updateRoutine(routine);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> deleteRoutine(Routine routine) =>
      _repo.deleteRoutine(routine);
  Future<Either<Failure, List<({Routine routine, RoutineHeat heat})>>> setCurrentRoutine(Routine routine) =>
      _repo.setCurrentRoutine(routine);
  Future<Either<Failure, Unit>> shareRoutine(Routine routine, int userId) => _repo.shareRoutine(routine, userId);
}
