import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/app/Auth/data/models/player_model.dart';
import 'package:uniceps/app/Profile/data/models/measurement_model.dart';
import 'package:uniceps/app/Profile/data/models/subscription_model.dart';
import 'package:uniceps/app/Profile/domain/classes/attendence.dart';
import "package:http/http.dart" as http;
import 'package:uniceps/app/Profile/data/models/gym_model.dart';
import 'package:uniceps/app/Profile/domain/classes/player_in_gym.dart';

abstract class RemoteProfileSource {
  Future<PlayerModel> getProfileData();
  Future<String> submitProfileData(PlayerModel playerModel,
      {required bool isCreate});
  Future<List<MeasurementModel>> getMeasurements();
  Future<List<SubscriptionModel>> getSubs(String gymId, String pid);
  Future<List<GymModel>> getGyms();
  // Future<List<HandShakeModel>> getAllHandshake();
  Future<List<Attendence>> getAllAttendance(String gymId, String pid);
  Future<List<GymModel>> getSubscribedToGyms();
  Future<PlayerInGym> getPlayerInGym(String gymId, String pid);
}

class RemoteProfileSourceImpl implements RemoteProfileSource {
  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox, playerBox;
  final Logger logger;

  RemoteProfileSourceImpl({
    required http.Client client,
    required this.userBox,
    required this.playerBox,
    required this.logger,
  }) : _client = client;

  @override
  Future<PlayerModel> getProfileData() async {
    logger.t("REMOTE-S: GetProfileData()" "\n" "$API$HTTP_PLAYER_INFO");
    // logger.t("HIVE PlayerBox : ${playerBox.get(HIVE_PROFILE_BOX)}");

    final res = await _client.get(Uri.parse("$API$HTTP_PLAYER_INFO"), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!["token"]}",
    });

    logger.t("Remote_S profile res statusCode: ${res.statusCode}");
    logger.t("Remote_S profile res body: ${res.body}");
    if (res.statusCode == 200) {
      return PlayerModel.fromJson({
        ...jsonDecode(res.body),
        "email": userBox.get(HIVE_USER_BOX)!['email']
      });
    }
    throw Exception();
  }

// 2024-07-20 14:42:53.030212
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

  @override
  Future<List<SubscriptionModel>> getSubs(String gymId, String pid) async {
    logger.t("Profile ->  RemoteS -> getSubs -> URL: /$gymId/$pid");

    if (pid.isEmpty) {
      throw EmptyCacheExeption();
    }
    final res =
        await _client.get(Uri.parse("$API$HTTP_SUBSCRIPTIONS/$gymId/$pid"));
    final list = <SubscriptionModel>[];
    logger.t(res.statusCode);
    if (res.statusCode == 200) {
      logger.t("Subs: ${res.body}");
      logger.t(jsonDecode(res.body).runtimeType);

      final subsList = jsonDecode(res.body) as List<dynamic>;

      logger.t("check 3");
      for (var i in subsList) {
        list.add(SubscriptionModel.fromJson(i));
      }
      logger.t("check 4");
      return list;
    } else if (res.statusCode == 204) {
      throw EmptyCacheExeption();
    }
    throw ServerException();
  }

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
  Future<List<Attendence>> getAllAttendance(String gymId, String pid) async {
    if (pid.isEmpty) {
      throw NoAttendenceLogFoundException();
    }
    final res = await _client.get(
      Uri.parse("$API$HTTP_PRESENCE/$gymId/$pid"),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
      },
    );
    logger.t("attenence code: ${res.statusCode}");

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List<dynamic>;
      final list = <Attendence>[];
      for (var i in data) {
        list.add(Attendence.fromJson(i));
      }
      logger.t(list);

      return list;
    } else if (res.statusCode == 204) {
      throw NoAttendenceLogFoundException();
    }

    throw ServerException();
  }

  // @override
  // Future<List<HandShakeModel>> getAllHandshake() async {
  //   logger.t(
  //       "check 1 inside getAllhandshake: Playerbox.get(): ${playerBox.get(HIVE_PROFILE_BOX)}");
  //   final temp = <HandShakeModel>[];
  //   final res = await _client.get(
  //     Uri.parse(
  //         "$API$HTTP_HANDSHAKE/${playerBox.get(HIVE_PROFILE_BOX)!['uid']}"),
  //     headers: {
  //       ...HEADERS,
  //       "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
  //     },
  //     // body: jsonEncode({
  //     //   "gym_id": 11,
  //     //   "uid": 336563653,
  //     //   "pid": 123456789,
  //     // }
  //     // )
  //   );
  //   logger.t(res.statusCode);
  //   logger.t(res.body);
  //   if (res.statusCode == 200) {
  //     for (var i in jsonDecode(res.body)) {
  //       temp.add(HandShakeModel.fromJson(i));
  //     }
  //     return temp;
  //   } else if (res.statusCode == 204) {
  //     throw NoGymSpecifiedException();
  //   }
  //   throw ServerException();
  // }

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
