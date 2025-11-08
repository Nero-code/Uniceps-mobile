import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IMeasurementContract {
  Future<Either<Failure, List<Measurement>>> getMeasurements();
  Future<Either<Failure, Unit>> createMeasurement(Measurement m);
  Future<Either<Failure, Unit>> updateMeasurement(Measurement m);
  Future<Either<Failure, Unit>> deleteMeasurement(Measurement m);
}
