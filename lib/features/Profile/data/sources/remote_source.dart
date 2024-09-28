import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Profile/data/models/handshake_model.dart';
import 'package:uniceps/features/Profile/data/models/measurement_model.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import "package:http/http.dart" as http;
import 'package:uniceps/features/Profile/data/models/gym_model.dart';

abstract class RemoteProfileSource {
  Future<PlayerModel> getProfileData();
  Future<String> submitProfileData(PlayerModel playerModel,
      {required bool isCreate});
  Future<List<MeasurementModel>> getMeasurements();
  Future<List<SubscriptionModel>> getSubs(String gymId);
  Future<List<GymModel>> getGyms();
  Future<List<HandShakeModel>> getAllHandshake();
  Future<List<Attendence>> getAllAttendance(String gymId);
  Future<List<GymModel>> getSubscribedToGyms();
}

class RemoteProfileSourceImpl implements RemoteProfileSource {
  final http.Client _client;
  final Box<Map<dynamic, dynamic>> userBox, playerBox, handshakesBox;

  RemoteProfileSourceImpl({
    required http.Client client,
    required this.userBox,
    required this.playerBox,
    required this.handshakesBox,
  }) : _client = client;

  @override
  Future<PlayerModel> getProfileData() async {
    print("REMOTE-S: GetProfileData()");
    print("$API$HTTP_PLAYER_INFO");
    // print("HIVE PlayerBox : ${playerBox.get(HIVE_PROFILE_BOX)}");

    final res = await _client.get(Uri.parse("$API$HTTP_PLAYER_INFO"), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!["token"]}",
    });

    print("Remote_S profile res statusCode: ${res.statusCode}");
    print("Remote_S profile res body: ${res.body}");
    if (res.statusCode == 200) {
      return PlayerModel.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
    }
    throw Exception();
  }

// 2024-07-20 14:42:53.030212
  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    print("inside getMeasurements");

    final res = await _client.get(Uri.parse("$API$HTTP_MEASURMENTS"), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!['token']}",
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      print(res.body);

      final temp = jsonDecode(res.body) as List<dynamic>;

      final list = <MeasurementModel>[];
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
  Future<List<SubscriptionModel>> getSubs(String gymId) async {
    print("inside Get Subscriptions");
    if (!handshakesBox.containsKey(gymId)) {
      throw EmptyCacheExeption();
    }
    print(
        "Profile ->  RemoteS -> getSubs -> URL: /$gymId/${handshakesBox.get(gymId)!['pid']}");
    final res = await _client.get(Uri.parse(
        "$API$HTTP_SUBSCRIPTIONS/$gymId/${handshakesBox.get(gymId)!['pid']}"));
    final list = <SubscriptionModel>[];
    print(res.statusCode);
    if (res.statusCode == 200) {
      print(res.body);
      print(jsonDecode(res.body).runtimeType);

      final subsList = jsonDecode(res.body) as List<dynamic>;

      print("check 3");
      for (var i in subsList) {
        list.add(SubscriptionModel.fromJson(i));
      }
      print("check 4");
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
      print("GetGyms: ${res.body}");
      final temp = jsonDecode(res.body) as List;
      temp.forEach((element) => list.add(GymModel.fromJson(element)));
      print(temp);
      return list;
    }
    throw Exception();
  }

  @override
  Future<String> submitProfileData(PlayerModel playerModel,
      {required bool isCreate}) async {
    print("REMOTE-S: Submit Profile --> Check 1!");
    if (isCreate) {
      print("REMOTE-S: Submit Profile --> Check 2.1!");
      // print("REMOTE-S: Submit Profile --> Check 2.1!: $HEADERS");
      // print("REMOTE-S: Box ${userBox.get("user")!["id"]}");
      // print("REMOTE-S: player model: ${playerModel.toJson()}");
      final res = await _client.post(
        Uri.parse(API + HTTP_PLAYER_INFO),
        headers: {
          ...HEADERS,
          // "Authorization": "Bearer ${userBox.get("user")!["token"]}",
          "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
        },
        body: jsonEncode(playerModel.toJson()),
      );
      print("SubmitProfile : POST");
      print("res statusCode: ${res.statusCode}");
      print("res body: ${res.body}");
      if (res.statusCode == 201) {
        return jsonDecode(res.body)['profile_info']['uid'];
      }
    } else {
      print("REMOTE-S: Submit Profile --> Check 2.2!");
      print("SubmitProfile : PUT");
      final res = await _client.put(
        Uri.parse(API + HTTP_PLAYER_INFO),
        headers: {
          ...HEADERS,
          "x-access-token": "${userBox.get("user")!["token"]}",
        },
        body: jsonEncode(playerModel.toJson()),
      );

      print("res: ${res.statusCode}");
      print("res body: ${res.body}");

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['user_info']['uid'];
      }
    }
    throw ServerException();
  }

  @override
  Future<List<Attendence>> getAllAttendance(String gymId) async {
    if (!handshakesBox.containsKey(gymId)) {
      throw NoAttendenceLogFoundException();
    }
    final res = await _client.get(
      Uri.parse(
          "$API$HTTP_PRESENCE/$gymId/${handshakesBox.get(gymId)!['pid']}"),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
      },
    );
    print("attenence code: ${res.statusCode}");

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List<dynamic>;
      final list = <Attendence>[];
      for (var i in data) {
        list.add(Attendence.fromJson(i));
      }
      print(list);

      return list;
    } else if (res.statusCode == 204) {
      return throw NoAttendenceLogFoundException();
    }

    throw ServerException();
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
    } else if (res.statusCode == 204) {
      throw NoGymSpecifiedException();
    }
    throw ServerException();
  }

  @override
  Future<List<GymModel>> getSubscribedToGyms() async {
    final response = await _client.get(
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"],
      },
      Uri.parse("$API" "$HTTP_GYMS" "/shakes"),
    );
    print("status: ${response.statusCode}");
    print("body: ${jsonDecode(response.body)}");
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
}
