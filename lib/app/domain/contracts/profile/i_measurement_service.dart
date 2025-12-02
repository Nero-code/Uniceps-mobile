import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IMeasurementContract {
  Future<Either<MeasurementFailure, List<Measurement>>> getMeasurements();
  Future<Either<MeasurementFailure, Unit>> createMeasurement(Measurement m);
  Future<Either<MeasurementFailure, Unit>> updateMeasurement(Measurement m);
  Future<Either<MeasurementFailure, Unit>> deleteMeasurement(Measurement m);
}
