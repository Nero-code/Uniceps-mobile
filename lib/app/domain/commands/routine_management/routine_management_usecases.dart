import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/routine_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineManagementUsecases implements ICommand {
  final RoutineRepo _repo;
  const RoutineManagementUsecases(this._repo);
  Future<Either<Failure, Routine>> createRoutine(Routine routine) async {
    return await _repo.createRoutine(routine);
  }

  Future<Either<Failure, Unit>> deleteRoutine(Routine routine) async {
    return await _repo.deleteRoutine(routine);
  }

  Future<Either<Failure, List<Routine>>> getAllRoutines() async {
    return await _repo.getAllRoutines();
  }

  Future<Either<Failure, Unit>> shareRoutine(
      Routine routine, int userId) async {
    return await _repo.shareRoutine(routine, userId);
  }

  Future<Either<Failure, Routine>> updateRoutine(Routine routine) async {
    return await _repo.updateRoutine(routine);
  }
}
