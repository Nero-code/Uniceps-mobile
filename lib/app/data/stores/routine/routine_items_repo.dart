import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_items_local_source.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_items_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineItemsRepo implements IRoutineItemsContract {
  RoutineItemsRepo({
    required IRoutineItemsLocalSourceContract localSource,
    required MediaHelper mediaHelper,
  })  : _localSource = localSource,
        _mediaHelper = mediaHelper;

  final IRoutineItemsLocalSourceContract _localSource;
  final MediaHelper _mediaHelper;
  // final Map<int, List<RoutineItem>> lazyItemsBuffer = {};
  final itemsBuffer = <RoutineItem>[];
  final loadedDays = <int>[];

  @override
  Future<Either<Failure, List<RoutineItem>>> getItemsUnderDay(int dayId) async {
    try {
      final res = await _localSource.getItemsByDay(dayId);
      // if (!lazyItemsBuffer.containsKey(dayId)) {
      //   lazyItemsBuffer
      //       .addAll({dayId: res.map((day) => day as RoutineItem).toList()});
      // }
      if (!loadedDays.contains(dayId)) {
        itemsBuffer.addAll(res.map((r) => r.toEntity()));
        loadedDays.add(dayId);
      }
      return Right(itemsBuffer);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> addItems(
      int dayId, List<ExerciseV2> items) async {
    try {
      await _mediaHelper
          .saveImages(items.map((item) => item.imageUrl).toList());

      final previouslyAddedItems =
          itemsBuffer.where((i) => i.dayId == dayId).length;

      final List<RoutineItemDto> routineItemsFromExercises = [];
      for (int i = 0; i < items.length; i++) {
        routineItemsFromExercises.add(
          RoutineItemDto.create(
              dayId, i + previouslyAddedItems, items[i].toDto()),
        );
      }

      // final itemsWithIdsList = await _localSource
      //     .addItems(items.map((item) => item.toDto()).toList());

      final itemsWithIdsList =
          await _localSource.addItems(routineItemsFromExercises);

      // -------------------------------------------
      // TODO null check operator used on null value
      // if (!lazyItemsBuffer.containsKey(items.first.dayId)) {
      //   lazyItemsBuffer.addAll({items.first.dayId: []});
      // }
      // lazyItemsBuffer[items.first.dayId]!.addAll(itemsWithIdsList);
      // -------------------------------------------

      itemsBuffer.addAll(itemsWithIdsList.map((r) => r.toEntity()));

      return Right(itemsBuffer);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> reorderItems(
      List<RoutineItem> items) async {
    try {
      final orderedList = await _localSource
          .reorderItems(items.map((item) => item.toDto()).toList());

      // ------------------------------------------
      // To reorder the list we need to:
      //
      // First to remove all items that have
      // old indexes...
      for (final i in items) {
        itemsBuffer.removeWhere((item) => item.id == i.id);
      }
      // ------------------------------------------
      // Second insert all items with updated index
      itemsBuffer.addAll(orderedList.map((r) => r.toEntity()));
      // ------------------------------------------

      return Right(itemsBuffer);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> removeItem(
      RoutineItem item) async {
    try {
      await _localSource.removeItem(item.toDto());

      // lazyItemsBuffer[item.dayId]!.remove(item);

      itemsBuffer
        ..removeWhere((element) => element.id == item.id)
        ..forEach((i) =>
            i.index > item.index ? i = i.copyWith(index: i.index - 1) : null);

      return Right(itemsBuffer);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeDayItems(int dayId) async {
    try {
      // if (!lazyItemsBuffer.containsKey(dayId)) return const Right(unit);
      // lazyItemsBuffer.remove(dayId);
      itemsBuffer.removeWhere((element) => element.dayId == dayId);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
