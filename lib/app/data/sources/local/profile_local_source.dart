import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/models/profile_models/subscription_model.dart';
import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/app/data/models/profile_models/gym_model.dart';
import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';

abstract class LocalProfileSource {
  // Measurements Responsibility
  Future<List<MeasurementModel>> getMeasurements(); // MIGRATION DONE
  Future<void> saveMeasurements(List<MeasurementModel> list); // MIGRATION DONE

  // Profile Responsibility
  Future<PlayerModel> getProfileData(); // MIGRATION DONE
  Future<void> savePlayerData(PlayerModel model); // MIGRATION DONE

  // Subscriptions Responsibility
  Future<List<SubscriptionModel>> getSubs(String gymId); // MIGRATION DONE
  Future<void> saveSubs(
      String gymId, List<SubscriptionModel> list); // MIGRATION DONE

  // Gyms Responsibility
  Future<List<GymModel>> getGyms(); // MIGRATION DONE
  Future<void> saveGyms(List<GymModel> list); // MIGRATION DONE

  // Attendence Responsibility
  Future<List<Attendence>> getAttendenceAtGym(String gymId); // MIGRATION DONE
  Future<void> saveAttendenceAtGym(
      String gymId, List<Attendence> list); // MIGRATION DONE

  // MyGyms Responsibility
  Future<List<GymModel>> getSubscribedToGyms(); // MIGRATION DONE
  Future<PlayerInGym> getPlayerInGym(String gymId); // MIGRATION DONE
  Future<void> savePlayerInGym(PlayerInGym playerInGym); // MIGRATION DONE
}

class LocalProfileSourceImpl implements LocalProfileSource {
  final Box<Map<dynamic, dynamic>> gymsBox,
      myGyms,
      playerProfilesBox,
      playerBox,
      handshakesBox,
      measureBox;
  final Box<List<dynamic>> subsBox, attendBox;
  final Box<bool> selectedGym;
  final Logger logger;

  LocalProfileSourceImpl({
    required this.gymsBox,
    required this.myGyms,
    required this.selectedGym,
    required this.subsBox,
    required this.measureBox,
    required this.playerBox,
    required this.playerProfilesBox,
    required this.handshakesBox,
    required this.attendBox,
    required this.logger,
  });

  /// fetches data from [measureBox] based on:
  ///
  /// Node [ID] : Value [Map]
  @override
  Future<List<MeasurementModel>> getMeasurements() async {
    final list = <MeasurementModel>[];
    for (var i in measureBox.keys) {
      list.add(MeasurementModel.fromJson(measureBox.get(i)!));
    }

    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }
    list.sort((a, b) {
      return b.checkDate.compareTo(a.checkDate);
    });
    return list;
  }

  /// Caches Measurements based on:
  ///
  /// Node [ID] : Value [Map]
  @override
  Future<void> saveMeasurements(List<MeasurementModel> list) async {
    logger.d("saveMsList ${list.length}");
    await measureBox.clear();
    for (var i in list) {
      await measureBox.put(i.id, i.toJson());
    }
  }

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
    // final list = <GymModel>[];
    // final res = gymsBox.toMap();
    // if (res.isEmpty) {
    //   throw EmptyCacheExeption();
    // }
    // res.forEach((key, value) {
    //   list.add(GymModel.fromJson(value));
    // });
    // return list;

    final list = <GymModel>[];
    for (var key in gymsBox.keys) {
      list.add(GymModel.fromJson(gymsBox.get(key)!));
    }

    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }

    return list;
  }

  @override
  Future<void> saveGyms(List<GymModel> list) async {
    await gymsBox.clear();
    for (var i in list) {
      await gymsBox.put(i.id, i.toJson());
    }
  }

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
  Future<void> saveAttendenceAtGym(String gymId, List<Attendence> list) async {
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
