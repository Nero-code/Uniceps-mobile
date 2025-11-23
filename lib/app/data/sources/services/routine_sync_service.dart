abstract class RoutineSyncContract {
  void start();
  void dispose();
}

class RoutineSyncService implements RoutineSyncContract {
  Future<void> syncRoutines() async {}

  Future<void> syncDays() async {}

  Future<void> syncItems() async {}

  @override
  void start() {}

  @override
  void dispose() {}
}
