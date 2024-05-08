import 'dart:convert';

import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/data/models/measurement_model.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import "package:http/http.dart" as http;
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';

abstract class RemoteProfileSource {
  Future<Player> getProfileData();
  Future<List<Measurement>> getMeasurements(String gymId);
  Future<List<Subscription>> getSubs(String gymId);
  Future<List<GymModel>> getGyms();
}

class RemoteProfileSourceImpl implements RemoteProfileSource {
  final http.Client _client;

  RemoteProfileSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<Player> getProfileData() async {
    final res = await _client.get(Uri.http(API, "/player", {}), headers: {});
    if (res.statusCode == 200) {
      return PlayerModel.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
    }
    throw Exception();
  }

  @override
  Future<List<Measurement>> getMeasurements(String gymId) async {
    final res = await _client.get(Uri.http(API, "/metrics", {}), headers: {});
    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body)['data'] as List<Map<String, dynamic>>;
      final list = <Measurement>[];
      temp.map((e) => list.add(MeasurementModel.fromJson(e)));
      return list;
    }
    throw Exception();
  }

  @override
  Future<List<Subscription>> getSubs(String gymId) async {
    final res = await _client.get(Uri.http(API, "/subscriptions", {}));
    final list = <Subscription>[];
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body)['data'] as List<Map<String, dynamic>>;
      body.map((e) => list.add(SubscriptionModel.fromJson(e)));
      return list;
    }
    throw Exception();
  }

  @override
  Future<List<GymModel>> getGyms() async {
    final list = <GymModel>[];
    final res = await _client.get(Uri.http(API, "/gyms", {}));

    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body) as List;
      temp.forEach((element) => list.add(GymModel.fromJson(element)));
      return list;
    }
    throw Exception();
  }
}
