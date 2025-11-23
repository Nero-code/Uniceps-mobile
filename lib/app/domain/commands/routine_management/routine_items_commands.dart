import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_items_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineItemsCommands implements ICommand {
  final IRoutineItemsContract _repo;

  const RoutineItemsCommands({required IRoutineItemsContract repo}) : _repo = repo;
  Future<Either<Failure, List<RoutineItem>>> getItemsUnderDay(int dayId) async {
    return await _repo.getItemsUnderDay(dayId);
  }

  Future<Either<Failure, List<RoutineItem>>> addItems(int dayId, List<ExerciseV2> items) async {
    return await _repo.addItems(dayId, items);
  }

  Future<Either<Failure, List<RoutineItem>>> removeItem(RoutineItem item) async {
    return await _repo.removeItem(item);
  }

  Future<Either<Failure, List<RoutineItem>>> reorderItems(List<RoutineItem> items) async {
    return await _repo.reorderItems(items);
  }

  Future<Either<Failure, Unit>> copySetsToAll(int dayId, int itemId) async {
    return await _repo.copySetsToAll(dayId, itemId);
  }
}
