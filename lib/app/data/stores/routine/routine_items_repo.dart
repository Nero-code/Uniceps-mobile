import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_items_local_source.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_items_contract.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineItemsRepo implements IRoutineItemsContract {
  RoutineItemsRepo({
    required IRoutineItemsLocalSourceContract localSource,
    required MediaHelper mediaHelper,
  })  : _localSource = localSource,
        _mediaHelper = mediaHelper;

  final IRoutineItemsLocalSourceContract _localSource;
  final MediaHelper _mediaHelper;
  final Map<int, List<RoutineItem>> lazyItemsBuffer = {};

  @override
  Future<Either<Failure, List<RoutineItem>>> getItemsUnderDay(int dayId) async {
    try {
      final res = await _localSource.getItemsByDay(dayId);
      if (!lazyItemsBuffer.containsKey(dayId)) {
        lazyItemsBuffer
            .addAll({dayId: res.map((day) => day as RoutineItem).toList()});
      }
      return Right(lazyItemsBuffer[dayId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> addItems(
      List<RoutineItem> items) async {
    try {
      await _mediaHelper.saveExerciseImages(items
          .map((item) => imgUrlParser(
              item.exercise.muscleGroup.apiId, item.exercise.imageUrl))
          .toList());
      final itemsWithIdsList = await _localSource
          .addItems(items.map((item) => item.asDto()).toList());
      lazyItemsBuffer[items.first.dayId]!.addAll(itemsWithIdsList);
      return Right(lazyItemsBuffer[items.first.dayId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> reorderItems(
      List<RoutineItem> items) async {
    try {
      await _localSource
          .reorderItems(items.map((item) => item.asDto()).toList());
      return Right(items);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RoutineItem>>> removeItem(
      RoutineItem item) async {
    try {
      await _localSource.removeItem(item.asDto());
      lazyItemsBuffer[item.dayId]!.remove(item);
      return Right(lazyItemsBuffer[item.dayId]!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeDayItems(int dayId) async {
    try {
      if (!lazyItemsBuffer.containsKey(dayId)) return const Right(unit);
      lazyItemsBuffer.remove(dayId);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
