import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/contracts/profile_repo/i_measurement_service.dart';
import 'package:uniceps/app/data/sources/local/dal_profile_local_source/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/remote/profile_remote_source/measurements_remote_source.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';

class MeasurementsRepository implements IMeasurementService {
  const MeasurementsRepository({
    required this.local,
    required this.remote,
    required this.connection,
    required this.logger,
  });

  final IMeasurementsLocalSource local;
  final IMeasurementsRemoteSource remote;
  final InternetConnectionChecker connection;
  final Logger logger;

  @override
  Future<Either<Failure, List<Measurement>>> getMeasurement() async {
    if (await connection.hasConnection) {
      // logger.d("Connected");
      try {
        final res = await remote.getMeasurements();
        await local.saveMeasurements(res);
        return Right(res);
      } on EmptyCacheExeption {
        return const Left(EmptyMeasureFailure(errorMessage: ""));
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        logger.e(
          "server exception",
          error: StackTrace.current,
        );
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        logger.f("profile repo --> remote get measurements unknown error",
            error: e);
        return Left(GeneralPurposFailure(errorMessage: "something went wrong"));
      }
    } else {
      try {
        final res = await local.getMeasurements();
        return Right(res);
      } on EmptyCacheExeption {
        return const Left(
            EmptyCacheFailure(errorMessage: "No Measurments saved"));
      } catch (e) {
        logger.f("Profile repo local get measurements", error: e);
        return Left(
            GeneralPurposFailure(errorMessage: "UNknown Err: ${e.toString()}"));
      }
    }
  }
}
