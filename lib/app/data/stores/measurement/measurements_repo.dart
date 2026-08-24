import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/contracts/profile/i_measurement_service.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/physical_calculators.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class MeasurementsRepo implements IMeasurementContract {
  MeasurementsRepo({required this.localSource, required this.profileLocalSource});
  final IMeasurementsLocalSource localSource;
  final IProfileLocalSource profileLocalSource;

  final List<Measurement> buffer = [];
  @override
  Future<Either<MeasurementFailure, List<Measurement>>> getMeasurements() async {
    try {
      if (buffer.isNotEmpty) return Right(buffer);
      final res = await localSource.getMeasurements();
      //
      if (res.isEmpty) return const Left(MeasurementFailure.noRecords());
      //
      res.sort((a, b) => b.checkDate.compareTo(a.checkDate));
      buffer.addAll(res.map((m) => m.toEntity()).toList());
      return Right(buffer);
    } catch (e) {
      logger.e('Error: getMeasurements', error: e);
      return const Left(MeasurementFailure.msDbFailure());
    }
  }

  @override
  Future<Either<MeasurementFailure, Unit>> createMeasurement(Measurement m) async {
    try {
      final id = await localSource.saveMeasurement(MeasurementModel.fromEntity(m));
      buffer
        ..add(m.copyWith(id: id))
        ..sort((a, b) => b.checkDate.compareTo(a.checkDate));

      return const Right(unit);
    } catch (e) {
      logger.e('Error: createMeasurement', error: e);
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
        ..add(m)
        ..sort((a, b) => b.checkDate.compareTo(a.checkDate));
      return const Right(unit);
    } catch (e) {
      logger.e('Error: updateMeasurement', error: e);
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
      logger.e('Error: deleteMeasurement', error: e);
      return const Left(MeasurementFailure.msDbFailure());
    }
  }

  @override
  Future<double?> getCalories() async {
    try {
      final res = await localSource.getMeasurements();
      final profile = await profileLocalSource.getProfileData();
      if (res.isEmpty) return null;

      res.sort((a, b) => b.checkDate.compareTo(a.checkDate));
      buffer.addAll(res.map((m) => m.toEntity()).toList());
      final m = buffer.first;
      final bmr = calculateBMR(weight: m.weight, height: m.height, age: profile.age, gender: profile.gender);
      return bmr;
    } catch (e) {
      logger.e('Error: getMeasurements', error: e);
      return null;
    }
  }
}
