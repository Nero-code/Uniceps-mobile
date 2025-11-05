import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IRoutineDaysLocalSourceContract {
  //  R O U T I N E   D A Y S   S E C T I O N
  Future<List<RoutineDayDto>> getDays(int routineId);
  Future<RoutineDayDto> addDay(RoutineDayDto day);
  Future<void> renameDay(RoutineDayDto day);
  Future<void> removeDay(RoutineDayDto day);
  Future<List<RoutineDayDto>> saveOrder(List<RoutineDayDto> days);
}

class RoutineDaysLocalSourceImpl implements IRoutineDaysLocalSourceContract {
  final AppDatabase _dataBase;

  const RoutineDaysLocalSourceImpl({required AppDatabase dataBase})
      : _dataBase = dataBase;

  @override
  Future<List<RoutineDayDto>> getDays(int routineId) async {
    // -----------------------------------------------------------------------
    // Getting the days under the routine from days table, ordering the result
    // by the day index(order) in the list.
    final res = await (_dataBase.select(_dataBase.daysGroup)
          ..where((f) => f.routineId.equals(routineId))
          ..orderBy([(u) => OrderingTerm(expression: u.index)]))
        .get();

    return res.map((day) => RoutineDayDto.fromTable(day)).toList();
  }

  @override
  Future<RoutineDayDto> addDay(RoutineDayDto day) async {
    // -----------------------------------------------------------------------
    // Adding a new day to the database, it inserts a single day instead of a
    // list of all the days together because of the autosave methodology that
    // the app supports.
    final res = await _dataBase
        .into(_dataBase.daysGroup)
        .insert(DaysGroupCompanion.insert(
          index: day.index,
          dayName: day.name,
          routineId: day.routineId,
        ));
    return day.copyWith(id: res);
  }

  @override
  Future<void> removeDay(RoutineDayDto day) async {
    // Simple delete function for a day.
    await (_dataBase.delete(_dataBase.daysGroup)
          ..where((f) => f.id.equals(day.id!)))
        .go();
  }

  @override
  Future<RoutineDayDto> renameDay(RoutineDayDto day) async {
    // renamming is acually a form of update but for single property (name).
    final res = await (_dataBase.update(_dataBase.daysGroup)
          ..where((f) => f.id.equals(day.id!)))
        .writeReturning(
      DaysGroupCompanion(
        dayName: Value(day.name),
        version: Value(day.version + 1),
        isSynced: const Value(false),
      ),
    );
    return RoutineDayDto.fromTable(res.first);
  }

  @override
  Future<List<RoutineDayDto>> saveOrder(List<RoutineDayDto> days) async {
    // Reordering is another way of update but on the indexes of the list.
    final res = <RoutineDayDto>[];

    for (int i = 0; i < days.length; i++) {
      final row = await (_dataBase.update(_dataBase.daysGroup)
            ..where((f) => f.id.equals(days[i].id!)))
          .writeReturning(
        DaysGroupCompanion(
          index: Value(i),
          version: Value(days[i].version + 1),
          isSynced: const Value(false),
        ),
      );
      res.add(RoutineDayDto.fromTable(row.first));
    }
    return res;
  }
}
