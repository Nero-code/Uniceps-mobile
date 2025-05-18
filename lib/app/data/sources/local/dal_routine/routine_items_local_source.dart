import 'package:drift/drift.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/core/errors/exceptions.dart';

// This is the Routine Items Local Source package abstraction
abstract class IRoutineItemsLocalSourceContract {
  //  R O U T I N E   I T E M S   S E C T I O N
  Future<List<RoutineItemDto>> getItemsByDay(int dayId);
  Future<List<RoutineItemDto>> addItems(List<RoutineItemDto> list);
  Future<List<RoutineItemDto>> reorderItems(List<RoutineItemDto> list);
  Future<void> removeItem(RoutineItemDto item);
}

// This is the concrete Routine Items Local Source implementation
class RoutineItemsLocalSourceImpl implements IRoutineItemsLocalSourceContract {
  final AppDatabase _database;
  final Box<Uint8List> _imagesCache;

  const RoutineItemsLocalSourceImpl(
      {required AppDatabase database, required Box<Uint8List> imagesCache})
      : _database = database,
        _imagesCache = imagesCache;

  @override
  Future<List<RoutineItemDto>> getItemsByDay(int dayId) async {
    // Our main list to populate.
    final result = <RoutineItemDto>[];

    // Starting with database query to get items under the `dayId`
    final items = await (_database.select(_database.routineItems)
          ..where((f) => f.dayId.equals(dayId)))
        .get()
      ..sort((a, b) => b.index.compareTo(a.index));

    for (int i = 0; i < items.length; i++) {
      // -----------------------------------------------------------
      // Getting exercise since only muscle group is a parent in its
      // relationship with exercise
      final ex = await (_database.select(_database.exercises)
            ..where((f) => f.id.equals(items[i].exerciseId)))
          .getSingle();

      // --------------------------------------------------
      // Getting Muscle-group that the exercise belongs to.
      final mg = await (_database.select(_database.exerciseGroups)
            ..where((f) => f.id.equals(ex.muscleGroup)))
          .getSingle();

      // --------------------------------------------------
      // Getting routine item sets.
      final sets = await (_database.select(_database.routineSets)
            ..where((f) => f.routineItemId.equals(items[i].id)))
          .get();

      // ------------------------------------------------------------------
      // trying to get routine image, there's a problem if the image is not
      // found for some reason, that's why we throw a database exception in
      // this circumstance...
      if (!_imagesCache.containsKey(ex.imageUrl)) throw DataBaseException();

      final img = _imagesCache.get(ex.imageUrl)!;

      // ------------------------------------------------------------------
      // @UPDATE:
      // SQL has a way to get data from multiple tables called `JOIN`.
      // Its main functionality is to group rows based on a specific condition,
      // like a shared id or foreign key...
      result.add(
        RoutineItemDto.fromTable(
            items[i], ExerciseV2Dto.fromTable(ex, mg, ex.imageUrl, img), sets),
      );
    }
    return result;
  }

  @override
  Future<List<RoutineItemDto>> addItems(List<RoutineItemDto> list) async {
    final result = <RoutineItemDto>[];

    for (final i in list) {
      // ------------------------------------------------------------------
      // Inserting muscle group into database and updating old if exists
      // final mg = await _database.into(_database.exerciseGroups).insertReturning(
      //     ExerciseGroupsCompanion.insert(
      //         apiId: i.exerciseV2Dto.muscleGroup.apiId,
      //         arName: i.exerciseV2Dto.muscleGroup.arGroupName,
      //         enName: i.exerciseV2Dto.muscleGroup.enGroupName),
      //     onConflict: DoUpdate((update) => ExerciseGroupsCompanion.custom(
      //         arName: update.arName, enName: update.enName)));

      // -----------------------------------------------------------------
      // Inserting Exercise into database after muscle-group because of
      // foreign key constraints

      late final Exercise ex;
      final oldEx = await (_database.select(_database.exercises)
            ..where((f) => f.apiId.equals(i.apiId!)))
          .get();

      if (oldEx.isEmpty) {
        ex = await _database.into(_database.exercises).insertReturning(
              ExercisesCompanion.insert(
                  apiId: Value(i.exerciseV2Dto.apiId),
                  name: i.exerciseV2Dto.name,
                  imageUrl: i.exerciseV2Dto.imageUrl,
                  muscleGroup: i.exerciseV2Dto.muscleGroupId),
              // onConflict: DoUpdate((old) => ExercisesCompanion.custom(
              //       id: i.id == null ? null : Constant(i.id!),
              //       apiId: old.apiId,
              //       name: Constant(i.exerciseV2Dto.name),
              //       imageUrl: Constant(i.exerciseV2Dto.imageUrl),
              //       muscleGroup: Constant(i.exerciseV2Dto.muscleGroupId),
              //     )),
            );
      } else {
        ex = (await (_database.update(_database.exercises)
                  ..where((f) => f.apiId.equals(i.apiId!)))
                .writeReturning(ExercisesCompanion.custom(
          id: Constant(oldEx.first.id),
          apiId: Constant(oldEx.first.apiId),
          name: Constant(oldEx.first.name),
          imageUrl: Constant(oldEx.first.imageUrl),
          muscleGroup: Constant(oldEx.first.muscleGroup),
        )))
            .single;
      }

      // -----------------------------------------------------------------
      // Getting image bitmap from cache for item update.
      final img = _imagesCache.get(ex.imageUrl);

      // -----------------------------------------------------------------
      // Finally, Inserting RoutineItem into database, but not getting neither
      // exercise Dto nor musclegroup Dto,
      //
      // Also another assumption to bear in mind that the item image is stored
      // in the repo layer before these insertions.
      final itemId = await _database.into(_database.routineItems).insert(
          RoutineItemsCompanion.insert(
              index: i.index, exerciseId: ex.id, dayId: i.dayId));

      result.add(i.copyDtoWith(
        id: itemId,
        exerciseV2Dto: i.exerciseV2Dto
            .copywith(id: ex.id, apiId: ex.apiId, imageBitMap: img),
      ));
    }
    return result;
  }

  @override
  Future<void> removeItem(RoutineItemDto item) async {
    await (_database.delete(_database.routineItems)
          ..where((f) => f.id.equals(item.id!)))
        .go();
  }

  @override
  Future<List<RoutineItemDto>> reorderItems(List<RoutineItemDto> list) async {
    final res = <RoutineItemDto>[];

    for (int i = 0; i < list.length; i++) {
      final row = await (_database.update(_database.routineItems)
            ..where((f) => f.id.equals(list[i].id!)))
          .writeReturning(RoutineItemsCompanion(
              index: Value(i),
              version: Value(list[i].version + 1),
              isSynced: const Value(false)));

      res.add(RoutineItemDto.fromTable(row.first, list[i].exerciseV2Dto));
    }

    return res;
  }
}
