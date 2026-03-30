import 'package:drift/drift.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/core/errors/exceptions.dart';

// This is the Routine Items Local Source package abstraction
abstract class IRoutineItemsLocalSourceContract {
  //  R O U T I N E   I T E M S   S E C T I O N
  Future<List<RoutineItemDto>> getItemsByDay(int dayId);
  Future<List<RoutineItemDto>> addItems(List<RoutineItemDto> list);
  Future<List<RoutineItemDto>> reorderItems(List<RoutineItemDto> list);
  Future<void> removeItem(RoutineItemDto item);

  Future<void> copySetsToAll(int dayId, int itemId);
}

// This is the concrete Routine Items Local Source implementation
class RoutineItemsLocalSourceImpl implements IRoutineItemsLocalSourceContract {
  final AppDatabase _database;
  final Box<Uint8List> _imagesCache;

  const RoutineItemsLocalSourceImpl({required AppDatabase database, required Box<Uint8List> imagesCache})
    : _database = database,
      _imagesCache = imagesCache;

  @override
  Future<List<RoutineItemDto>> getItemsByDay(int dayId) async {
    // Our main list to populate.
    final result = <RoutineItemDto>[];

    // Starting with database query to get items under the `dayId`
    final items = await (_database.select(_database.routineItems)..where((f) => f.dayId.equals(dayId))).get()
      ..sort((a, b) => b.index.compareTo(a.index));

    for (int i = 0; i < items.length; i++) {
      // ------------------------------------------------------------------
      // Getting exercise since only muscle group is a parent in its
      // relationship with exercise
      final ex = await (_database.select(
        _database.exercises,
      )..where((f) => f.apiId.equals(items[i].exerciseId))).getSingle();
      // ------------------------------------------------------------------
      // Getting routine item sets.
      final getSets = await (_database.select(
        _database.routineSets,
      )..where((f) => f.routineItemId.equals(items[i].id))).get();
      final sets = getSets.map((s) => RoutineSetDto.fromTable(s)).toList();
      // ------------------------------------------------------------------
      // trying to get routine image, there's a problem if the image is not
      // found for some reason, that's why we throw a database exception in
      // this circumstance...
      if (!_imagesCache.containsKey(ex.apiId)) throw DataBaseException();
      final img = _imagesCache.get(ex.apiId)!;
      // ------------------------------------------------------------------
      // @UPDATE:
      // SQL has a way to get data from multiple tables called `JOIN`.
      // Its main functionality is to group rows based on a specific condition,
      // like a shared id or foreign key...
      result.add(RoutineItemDto.fromTable(items[i], ExerciseDto.fromTable(ex, ex.apiId, img), sets));
    }
    return result;
  }

  @override
  Future<List<RoutineItemDto>> addItems(List<RoutineItemDto> list) async {
    final result = <RoutineItemDto>[];

    for (final i in list) {
      final ex = await (_database.select(
        _database.exercises,
      )..where((f) => f.apiId.equals(i.exerciseDto.apiId))).getSingle();

      final img = _imagesCache.get(ex.apiId);

      final itemId = await _database
          .into(_database.routineItems)
          .insert(RoutineItemsCompanion.insert(index: i.index, exerciseId: ex.apiId, dayId: i.dayId));

      result.add(
        i.copyWith(
          id: itemId,
          exerciseV2Dto: i.exerciseDto.copyWith(apiId: ex.apiId, imageBitMap: img),
        ),
      );
    }
    return result;
  }

  @override
  Future<void> removeItem(RoutineItemDto item) async {
    await (_database.delete(_database.routineItems)..where((f) => f.id.equals(item.id!))).go();

    final old =
        await (_database.select(_database.routineItems)
              ..where((f) => f.dayId.equals(item.dayId))
              ..where((f2) => f2.index.isBiggerOrEqualValue(item.index)))
            .get();
    for (final i in old) {
      await (_database.update(
        _database.routineItems,
      )..where((f) => f.id.equals(i.id))).write(RoutineItemsCompanion.custom(index: Constant(i.index - 1)));
    }
  }

  @override
  Future<List<RoutineItemDto>> reorderItems(List<RoutineItemDto> list) async {
    final res = <RoutineItemDto>[];

    for (int i = 0; i < list.length; i++) {
      final row = await (_database.update(_database.routineItems)..where((f) => f.id.equals(list[i].id!)))
          .writeReturning(
            RoutineItemsCompanion(index: Value(i), version: Value(list[i].version + 1), isSynced: const Value(false)),
          );

      res.add(RoutineItemDto.fromTable(row.first, list[i].exerciseDto));
    }

    return res;
  }

  @override
  Future<void> copySetsToAll(int dayId, int itemId) async {
    final sets = await (_database.select(_database.routineSets)..where((f) => f.routineItemId.equals(itemId))).get();
    if (sets.isEmpty) return;

    final items = await (_database.select(_database.routineItems)..where((f) => f.dayId.equals(dayId))).get();
    for (final i in items) {
      await (_database.delete(_database.routineSets)..where((f) => f.routineItemId.equals(i.id))).go();
      for (final s in sets) {
        await (_database
            .into(_database.routineSets)
            .insert(
              RoutineSetsCompanion.insert(roundIndex: s.roundIndex, repsCount: s.repsCount, routineItemId: i.id),
            ));
      }
    }
  }
}
