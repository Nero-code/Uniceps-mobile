import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IMeasurementsRemoteSource {
  Future<List<MeasurementModel>> getMeasurements();
}

class MeasurementsAPISource implements IMeasurementsRemoteSource {
  const MeasurementsAPISource({
    required http.Client client,
    required this.userBox,
    required this.logger,
  }) : _client = client;

  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Logger logger;

  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    logger.t("inside getMeasurements");

    final res =
        await _client.get(Uri.parse("$API" "$HTTP_MEASURMENTS"), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!['token']}",
    });

    logger.t(
      "measurements status code: ${res.statusCode}"
      "\n"
      "measurements body: ${res.body}"
      "\n"
      "measurements headers: ${res.headers}",
    );
    // logger.t("measurements: ${res.body}");

    if (res.statusCode == 200) {
      logger.t(res.body);

      final temp = jsonDecode(res.body) as List<dynamic>;

      final list = <MeasurementModel>[];
      for (Map<String, dynamic> i in temp) {
        list.add(MeasurementModel.fromJson(i));
      }
      list.sort((a, b) {
        return b.checkDate.compareTo(a.checkDate);
      });
      logger.t("check 2: Data sort successful");
      return list;
    } else if (res.statusCode == 204) {
      throw EmptyCacheExeption();
    }
    throw ServerException();
  }
}
