import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_days_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineDaysCommands implements ICommand {
  final IRoutineDaysContract _repo;

  const RoutineDaysCommands({required IRoutineDaysContract repo}) : _repo = repo;

  Future<Either<Failure, List<RoutineDay>>> getDaysUnderRoutine(int routineId) async {
    return await _repo.getDaysUnderRoutine(routineId);
  }

  Future<Either<Failure, List<RoutineDay>>> addDay(RoutineDay day) async {
    return await _repo.addDay(day);
  }

  Future<Either<Failure, List<RoutineDay>>> removeDay(RoutineDay day) async {
    return await _repo.removeDay(day);
  }

  Future<Either<Failure, List<RoutineDay>>> renameDay(RoutineDay day) async {
    return await _repo.renameDay(day);
  }

  Future<Either<Failure, List<RoutineDay>>> reorderDays(List<RoutineDay> days) async {
    return await _repo.reorderDays(days);
  }
}
