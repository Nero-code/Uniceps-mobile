import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/routine_edit_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineEditUsecases implements ICommand {
  final RoutineEditRepo _repo;
  const RoutineEditUsecases({required RoutineEditRepo repo}) : _repo = repo;

  Future<Either<Failure, List<RoutineDay>>> addDay(RoutineDay day) async {
    return await _repo.addDay(day);
  }

  Future<Either<Failure, List<RoutineDay>>> removeDay(RoutineDay day) async {
    return await _repo.removeDay(day);
  }

  Future<Either<Failure, List<RoutineDay>>> renameDay(RoutineDay day) async {
    return await _repo.renameDay(day);
  }

  Future<Either<Failure, List<RoutineDay>>> reorderDays(
      List<RoutineDay> days) async {
    return await _repo.reorderDays(days);
  }

  Future<Either<Failure, List<RoutineItem>>> addItem(RoutineItem item) async {
    return await _repo.addItem(item);
  }

  Future<Either<Failure, List<RoutineItem>>> removeItem(
      RoutineItem item) async {
    return await _repo.removeItem(item);
  }
}
