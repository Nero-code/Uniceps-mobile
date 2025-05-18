import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IRoutineSetsLocalSourceContract {
  //  R O U T I N E   S E T S   S E C T I O N
  Future<List<RoutineSetDto>> getItemSets(int itemId);
  Future<List<RoutineSetDto>> addSets(List<RoutineSetDto> listToAdd);
  Future<List<RoutineSetDto>> saveAllSets(List<RoutineSetDto> list);
  Future<RoutineSetDto> updateSet(RoutineSetDto updated);
  Future<void> removeSets(List<RoutineSetDto> listToRemove);
}

class RoutineSetsLocalSourceImpl implements IRoutineSetsLocalSourceContract {
  final AppDatabase _database;

  const RoutineSetsLocalSourceImpl({required AppDatabase database})
      : _database = database;

  @override
  Future<List<RoutineSetDto>> getItemSets(int itemId) async {
    final res = (await (_database.select(_database.routineSets)
              ..where((f) => f.routineItemId.equals(itemId))
              ..orderBy([(u) => OrderingTerm(expression: u.roundIndex)]))
            .get())
        .map((item) => RoutineSetDto.fromTable(item))
        .toList();

    return res;
  }

  @override
  Future<List<RoutineSetDto>> addSets(List<RoutineSetDto> listToAdd) async {
    final result = <RoutineSetDto>[];

    // First, we delete all occurences of any lingering sets as a flush before
    // any writing because sets are not auto-saved.
    // await (_database.delete(_database.routineSets)
    //       ..where((f) => f.routineItemId.equals(listToAdd.first.routineItemId)))
    //     .go();

    // Then, we start inserting sets with fresh new ids and values.
    for (final s in listToAdd) {
      final setId =
          await _database.into(_database.routineSets).insertOnConflictUpdate(
                RoutineSetsCompanion.insert(
                  id: s.id == null ? const Value.absent() : Value(s.id!),
                  roundIndex: s.index,
                  repsCount: s.reps,
                  routineItemId: s.routineItemId,
                ),
                // onConflict: DoUpdate(
                //   (old) => RoutineSetsCompanion.custom(
                //     id: old.id,
                //     apiId: old.apiId,
                //     repsCount: Constant(s.reps),
                //     routineItemId: old.routineItemId,
                //     version: old.version + const Constant(1),
                //     isSynced: const Constant(false),
                //   ),
                // ),
              );
      result.add(s.copyWith(id: setId));
    }
    return result;
  }

  @override
  Future<List<RoutineSetDto>> saveAllSets(List<RoutineSetDto> list) async {
    for (final s in list) {
      await (_database.update(_database.routineSets)
            ..where((f) => f.id.equals(s.id!)))
          .write(RoutineSetsCompanion.custom(
        id: Constant(s.id),
        apiId: Constant(s.apiId),
        routineItemId: Constant(s.routineItemId),
        roundIndex: Constant(s.index),
        repsCount: Constant(s.reps),
        isSynced: const Constant(false),
        version: Constant(s.version) + const Constant(1),
      ));
    }
    return list;
  }

  @override
  Future<RoutineSetDto> updateSet(RoutineSetDto updated) async {
    final res = await (_database.update(_database.routineSets)
          ..where((f) => f.id.equals(updated.id!)))
        .writeReturning(RoutineSetsCompanion.custom(
      repsCount: Constant(updated.reps),
      isSynced: const Constant(false),
      version: Constant(updated.version) + const Constant(1),
    ));
    return RoutineSetDto.fromTable(res.first);
  }

  @override
  Future<void> removeSets(List<RoutineSetDto> listToRemove) async {
    for (final s in listToRemove) {
      await (_database.delete(_database.routineSets)
            ..where((f) => f.id.equals(s.id!)))
          .go();
    }
  }

  // @override
  // Future<void> removeSets(List<RoutineSetDto> listToRemove) async {
  //   // implement removeSets
  //   throw UnimplementedError();
  // }
}
