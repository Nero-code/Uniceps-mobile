import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/contracts/profile_repo/i_measurement_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class MeasurementsRepo implements IMeasurementContract {
  MeasurementsRepo({required this.localSource, required this.logger});
  final IMeasurementsLocalSource localSource;
  final Logger logger;

  final List<Measurement> buffer = [];
  @override
  Future<Either<Failure, List<Measurement>>> getMeasurements() async {
    try {
      if (buffer.isNotEmpty) return Right(buffer);

      final res = await localSource.getMeasurements();
      if (res.isEmpty) return const Left(EmptyCacheFailure(errorMessage: ""));
      buffer.addAll(res.map((m) => m.toEntity()).toList());

      return Right(buffer);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: "errorMsg"));
    }
  }

  @override
  Future<Either<Failure, Unit>> createMeasurement(Measurement m) async {
    // TODO: implement createMeasurement
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateMeasurement(Measurement m) async {
    // TODO: implement updateMeasurement
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteMeasurement(Measurement m) async {
    // TODO: implement deleteMeasurement
    throw UnimplementedError();
  }
}
