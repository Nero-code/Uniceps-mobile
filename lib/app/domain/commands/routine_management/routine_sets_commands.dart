import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_sets_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineSetsCommands implements ICommand {
  final IRoutineSetsContract _repo;

  const RoutineSetsCommands({required IRoutineSetsContract repo})
      : _repo = repo;
  Future<Either<Failure, List<RoutineSet>>> addItemSets(
      int itemId, List<RoutineSet> oldSets) async {
    return await _repo.addItemSets(itemId, oldSets);
  }

  Future<Either<Failure, List<RoutineSet>>> saveAllSets(
      List<RoutineSet> setsToSave) async {
    return await _repo.saveAllSets(setsToSave);
  }

  Future<Either<Failure, List<RoutineSet>>> updateSet(
      RoutineSet updated) async {
    return await _repo.updateSet(updated);
  }

  Future<Either<Failure, List<RoutineSet>>> getItemSets(int itemId) async {
    return await _repo.getItemSets(itemId);
  }

  Future<Either<Failure, List<RoutineSet>>> removeItemSet(
      RoutineSet setToRemove) async {
    return await _repo.removeItemSet(setToRemove);
  }

  Future<Either<Failure, Unit>> removeallItemSets(int itemId) async {
    return await _repo.removeAllItemSets(itemId);
  }
}
