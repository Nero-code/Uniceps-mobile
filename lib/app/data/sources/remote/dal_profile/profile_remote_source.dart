import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IProfileRemoteSource {
  Future<String> submitProfileData(PlayerModel playerModel,
      {required bool isCreate});
  // Future<void> uploadPlayerInfo({required PlayerModel player});
  Future<PlayerModel> getPlayerInfo();
}

class ProfileAPISource implements IProfileRemoteSource {
  const ProfileAPISource({
    required http.Client client,
    required this.userBox,
    required this.logger,
  }) : _client = client;

  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Logger logger;

  @override
  Future<String> submitProfileData(PlayerModel playerModel,
      {required bool isCreate}) async {
    logger.t("REMOTE-S: Submit Profile --> Check 1!");
    if (isCreate) {
      logger.t("REMOTE-S: Submit Profile --> Check 2.1!");
      // logger.t("REMOTE-S: Submit Profile --> Check 2.1!: $HEADERS");
      // logger.t("REMOTE-S: Box ${userBox.get("user")!["id"]}");
      // logger.t("REMOTE-S: player model: ${playerModel.toJson()}");
      final res = await _client.post(
        Uri.parse(API + HTTP_PLAYER_INFO),
        headers: {
          ...HEADERS,
          // "Authorization": "Bearer ${userBox.get("user")!["token"]}",
          "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
        },
        body: jsonEncode(playerModel.toJson()),
      );
      logger.t("SubmitProfile : POST");
      logger.t("res statusCode: ${res.statusCode}");
      logger.t("res body: ${res.body}");
      if (res.statusCode == 201) {
        return jsonDecode(res.body)['profile_info']['uid'];
      }
    } else {
      logger.t("REMOTE-S: Submit Profile --> Check 2.2!");
      logger.t("SubmitProfile : PUT");
      final res = await _client.put(
        Uri.parse(API + HTTP_PLAYER_INFO),
        headers: {
          ...HEADERS,
          "x-access-token": "${userBox.get("user")!["token"]}",
        },
        body: jsonEncode(playerModel.toJson()),
      );

      logger.t("res: ${res.statusCode}");
      logger.t("res body: ${res.body}");

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['user_info']['uid'];
      }
    }
    throw ServerException();
  }

  @override
  Future<PlayerModel> getPlayerInfo() async {
    logger.d("inside GetPlayerInfo");
    logger.d(userBox.get(HIVE_USER_BOX)!["token"]);
    final res = await _client.get(Uri.parse(API + HTTP_PLAYER_INFO), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!["token"]}",
    });
    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body);
      logger.d("PlayerProfile: ${{
        ...temp,
        "email": userBox.get(HIVE_USER_BOX)!['email']
      }}");
      return PlayerModel.fromJson(
          {...temp, "email": userBox.get(HIVE_USER_BOX)!['email']});
    }
    throw ServerException();
  }
}
