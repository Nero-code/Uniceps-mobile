import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_sets_local_source.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_sets_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineSetsRepo implements IRoutineSetsContract {
  RoutineSetsRepo({required IRoutineSetsLocalSourceContract localSource})
      : _localSource = localSource;
  final IRoutineSetsLocalSourceContract _localSource;

  final Map<int, List<RoutineSet>> lazyItemSetsBuffer = {};

  @override
  Future<Either<Failure, List<RoutineSet>>> getItemSets(int itemId) async {
    try {
      final res = await _localSource.getItemSets(itemId);
      lazyItemSetsBuffer
          .addAll({itemId: res.map((set) => set.asDto()).toList()});
      return Right(lazyItemSetsBuffer[itemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> addItemSets(
      List<RoutineSet> setsToAdd) async {
    try {
      await _localSource.addSets(setsToAdd.map((set) => set.asDto()).toList());
      lazyItemSetsBuffer.addAll({setsToAdd.first.routineItemId: setsToAdd});
      return Right(lazyItemSetsBuffer[setsToAdd.first.routineItemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> removeItemSet(
      RoutineSet setToRemove) async {
    try {
      lazyItemSetsBuffer[setToRemove.routineItemId]!.remove(setToRemove);
      return Right(lazyItemSetsBuffer[setToRemove.routineItemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeAllItemSets(int itemId) async {
    try {
      if (!lazyItemSetsBuffer.containsKey(itemId)) return const Right(unit);
      lazyItemSetsBuffer.remove(itemId);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
