abstract class RemoteDataSource {
  Future<void> getTrainingProgram() async {}
  Future<void> getPlayerSubscriptions() async {}
  Future<void> getPlayerMeasurments() async {}
}

class RemoteSourceImpl implements RemoteDataSource {
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
