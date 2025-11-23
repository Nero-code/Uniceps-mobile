import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/contracts/profile/i_measurement_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class MeasurementsRepo implements IMeasurementContract {
  MeasurementsRepo({required this.localSource, required this.logger});
  final IMeasurementsLocalSource localSource;
  final Logger logger;

  final List<Measurement> buffer = [];
  @override
  Future<Either<MeasurementFailure, List<Measurement>>> getMeasurements() async {
    try {
      if (buffer.isNotEmpty) return Right(buffer);
      final res = await localSource.getMeasurements();
      //
      if (res.isEmpty) return const Left(MeasurementFailure.noRecords());
      //
      buffer.addAll(res.map((m) => m.toEntity()).toList());
      return Right(buffer);
    } catch (e) {
      return const Left(MeasurementFailure.msDbFailure());
    }
  }

  @override
  Future<Either<MeasurementFailure, Unit>> createMeasurement(Measurement m) async {
    try {
      final id = await localSource.saveMeasurement(MeasurementModel.fromEntity(m));
      buffer.add(m.copyWith(id: id));
      return const Right(unit);
    } catch (e) {
      return const Left(MeasurementFailure.msDbFailure());
    }
  }

  @override
  Future<Either<MeasurementFailure, Unit>> updateMeasurement(Measurement m) async {
    try {
      final model = MeasurementModel.fromEntity(m);
      await localSource.saveMeasurement(model);
      buffer.removeWhere((e) => e.id == model.id);
      buffer
        ..add(model.toEntity())
        ..sort();
      return const Right(unit);
    } catch (e) {
      return const Left(MeasurementFailure.msDbFailure());
    }
  }

  @override
  Future<Either<MeasurementFailure, Unit>> deleteMeasurement(Measurement m) async {
    try {
      await localSource.deleteMeasurement(MeasurementModel.fromEntity(m));
      buffer.removeWhere((e) => e.id == m.id);
      return const Right(unit);
    } catch (e) {
      return const Left(const MeasurementFailure.msDbFailure());
    }
  }
}
