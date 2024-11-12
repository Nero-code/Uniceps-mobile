import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/models/profile_models/gym_model.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IGymsRemoteSource {
  Future<List<GymModel>> getGyms();
}

class GymsAPISource implements IGymsRemoteSource {
  const GymsAPISource({
    required http.Client client,
    required this.userBox,
    required this.logger,
  }) : _client = client;

  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Logger logger;

  @override
  Future<List<GymModel>> getGyms() async {
    final list = <GymModel>[];
    // return [];
    final res = await _client.get(Uri.parse("$API$HTTP_GYMS"), headers: {
      ...HEADERS,
      'x-access-token': userBox.get(HIVE_USER_BOX)!['token'],
    });

    if (res.statusCode == 200) {
      logger.t("GetGyms: ");
      logger.t(jsonDecode(res.body));
      final temp = jsonDecode(res.body) as List;
      for (var element in temp) {
        list.add(GymModel.fromJson(element));
      }
      logger.t(temp);
      return list;
    }
    throw Exception();
  }
}
