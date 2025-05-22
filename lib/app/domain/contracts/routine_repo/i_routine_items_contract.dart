import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IRoutineItemsContract {
  //  ROUTINE ITEMS EDIT
  Future<Either<Failure, List<RoutineItem>>> getItemsUnderDay(int dayId);
  Future<Either<Failure, List<RoutineItem>>> addItems(List<RoutineItem> items);
  Future<Either<Failure, List<RoutineItem>>> reorderItems(
      List<RoutineItem> items);
  Future<Either<Failure, List<RoutineItem>>> removeItem(RoutineItem item);
  Future<Either<Failure, Unit>> removeDayItems(int dayId);
}
