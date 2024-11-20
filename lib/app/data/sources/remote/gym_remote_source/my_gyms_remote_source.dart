import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';
import 'package:uniceps/app/data/models/profile_models/gym_model.dart';
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IMyGymsRemoteSource {
  Future<List<GymModel>> getSubscribedToGyms();
  Future<PlayerInGym> getPlayerInGym(String gymId, String pid);
}

class MyGymsAPISource implements IMyGymsRemoteSource {
  const MyGymsAPISource({
    required http.Client client,
    required this.userBox,
    required this.logger,
  }) : _client = client;

  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Logger logger;

  @override
  Future<List<GymModel>> getSubscribedToGyms() async {
    final response = await _client.get(
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
      },
      Uri.parse("$API" "$HTTP_GYMS" "/shakes"),
    );
    logger.t("status: ${response.statusCode}");
    logger.t("body: ${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      final list = <GymModel>[];
      for (var i in jsonDecode(response.body)) {
        list.add(GymModel.fromJson(i));
      }

      return list;
    } else if (response.statusCode == 204) {
      throw EmptyCacheExeption();
    }
    throw ServerException();
  }

  @override
  Future<PlayerInGym> getPlayerInGym(String gymId, String pid) async {
    final res =
        await _client.get(Uri.parse("$API" "$HTTP_PLAYER" "/$gymId" "/$pid"));
    logger.t("player in gym: ${res.statusCode}");
    logger.t("player in gym: ${res.body}");

    if (res.statusCode == 200) {
      final map = jsonDecode(res.body);
      return PlayerInGym.fromJson(map);
    }
    throw NotFoundException();
  }
}
