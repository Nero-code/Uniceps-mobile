import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IRoutineSetsContract {
  //  ROUTINE SETS EDIT
  Future<Either<Failure, List<RoutineSet>>> getItemSets(int itemId);
  Future<Either<Failure, List<RoutineSet>>> addItemSets(
      List<RoutineSet> setsToAdd);
  Future<Either<Failure, List<RoutineSet>>> removeItemSet(
      RoutineSet setToRemove);
  Future<Either<Failure, Unit>> removeAllItemSets(int itemId);
}
