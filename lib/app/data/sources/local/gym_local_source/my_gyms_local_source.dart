import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';
import 'package:uniceps/app/data/models/profile_models/gym_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IMyGymsLocalSource {
  // MyGyms Responsibility
  Future<List<GymModel>> getSubscribedToGyms();
  Future<void> cacheSubsToGyms(List<GymModel> list);

  Future<List<GymModel>> setSelectedGym(String gymId);

  Future<PlayerInGym> getPlayerInGym(String gymId);
  Future<void> savePlayerInGym(PlayerInGym playerInGym);
}

class MyGymsDBService implements IMyGymsLocalSource {
  final Box<Map<dynamic, dynamic>> myGyms, playerProfilesBox;
  final Logger logger;

  MyGymsDBService({
    required this.myGyms,
    required this.playerProfilesBox,
    required this.logger,
  });

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
  Future<void> cacheSubsToGyms(List<GymModel> list) async {
    logger.t("Cacheing MyGyms: ${list.length}");

    final List<GymModel> localList = [];
    for (var key in myGyms.keys) {
      localList.add(GymModel.fromJson(myGyms.get(key)!));
    }
    logger.t("LocalList: ${localList.length}");
    for (var i in list) {
      if (localList.contains(i)) {
        final map = i.toJson();

        map.addAll(
          {
            "isSelected": localList[localList.indexOf(i)].isSelected,
            "isCurrent": localList[localList.indexOf(i)].isCurrent,
          },
        );
        final updatedGym = GymModel.fromJson(map);
        logger.t("Removing GYMMODEL ITEM: " "${localList.remove(i)}");
        localList.add(updatedGym);
        await myGyms.put(i.id, map);
        continue;
      }
      await myGyms.put(i.id, i.toJson());
      localList.add(i);
    }
    // return localList;
  }

  @override
  Future<List<GymModel>> setSelectedGym(String gymId) async {
    logger.t("DEBUG: SET 1");
    if (!myGyms.containsKey(gymId)) {
      throw EmptyCacheExeption();
    }
    logger.t("DEBUG: SET 2");
    final List<GymModel> list = [];
    for (var key in myGyms.keys) {
      logger.t("DEBUG: SET 3 isCurrent: ${myGyms.get(key)!['id'] == gymId}");
      await myGyms.put(
        key,
        {
          ...myGyms.get(key)!,
          // "isSelected": myGyms.get(key)!['id'] == gymId,
          "isCurrent": myGyms.get(key)!['id'] == gymId,
        },
      );
      logger.t("Current gym: ${myGyms.get(key)}");
      list.add(GymModel.fromJson(myGyms.get(key)!));
      logger.t("DEBUG: SET 4");
    }
    logger.t("DEBUG: SET 5 $list");
    if (list.isEmpty) {
      throw EmptyCacheExeption();
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
