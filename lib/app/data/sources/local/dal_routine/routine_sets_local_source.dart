import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IRoutineSetsLocalSourceContract {
  //  R O U T I N E   S E T S   S E C T I O N
  Future<List<RoutineSetDto>> getItemSets(int itemId);
  Future<void> addSets(List<RoutineSetDto> listToAdd);
  // Future<void> removeSets(List<RoutineSetDto> listToRemove);
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
    await (_database.delete(_database.routineSets)
          ..where((f) => f.routineItemId.equals(listToAdd.first.routineItemId)))
        .go();

    // Then, we start inserting sets with fresh new ids and values.
    for (final set in listToAdd) {
      final setId = await (_database.into(_database.routineSets))
          .insert(RoutineSetsCompanion.insert(
        roundIndex: set.index,
        repsCount: set.reps,
        routineItemId: set.routineItemId,
      ));
      result.add(set.copyWith(id: setId));
    }
    return result;
  }

  // @override
  // Future<void> removeSets(List<RoutineSetDto> listToRemove) async {
  //   // implement removeSets
  //   throw UnimplementedError();
  // }
}
