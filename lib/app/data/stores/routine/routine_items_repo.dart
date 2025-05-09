import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_items_local_source.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
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
        itemsBuffer.addAll(res);
        loadedDays.add(dayId);
      }
      return Right(itemsBuffer);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> addItems(
      List<RoutineItem> items) async {
    try {
      await _mediaHelper.saveExerciseImages(
          items.map((item) => item.exercise.imageUrl).toList());
      final itemsWithIdsList = await _localSource
          .addItems(items.map((item) => item.asDto()).toList());

      // -------------------------------------------
      // TODO null check operator used on null value
      // if (!lazyItemsBuffer.containsKey(items.first.dayId)) {
      //   lazyItemsBuffer.addAll({items.first.dayId: []});
      // }
      // lazyItemsBuffer[items.first.dayId]!.addAll(itemsWithIdsList);
      // -------------------------------------------

      itemsBuffer.addAll(itemsWithIdsList);

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
          .reorderItems(items.map((item) => item.asDto()).toList());

      return Right(orderedList);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> removeItem(
      RoutineItem item) async {
    try {
      await _localSource.removeItem(item.asDto());

      // lazyItemsBuffer[item.dayId]!.remove(item);

      itemsBuffer.removeWhere((element) => element.id == item.id);

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
