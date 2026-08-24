import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/services/internet_client/http_client_helper.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/logging/app_logger.dart';

abstract class IMeasurementsRemoteSource {
  Future<List<MeasurementModel>> getMeasurements({DateTime? since});
  Future<int> uploadMeasurement(MeasurementModel measurement);
}

class MeasurementsRemoteSource implements IMeasurementsRemoteSource {
  final HttpClientHelper _clientHelper;
  const MeasurementsRemoteSource({required HttpClientHelper clientHelper}) : _clientHelper = clientHelper;

  @override
  Future<List<MeasurementModel>> getMeasurements({DateTime? since}) async {
    final hasValidToken = await _clientHelper.tokenService.isTokenValid();
    return await _clientHelper.getListHandler(
      ApiRoutes.domain,
      ApiRoutes.measurements,
      MeasurementModel.fromJson,
      needsHeader: hasValidToken,
      queryParams: since != null ? {'since': since.toIso8601String()} : null,
    );
  }

  @override
  Future<int> uploadMeasurement(MeasurementModel measurement) async {
    return await _clientHelper.postHandler(
      ApiRoutes.domain,
      ApiRoutes.measurements,
      measurement.toJson(),
      fromJson: (json) {
        logger.d(json);
        return json['apiId'];
      },
    );
  }
}
