import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/profile_models/extensions.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IMeasurementsLocalSource {
  // Measurements Responsibility
  Future<List<MeasurementModel>> getMeasurements();
  Future<int> saveMeasurement(MeasurementModel m);
  Future<void> deleteMeasurement(MeasurementModel m);
}

class MeasurementsLocalSource implements IMeasurementsLocalSource {
  MeasurementsLocalSource({required this.database, required this.logger});
  final Logger logger;
  final AppDatabase database;

  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    final res = await database.select(database.measurements).get();
    if (res.isEmpty) throw EmptyCacheExeption();
    return res.map(MeasurementModel.fromTable).toList();
  }

  @override
  Future<int> saveMeasurement(MeasurementModel m) async {
    final int? newId;
    if (m.id == null) {
      newId = await database.into(database.measurements).insert(m.insertable());
      return newId;
    } else {
      await (database.update(database.measurements)..where((f) => f.id.equals(m.id!))).write(m.updatable());
      return m.id!;
    }
  }

  @override
  Future<void> deleteMeasurement(MeasurementModel m) async {
    await (database.delete(database.measurements)..where((f) => f.id.equals(m.id!))).go();
  }
}
