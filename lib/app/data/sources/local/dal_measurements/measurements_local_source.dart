import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IMeasurementsLocalSource {
  // Measurements Responsibility
  Future<List<MeasurementModel>> getMeasurements();
  Future<int> saveMeasurement(MeasurementModel m);
}

class MeasurementsLocalSource implements IMeasurementsLocalSource {
  MeasurementsLocalSource({required this.database, required this.logger});
  final Logger logger;
  final AppDatabase database;

  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    return List.filled(5, MeasurementModel.skank());
  }

  @override
  Future<int> saveMeasurement(MeasurementModel m) async {
    // TODO: implement saveMeasurement
    throw UnimplementedError();
  }
}
