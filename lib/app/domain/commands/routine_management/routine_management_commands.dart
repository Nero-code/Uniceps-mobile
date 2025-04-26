import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_management_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineManagementCommands implements ICommand {
  final IRoutineManagementContract _repo;
  const RoutineManagementCommands({required IRoutineManagementContract repo})
      : _repo = repo;

  Future<Either<Failure, List<Routine>>> getAllRoutines() async =>
      await _repo.getAllRoutines();

  Future<Either<Failure, List<Routine>>> createRoutine(
          String routineName) async =>
      await _repo.createRoutine(routineName);

  Future<Either<Failure, List<Routine>>> updateRoutine(Routine routine) async =>
      await _repo.updateRoutine(routine);

  Future<Either<Failure, List<Routine>>> deleteRoutine(Routine routine) async =>
      await _repo.deleteRoutine(routine);

  Future<Either<Failure, Unit>> shareRoutine(
          Routine routine, int userId) async =>
      await _repo.shareRoutine(routine, userId);
}
