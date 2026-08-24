import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/profile_models/extensions.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IMeasurementsLocalSource {
  // Measurements Responsibility
  Future<List<MeasurementModel>> getMeasurements();
  Future<int> saveMeasurement(MeasurementModel m);
  Future<void> upsertMeasurement(MeasurementModel m);
  Future<void> deleteMeasurement(MeasurementModel m);

  // Sync
  Future<List<MeasurementModel>> getAllUnSyncedMeasurements();
  Future<DateTime?> getLastMeasurementSync();
}

class MeasurementsLocalSource implements IMeasurementsLocalSource {
  MeasurementsLocalSource({required this.database, required this.logger});
  final Logger logger;
  final AppDatabase database;

  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    final res = await database.select(database.measurements).get();
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
  Future<void> upsertMeasurement(MeasurementModel m) async {
    final companion = MeasurementsCompanion(
      id: m.id != null ? Value(m.id!) : const Value.absent(),
      apiId: m.apiId != null ? Value(m.apiId!) : const Value.absent(),
      height: Value(m.height),
      weight: Value(m.weight),
      lArm: Value(m.lArm),
      rArm: Value(m.rArm),
      lHumerus: Value(m.lHumerus),
      rHumerus: Value(m.rHumerus),
      lThigh: Value(m.lThigh),
      rThigh: Value(m.rThigh),
      lLeg: Value(m.lLeg),
      rLeg: Value(m.rLeg),
      neck: Value(m.neck),
      shoulders: Value(m.shoulders),
      waist: Value(m.waist),
      chest: Value(m.chest),
      hips: Value(m.hips),
      checkDate: Value(m.checkDate),
      version: Value(m.version),
      isSynced: Value(m.isSynced),
    );

    await database
        .into(database.measurements)
        .insert(companion, onConflict: DoUpdate((old) => companion, target: [database.measurements.id]));
  }

  @override
  Future<void> deleteMeasurement(MeasurementModel m) async {
    await (database.delete(database.measurements)..where((f) => f.id.equals(m.id!))).go();
  }

  @override
  Future<List<MeasurementModel>> getAllUnSyncedMeasurements() async {
    final query = database.select(database.measurements)..where((tbl) => tbl.isSynced.not());
    final res = await query.get();
    return res.map(MeasurementModel.fromTable).toList();
  }

  @override
  Future<DateTime?> getLastMeasurementSync() async {
    final query = database.selectOnly(database.measurements)..addColumns([database.measurements.checkDate.max()]);
    final result = await query.getSingle();
    return result.read(database.measurements.checkDate.max());
  }
}
