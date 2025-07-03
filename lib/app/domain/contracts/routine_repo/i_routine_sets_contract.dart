import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IRoutineSetsContract {
  //  ROUTINE SETS EDIT
  Future<Either<Failure, List<RoutineSet>>> getItemSets(int itemId);
  Future<Either<Failure, List<RoutineSet>>> addItemSets(int itemId);
  Future<Either<Failure, List<RoutineSet>>> removeItemSet(RoutineSet setToRmv);
  // Future<Either<Failure, List<RoutineSet>>> saveAllSets(
  //     List<RoutineSet> allSets);
  Future<Either<Failure, List<RoutineSet>>> updateSet(RoutineSet updated);
  Future<Either<Failure, Unit>> removeAllItemSets(int itemId);
}
