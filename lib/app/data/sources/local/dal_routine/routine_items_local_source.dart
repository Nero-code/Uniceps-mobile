import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';

abstract class IRoutineItemsLocalSourceContract {
  //  R O U T I N E   I T E M S   S E C T I O N
  Future<List<RoutineItemDto>> getItemsByDay(int dayId);
  Future<void> addItems(List<RoutineItemDto> list);
  Future<void> reorderItems(List<RoutineItemDto> list);
  Future<void> removeItem(RoutineItemDto item);
}

class RoutineItemsLocalSourceImpl implements IRoutineItemsLocalSourceContract {
  @override
  Future<void> addItems(List<RoutineItemDto> list) {
    // TODO: implement addItems
    throw UnimplementedError();
  }

  @override
  Future<List<RoutineItemDto>> getItemsByDay(int dayId) {
    // TODO: implement getItemsByDay
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem(RoutineItemDto item) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<void> reorderItems(List<RoutineItemDto> list) {
    // TODO: implement reorderItems
    throw UnimplementedError();
  }
}
