import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IRoutineDaysLocalSourceContract {
  //  R O U T I N E   D A Y S   S E C T I O N
  Future<List<RoutineDayDto>> getDays(int routineId);
  Future<RoutineDayDto> addDay(RoutineDayDto day);
  Future<void> renameDay(RoutineDayDto day);
  Future<void> removeDay(RoutineDayDto day);
  Future<void> saveOrder(List<RoutineDayDto> day);
}

class RoutineDaysLocalSourceImpl implements IRoutineDaysLocalSourceContract {
  final AppDatabase _dataBase;

  const RoutineDaysLocalSourceImpl({required AppDatabase dataBase})
      : _dataBase = dataBase;

  @override
  Future<List<RoutineDayDto>> getDays(int routineId) async {
    final res = await (_dataBase.select(_dataBase.daysGroup)
          ..where((f) => f.routineId.equals(routineId)))
        .get();
    return res.map((day) => RoutineDayDto.fromTable(day)).toList();
  }

  @override
  Future<RoutineDayDto> addDay(RoutineDayDto day) async {
    final res = await _dataBase
        .into(_dataBase.daysGroup)
        .insert(DaysGroupCompanion.insert(
          index: day.index,
          dayName: day.name,
          routineId: day.routineId,
        ));
    return day.copyDtoWith(id: res);
  }

  @override
  Future<void> removeDay(RoutineDayDto day) async {
    // TODO: implement removeDay
    throw UnimplementedError();
  }

  @override
  Future<void> renameDay(RoutineDayDto day) async {
    // TODO: implement renameDay
    throw UnimplementedError();
  }

  @override
  Future<void> saveOrder(List<RoutineDayDto> day) async {
    // TODO: implement saveOrder
    throw UnimplementedError();
  }
}
