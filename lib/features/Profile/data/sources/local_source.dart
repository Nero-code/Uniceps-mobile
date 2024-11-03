import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
// import 'package:uniceps/features/Profile/data/models/handshake_model.dart';
import 'package:uniceps/features/Profile/data/models/measurement_model.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';
import 'package:uniceps/features/Profile/domain/classes/attendence.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Profile/domain/classes/player_in_gym.dart';

abstract class LocalProfileSource {
  Future<List<MeasurementModel>> getMeasurements();
  Future<void> saveMeasurements(List<MeasurementModel> list);
  Future<PlayerModel> getProfileData();
  Future<void> savePlayerData(PlayerModel model);
  Future<List<SubscriptionModel>> getSubs(String gymId);
  Future<void> saveSubs(String gymId, List<SubscriptionModel> list);
  Future<List<GymModel>> getGyms();
  Future<void> saveGyms(List<GymModel> list);
  // Future<List<HandShakeModel>> getAllHandshakes();
  // Future<void> saveHandshakes(List<HandShakeModel> list);
  Future<List<Attendence>> getAttendenceAtGym(String gymId);
  Future<void> saveAttenenceAtGym(String gymId, List<Attendence> list);
  Future<List<GymModel>> getSubscribedToGyms();
  Future<PlayerInGym> getPlayerInGym(String gymId);
  Future<void> savePlayerInGym(PlayerInGym playerInGym);
}

class LocalProfileSourceImpl implements LocalProfileSource {
  final Box<Map<dynamic, dynamic>> gymsBox,
      myGyms,
      playerProfilesBox,
      playerBox,
      handshakesBox,
      measurBox;
  final Box<List<dynamic>> subsBox, attendBox;
  final Box<bool> selectedGym;
  final Logger logger;

  LocalProfileSourceImpl({
    required this.gymsBox,
    required this.myGyms,
    required this.selectedGym,
    required this.subsBox,
    required this.measurBox,
    required this.playerBox,
    required this.playerProfilesBox,
    required this.handshakesBox,
    required this.attendBox,
    required this.logger,
  });

  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    final list = <MeasurementModel>[];
    for (var i in measurBox.keys) {
      list.add(MeasurementModel.fromJson(measurBox.get(i)!));
    }

    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }
    list.sort((a, b) {
      return b.checkDate.compareTo(a.checkDate);
    });
    return list;
  }

  @override
  Future<void> saveMeasurements(List<MeasurementModel> list) async {
    for (var i in list) {
      logger.d(i.checkDate.toString());
      await measurBox.put(i.checkDate.toString(), i.toJson());
    }
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
  Future<PlayerModel> getProfileData() async {
    logger.d(" --> getProfileData");
    final res = playerBox.get(HIVE_PROFILE_BOX);
    if (res != null) {
      logger.d("NOT NULL: $res");
      return PlayerModel.fromJson(res);
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> savePlayerData(PlayerModel model) async {
    return await playerBox.put(HIVE_PROFILE_BOX, model.toJson());
  }

  @override
  Future<List<SubscriptionModel>> getSubs(String gymId) async {
    logger.d("LocalSubsCheck");
    final res = subsBox.get(gymId);
    final list = <SubscriptionModel>[];
    if (res != null) {
      logger.d("Local --> Subs --> ${res.runtimeType}");
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
      await gymsBox.put(i.id, i.toJson());
    }
  }

  // @override
  // Future<List<HandShakeModel>> getAllHandshakes() async {
  //   final list = <HandShakeModel>[];
  //   for (var i in handshakesBox.keys) {
  //     list.add(HandShakeModel.fromJson(Map.from(handshakesBox.get(i)!)));
  //   }
  //   if (list.isEmpty) {
  //     throw EmptyCacheExeption();
  //   }
  //   return list;
  // }

  // @override
  // Future<void> saveHandshakes(List<HandShakeModel> list) async {
  //   for (var i in list) {
  //     await handshakesBox.put(i.gymId, i.toJson());
  //   }
  // }

  @override
  Future<List<Attendence>> getAttendenceAtGym(String gymId) async {
    if (!attendBox.containsKey(gymId)) {
      throw EmptyCacheExeption();
    }
    final res = <Attendence>[];
    final list = attendBox.get(gymId)!;
    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }
    for (var i in list) {
      res.add(Attendence.fromJson(i));
    }
    return res;
  }

  @override
  Future<void> saveAttenenceAtGym(String gymId, List<Attendence> list) async {
    final temp = <Map>[];
    for (var i in list) {
      temp.add(i.toJson());
    }
    await attendBox.put(gymId, temp);
  }

  @override
  Future<List<GymModel>> getSubscribedToGyms() async {
    final list = <GymModel>[];
    for (var i in myGyms.keys) {
      list.add(GymModel.fromJson(myGyms.get(i)!));
    }
    if (list.isEmpty) {
      return [];
    }
    for (var i in list) {
      logger.d("DEBUG: GET SUBS TO GYMS: ${i.toJson()}");
      if (i.isSelected) {
        list.remove(i);
        list.insert(0, i);
      }
    }
    return list;
  }

  @override
  Future<PlayerInGym> getPlayerInGym(String gymId) async {
    if (playerProfilesBox.containsKey(gymId)) {
      final res = playerProfilesBox.get(gymId)!;
      logger.d("PLAYER IN GYM: $res");
      return PlayerInGym.fromJson(res);
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> savePlayerInGym(PlayerInGym playerInGym) async {
    await playerProfilesBox.put(playerInGym.gymId, playerInGym.toJson());
  }
}
