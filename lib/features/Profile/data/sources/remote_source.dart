import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Profile/data/models/handshake_model.dart';
import 'package:uniceps/features/Profile/data/models/measurement_model.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import "package:http/http.dart" as http;
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';

abstract class RemoteProfileSource {
  Future<PlayerModel> getProfileData();
  Future<Unit> submitProfileData(PlayerModel playerModel,
      {required bool isCreate});
  Future<List<Measurement>> getMeasurements();
  Future<List<Subscription>> getSubs(String gymId);
  Future<List<GymModel>> getGyms();
  Future<List<HandShakeModel>> getAllHandshake();
  Future<List<Attendence>> getAllAttendance(String gymId);
}

class RemoteProfileSourceImpl implements RemoteProfileSource {
  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Box<Map<dynamic, dynamic>> playerBox;

  RemoteProfileSourceImpl({
    required http.Client client,
    required this.userBox,
    required this.playerBox,
  }) : _client = client;

  @override
  Future<PlayerModel> getProfileData() async {
    print("REMOTE-S: GetProfileData()");
    print("$API$HTTP_PLAYER_INFO");
    print(playerBox.get(HIVE_PROFILE_BOX));
    print("HIVE: Passed!!!");

    final res = await _client.get(Uri.parse("$API$HTTP_PLAYER_INFO"), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!["token"]}",
    });

    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200) {
      return PlayerModel.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
    }
    throw Exception();
  }

// 2024-07-20 14:42:53.030212
  @override
  Future<List<Measurement>> getMeasurements() async {
    print("inside getMeasurements");

    final res = await _client.get(Uri.parse("$API$HTTP_MEASURMENTS"), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!['token']}",
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      print("check 0");
      print(res.body);

      //
      //  temp is not of type list but rather of type Map
      //
      try {
        final temp = jsonDecode(res.body) as List<dynamic>;
      } catch (e) {
        print(e.toString());
      }
      print("after try catch phrase");
      final temp = [jsonDecode(res.body)];
      print("check 1: Data parse successful");
      final list = <Measurement>[];
      // temp.map((e) =>
      //     list.add(MeasurementModel.fromJson(e as Map<String, dynamic>)));
      for (Map<String, dynamic> i in temp) {
        list.add(MeasurementModel.fromJson(i));
      }
      list.sort((a, b) {
        return b.checkDate.compareTo(a.checkDate);
      });
      print("check 2: Data sort successful");
      return list;
    } else if (res.statusCode == 204) {
      return [];
    }
    throw Exception();
  }

  @override
  Future<List<Subscription>> getSubs(String gymId) async {
    print("inside Get Subscriptions");
    // final res = await _client.get(Uri.parse("$API$HTTP_SUBSCRIPTIONS/$gymId/${playerBox.get(HIVE_PROFILE_BOX)!['pid']}"));

    final res = await _client
        .get(Uri.parse("$API$HTTP_SUBSCRIPTIONS/$gymId/123456789"));
    final list = <Subscription>[];
    print(res.statusCode);
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body) as List<Map<String, dynamic>>;
      body.map((e) => list.add(SubscriptionModel.fromJson(e, [])));
      return list;
    } else if (res.statusCode == 204) {
      return [];
    }
    throw Exception();
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
      print("GetGyms: ${res.body}");
      final temp = jsonDecode(res.body) as List;
      temp.forEach((element) => list.add(GymModel.fromJson(element)));
      print(temp);
      return list;
    }
    throw Exception();
  }

  @override
  Future<Unit> submitProfileData(PlayerModel playerModel,
      {required bool isCreate}) async {
    print("REMOTE-S: Submit Profile --> Check 1!");
    if (isCreate) {
      print("REMOTE-S: Submit Profile --> Check 2.1!");
      print("REMOTE-S: Submit Profile --> Check 2.1!: $HEADERS");
      print("REMOTE-S: Box ${userBox.get("user")!["id"]}");
      print("REMOTE-S: player model: ${playerModel.toJson()}");
      final res = await _client.post(
        Uri.parse(API + HTTP_PLAYER_INFO),
        headers: {
          ...HEADERS,
          // "Authorization": "Bearer ${userBox.get("user")!["token"]}",
          "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
        },
        body: jsonEncode(playerModel.toJson()),
      );
      print(res.statusCode);
      if (res.statusCode == 201) {
        return unit;
      }
    } else {
      print("REMOTE-S: Submit Profile --> Check 2.2!");
      final res = await _client.put(
        Uri.parse(API + HTTP_PLAYER_INFO),
        headers: {
          ...HEADERS,
          "x-access-token": "${userBox.get("user")!["token"]}",
        },
        body: jsonEncode(playerModel.toJson()),
      );
      print("res: ${res.statusCode}");
      if (res.statusCode == 200) {
        return unit;
      }
    }
    throw ServerException();
  }

  @override
  Future<List<Attendence>> getAllAttendance(String gymId) async {
    final res = await _client.post(
      Uri.parse("$API$HTTP_PRESENCE/$gymId"),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
      },
    );
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200) {
      return [];
    } else if (res.statusCode == 204) {
      return [];
    }
    throw Exception();
  }

  @override
  Future<List<HandShakeModel>> getAllHandshake() async {
    print(
        "check 1 inside getAllhandshake: Playerbox.get(): ${playerBox.get(HIVE_PROFILE_BOX)}");
    final temp = <HandShakeModel>[];
    final res = await _client.get(
      Uri.parse(
          "$API$HTTP_HANDSHAKE/${playerBox.get(HIVE_PROFILE_BOX)!['uid']}"),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
      },
      // body: jsonEncode({
      //   "gym_id": 11,
      //   "uid": 336563653,
      //   "pid": 123456789,
      // }
      // )
    );
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200) {
      for (var i in jsonDecode(res.body)) {
        temp.add(HandShakeModel.fromJson(i));
      }
      return temp;
    }
    throw ServerException();
  }
}
