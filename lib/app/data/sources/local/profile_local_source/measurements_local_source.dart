import 'package:uniceps/app/domain/models/profile_models/measurement_model.dart';

abstract class IMeasurementsSource {
  // Measurements Responsibility
  Future<List<MeasurementModel>> getMeasurements();
  Future<void> saveMeasurements(List<MeasurementModel> list);
}
