import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IMeasurementService {
  Future<Either<Failure, List<Measurement>>> getMeasurement();
}
