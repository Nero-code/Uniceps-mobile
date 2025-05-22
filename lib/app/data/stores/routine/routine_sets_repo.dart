import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
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
          .addAll({itemId: res.map((s) => s as RoutineSet).toList()});
      return Right(lazyItemSetsBuffer[itemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> addItemSets(
      int itemId, List<RoutineSet> setsToAdd) async {
    try {
      final setsWithIds = await _localSource.addSets([
        ...setsToAdd.map((s) => s.asDto()),
        RoutineSetDto(
            id: null,
            apiId: null,
            routineItemId: itemId,
            version: 0,
            index: setsToAdd.length,
            reps: 0,
            isSynced: false)
      ]);

      // if (lazyItemSetsBuffer.containsKey(itemId)) {
      //   final oldSets = lazyItemSetsBuffer[itemId]!;
      //   oldSets.addAll(setsWithIds.map((s) => s as RoutineSet).toList());

      //   lazyItemSetsBuffer.addAll({itemId: oldSets});
      // } else {
      //   lazyItemSetsBuffer
      //       .addAll({itemId: setsWithIds.map((s) => s as RoutineSet).toList()});
      // }

      lazyItemSetsBuffer.addAll({itemId: setsWithIds});

      return Right(lazyItemSetsBuffer[itemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> saveAllSets(
      List<RoutineSet> allSets) async {
    try {
      final res = await _localSource
          .saveAllSets(allSets.map((s) => s.asDto()).toList());
      return Right(res);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> updateSet(
      RoutineSet updated) async {
    try {
      await _localSource.updateSet(updated.asDto());
      lazyItemSetsBuffer[updated.routineItemId]!
        ..removeWhere((s) => s.id! == updated.id!)
        ..add(updated);
      return Right(lazyItemSetsBuffer[updated.routineItemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> removeItemSet(
      RoutineSet setToRemove) async {
    try {
      await _localSource.removeSets([setToRemove.asDto()]);
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
