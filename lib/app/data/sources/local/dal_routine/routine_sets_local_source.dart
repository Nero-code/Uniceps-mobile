import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';

abstract class IRoutineSetsLocalSourceContract {
  //  R O U T I N E   S E T S   S E C T I O N
  Future<List<RoutineSetDto>> getItemSets(int itemId);
  Future<void> addSets(List<RoutineSetDto> listToAdd);
  Future<void> removeSets(List<RoutineSetDto> listToRemove);
}

class RoutineSetsLocalSourceImpl implements IRoutineSetsLocalSourceContract {
  @override
  Future<void> addSets(List<RoutineSetDto> listToAdd) {
    // TODO: implement addSets
    throw UnimplementedError();
  }

  @override
  Future<List<RoutineSetDto>> getItemSets(int itemId) {
    // TODO: implement getItemSets
    throw UnimplementedError();
  }

  @override
  Future<void> removeSets(List<RoutineSetDto> listToRemove) {
    // TODO: implement removeSets
    throw UnimplementedError();
  }
}
