abstract class LocalDataSource {
  Future<void> getTrainingProgram() async {}
  Future<void> getPlayerSubscriptions() async {}
  Future<void> getPlayerMeasurments() async {}
}

class LocalSourceImpl implements LocalDataSource {
  @override
  Future<void> getPlayerMeasurments() {
    // TODO: implement getPlayerMeasurments
    throw UnimplementedError();
  }

  @override
  Future<void> getPlayerSubscriptions() {
    // TODO: implement getPlayerSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<void> getTrainingProgram() {
    // TODO: implement getTrainingProgram
    throw UnimplementedError();
  }
}
