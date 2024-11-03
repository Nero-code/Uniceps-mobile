import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
import 'package:uniceps/app/Profile/data/models/gym_model.dart';
import 'package:uniceps/app/Training/data/models/training_prog_model.dart';

/// Abstract class [LocalTrainingSource] for SoC
abstract class LocalTrainingSource {
  Future<TrainingProgramModel> getTrainingProgram(String gymId);
  Future<void> saveTrainingProgram(TrainingProgramModel model);
  Future<Map<String, double>> getWeights();
  Future<void> saveNewWeight(Map<String, double> val);

  Future<List<GymModel>> getSubscribedToGyms();
  Future<List<GymModel>> cacheSubsToGyms(List<GymModel> list);
  Future<List<GymModel>> setSelectedGym(String gymId);

  Future<bool> deleteTrainingProgram(String gymId);
}

class LocalTrainingSourceImpl implements LocalTrainingSource {
  final Box<Map<dynamic, dynamic>> trainBox, handshakesBox, myGyms;
  final Box<double> lastWBox;
  final ImageCacheManager cacheManager;
  final Logger logger;

  LocalTrainingSourceImpl({
    required this.trainBox,
    required this.lastWBox,
    required this.handshakesBox,
    required this.myGyms,
    required this.cacheManager,
    required this.logger,
  });

  @override
  Future<TrainingProgramModel> getTrainingProgram(String gymId) async {
    logger.t("Local_S --> getTrainingProgram");
    final routine = trainBox.get(gymId);
    // var weightsRes = lastWBox.get(HIVE_LAST_WEIGHT_BOX);
    Map<String, double> weights = {};
    if (routine == null || routine.isEmpty) {
      throw NoTrainingProgramException();
    }
    logger.t("training Program not null!");
    for (var i in lastWBox.keys) {
      // logger.t("weight: ${lastWBox.get(i)}");
      weights.addAll({"$i": lastWBox.get(i) ?? 0});
    }
    logger.t("routine: ${routine.entries}");
    final images = await cacheManager.getLocalImages(routine['routine_items']);
    return TrainingProgramModel.fromJson(
        json: routine, weights: weights, images: images);
  }

  @override
  Future<void> saveTrainingProgram(TrainingProgramModel model) async {
    final old = trainBox.get(model.gymId);
    if (old != null && old['created_at'] != model.createdAt.toIso8601String()) {
      final cache = await SharedPreferences.getInstance();
      await cache.clear();
    }
    await trainBox.put(model.gymId, model.toJson());
  }

  @override
  Future<Map<String, double>> getWeights() async {
    logger.t("Inside local getWeight:");
    final Map<String, double> weights = {};
    for (var i in lastWBox.keys) {
      weights.addAll({"$i": lastWBox.get(i) as double});
    }
    // logger.t("weights: $weights");
    return weights;
  }

  @override
  Future<void> saveNewWeight(Map<String, double> val) async {
    await lastWBox.put(val.keys.first, val.values.first);
  }

  /// Throws [EmptyCacheExeption]
  @override
  Future<List<GymModel>> getSubscribedToGyms() async {
    final list = <GymModel>[];
    for (var i in myGyms.keys) {
      list.add(GymModel.fromJson(myGyms.get(i)!));
    }
    if (list.isEmpty) {
      throw NotAMemberOfGymException();
    }
    for (var i in list) {
      if (i.isSelected) {
        list.remove(i);
        list.insert(0, i);
      }
    }
    for (var i in list) {
      if (i.isCurrent) {
        list.remove(i);
        list.insert(0, i);
        break;
      }
    }
    return list;
  }

  @override
  Future<List<GymModel>> cacheSubsToGyms(List<GymModel> list) async {
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
    return localList;
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
  Future<bool> deleteTrainingProgram(String gymId) async {
    await trainBox.delete(gymId);
    return true;
  }
}
