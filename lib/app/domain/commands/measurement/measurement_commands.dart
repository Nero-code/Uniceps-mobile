import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/profile_repo/i_measurement_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class MeasurementCommands implements ICommand {
  final IMeasurementContract _repo;

  const MeasurementCommands({required IMeasurementContract repo}) : _repo = repo;

  Future<Either<MeasurementFailure, List<Measurement>>> getMeasurements() => _repo.getMeasurements();
  Future<Either<MeasurementFailure, Unit>> createMeasurements(Measurement m) => _repo.createMeasurement(m);
  Future<Either<MeasurementFailure, Unit>> updateMeasurements(Measurement m) => _repo.updateMeasurement(m);
  Future<Either<MeasurementFailure, Unit>> deleteMeasurements(Measurement m) => _repo.deleteMeasurement(m);
}
