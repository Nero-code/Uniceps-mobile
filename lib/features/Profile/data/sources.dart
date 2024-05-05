import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/data/measurement_model.dart';
import 'package:uniceps/features/Profile/data/subscription_model.dart';
import 'package:uniceps/features/Profile/domain/measrument.dart';
import 'package:uniceps/features/Profile/domain/subscription.dart';

// {
//   "Gyms":
//    {
//      "gym_id":
//      {
//        "metrics": [1,2,3],
//        "SubScriptions": [1,2,3],
//      }
//    }
// }

class LocalProfileSource {
  final Box<Map<String, dynamic>> box;

  LocalProfileSource({required this.box});

  Future<List<Measurement>> getMeasurements(String gymId) async {
    final list = <Measurement>[];
    final res = box.get("Gyms")?[gymId]?["metrics"];

    if (res != null) {
      for (var i in res) {
        list.add(MeasurementModel.fromJson(i));
      }
      return list;
    }
    throw EmptyCacheExeption();
  }

  Future<void> changeLanguage({required Lang lang}) async {
    await box.put(
      "prefs",
      {
        "lang": lang,
      },
    );
  }

  Future<Player> getProfileData() async {
    throw UnimplementedError();
  }

  // TODO: needs implement
  Future<List<Subscription>> getSubs() async {
    throw UnimplementedError();
  }

  Future<void> saveSubs() async {}
}

class RemoteProfileSource {
  final http.Client _client;

  RemoteProfileSource({required http.Client client}) : _client = client;

  Future<Player> getProfileData() async {
    final res =
        await _client.get(Uri.http(FAKE_API, "/player", {}), headers: {});
    if (res.statusCode == 200) {
      return PlayerModel.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
    }
    throw Exception();
  }

  Future<List<Measurement>> getMeasurements() async {
    final res =
        await _client.get(Uri.http(FAKE_API, "/metrics", {}), headers: {});
    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body)['data'] as List<Map<String, dynamic>>;
      final list = <Measurement>[];
      temp.map((e) => list.add(MeasurementModel.fromJson(e)));
      return list;
    }
    throw Exception();
  }

  Future<List<Subscription>> getSubs() async {
    final res = await _client.get(Uri.http(FAKE_API, "/subscriptions", {}));
    final list = <Subscription>[];
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['data'] as List<Map<String, dynamic>>;
      body.map((e) => list.add(SubscriptionModel.fromJson(e)));
      return list;
    }
    throw Exception();
  }
}
