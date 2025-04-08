abstract class RoutineSyncContract {
  Future<void> syncRoutines();
  Future<void> syncDays();
  Future<void> syncItems();
}

class RoutineSyncService implements RoutineSyncContract {
  @override
  Future<void> syncRoutines() async {}
  @override
  Future<void> syncDays() async {}
  @override
  Future<void> syncItems() async {}
}
