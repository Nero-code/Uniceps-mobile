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
          .addAll({itemId: res.map((s) => s.toEntity()).toList()});
      return Right(lazyItemSetsBuffer[itemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> addItemSets(int itemId) async {
    final newSet = RoutineSetDto(
        id: null,
        apiId: null,
        routineItemId: itemId,
        version: 0,
        index: lazyItemSetsBuffer[itemId]?.length ?? 0,
        reps: 0,
        weight: null,
        isSynced: false);
    try {
      final setWithId = (await _localSource.addSets([newSet])).first;

      final allsets = lazyItemSetsBuffer[itemId] ?? [];
      allsets.add(setWithId.toEntity());
      lazyItemSetsBuffer.addAll({itemId: allsets});

      return Right(allsets);
    } catch (e) {
      print("Error: $e");
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> updateSet(
      RoutineSet updated) async {
    try {
      await _localSource.updateSet(updated.toDto());
      lazyItemSetsBuffer[updated.routineItemId]!
        ..removeWhere((s) => s.id! == updated.id!)
        ..add(updated)
        ..sort((a, b) => a.index.compareTo(b.index));
      return Right(lazyItemSetsBuffer[updated.routineItemId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineSet>>> removeItemSet(
      RoutineSet setToRemove) async {
    try {
      await _localSource.removeSets([setToRemove.toDto()]);
      final setslist = lazyItemSetsBuffer[setToRemove.routineItemId]!;

      setslist
        ..remove(setToRemove)
        ..sort((a, b) => a.index.compareTo(b.index));

      for (var i = 0; i < setslist.length; i++) {
        setslist[i] = setslist[i].copyWith(index: i);
      }

      await _localSource.saveAllSets(setslist.map((s) => s.toDto()).toList());

      lazyItemSetsBuffer.addAll({setToRemove.routineItemId: setslist});
      // lazyItemSetsBuffer[setToRemove.routineItemId]!.remove(setToRemove);

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
