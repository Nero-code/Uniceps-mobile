import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/data/models/measurement_model.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';

//  Gyms:
//    "gymId": {
//      "gymId": String,
//      "isCurrent": bool,            // \
//      "name": String,               //  > Type (Gym)
//      "logo": String(img URL),      // /
//    }
//
//
//
//  Subs:
//    "gymId":
//    [
//      { Subscription.toJson() },
//    ]
//
//
//
//  Metricss:
//    "gymId":
//    [
//      { Measurment.toJson() },
//    ]

abstract class LocalProfileSource {
  Future<List<Measurement>> getMeasurements(String gymId);
  Future<void> saveMeasurements(String gymId, List<MeasurementModel> list);
  Future<Player> getProfileData();
  Future<void> savePlayerData(PlayerModel model);
  Future<List<Subscription>> getSubs(String gymId);
  Future<void> saveSubs(String gymId, List<SubscriptionModel> list);
  Future<List<GymModel>> getGyms();
  Future<void> saveGyms(List<GymModel> list);
}

class LocalProfileSourceImpl implements LocalProfileSource {
  final Box<Map<String, dynamic>> playerBox;
  final Box<Map<String, dynamic>> gymsBox;
  final Box<List<Map<String, dynamic>>> subsBox;
  final Box<List<Map<String, dynamic>>> measurBox;

  LocalProfileSourceImpl({
    required this.gymsBox,
    required this.subsBox,
    required this.measurBox,
    required this.playerBox,
  });

  @override
  Future<List<Measurement>> getMeasurements(String gymId) async {
    final list = <Measurement>[];
    final res = measurBox.get(gymId);

    if (res != null) {
      res.forEach((e) {
        list.add(MeasurementModel.fromJson(e));
      });
      return list;
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> saveMeasurements(
      String gymId, List<MeasurementModel> list) async {
    return await measurBox.put(
      gymId,
      [for (var i in list) i.toJson()],
    );
  }

  // Future<void> changeLanguage({required Lang lang}) async {
  //   await box.put(
  //     "prefs",
  //     {
  //       "lang": lang,
  //     },
  //   );
  // }
  @override
  Future<Player> getProfileData() async {
    final res = playerBox.get(HIVE_PROFILE_BOX);
    if (res != null) {
      return PlayerModel.fromJson(res);
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> savePlayerData(PlayerModel model) async {
    return await playerBox.put(HIVE_PROFILE_BOX, model.toJson());
  }

  @override
  Future<List<Subscription>> getSubs(String gymId) async {
    final res = subsBox.get(gymId);
    final list = <Subscription>[];
    if (res != null) {
      for (var i in res) {
        list.add(SubscriptionModel.fromJson(i));
      }
      return list;
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> saveSubs(String gymId, List<SubscriptionModel> list) async {
    return await subsBox.put(gymId, [for (var i in list) i.toJson()]);
  }

  @override
  Future<List<GymModel>> getGyms() async {
    final list = <GymModel>[];
    final res = gymsBox.toMap();

    if (res.isEmpty) {
      throw EmptyCacheExeption();
    }

    res.forEach((key, value) {
      list.add(GymModel.fromJson(value));
    });
    return list;
  }

  @override
  Future<void> saveGyms(List<GymModel> list) async {
    for (var i in list) {
      await gymsBox.put(i.gymId, i.toJson());
    }
  }
}
