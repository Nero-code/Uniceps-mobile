import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Profile/data/models/handshake_model.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';

/// Abstract class [LocalTrainingSource] for SoC
abstract class LocalTrainingSource {
  Future<TrainingProgramModel> getTrainingProgram(String gymId);
  Future<void> saveTrainingProgram(TrainingProgramModel model);
  Future<Map<String, double>> getWeights();
  Future<void> saveNewWeight(Map<String, double> val);

  Future<void> saveHandshakes(List<HandShakeModel> list);
  Future<List<GymModel>> getSubscribedToGyms();
  Future<List<GymModel>> cacheSubsToGyms(List<GymModel> list);
  Future<List<GymModel>> setSelectedGym(String gymId);
}

class LocalTrainingSourceImpl implements LocalTrainingSource {
  final Box<Map<dynamic, dynamic>> trainBox, handshakesBox, myGyms;
  final Box<double> lastWBox;

  final ImageCacheManager cacheManager;

  LocalTrainingSourceImpl({
    required this.trainBox,
    required this.lastWBox,
    required this.handshakesBox,
    required this.myGyms,
    required this.cacheManager,
  });

  @override
  Future<TrainingProgramModel> getTrainingProgram(String gymId) async {
    print("Local_S --> getTrainingProgram");
    final routine = trainBox.get(gymId);
    // var weightsRes = lastWBox.get(HIVE_LAST_WEIGHT_BOX);
    Map<String, double> weights = {};
    if (routine == null || routine.isEmpty) {
      throw EmptyCacheExeption();
    }
    print("training Program not null!");
    for (var i in lastWBox.keys) {
      // print("weight: ${lastWBox.get(i)}");
      weights.addAll({"$i": lastWBox.get(i) ?? 0});
    }
    print("routine: ${routine.entries}");
    final images = await cacheManager.getLocalImages(routine['routine_items']);
    return TrainingProgramModel.fromJson(
        json: routine, weights: weights, images: images);
  }

  @override
  Future<void> saveTrainingProgram(TrainingProgramModel model) async {
    await trainBox.put(model.gymId, model.toJson());
  }

  @override
  Future<Map<String, double>> getWeights() async {
    print("Inside local getWeight:");
    final Map<String, double> weights = {};
    for (var i in lastWBox.keys) {
      weights.addAll({"$i": lastWBox.get(i) as double});
    }
    // print("weights: $weights");
    return weights;
  }

  @override
  Future<void> saveNewWeight(Map<String, double> val) async {
    await lastWBox.put(val.keys.first, val.values.first);
  }

  @override
  Future<void> saveHandshakes(List<HandShakeModel> list) async {
    for (var i in list) {
      await handshakesBox.put(i.gymId, i.toJson());
    }
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
    print("Cacheing MyGyms: ${list.length}");

    final List<GymModel> localList = [];
    for (var key in myGyms.keys) {
      localList.add(GymModel.fromJson(myGyms.get(key)!));
    }
    print("LocalList: ${localList.length}");
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
        print("Removing GYMMODEL ITEM: " "${localList.remove(i)}");
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
    print("DEBUG: SET 1");
    if (!myGyms.containsKey(gymId)) {
      throw EmptyCacheExeption();
    }
    print("DEBUG: SET 2");
    final List<GymModel> list = [];
    for (var key in myGyms.keys) {
      print("DEBUG: SET 3 isCurrent: ${myGyms.get(key)!['id'] == gymId}");
      await myGyms.put(
        key,
        {
          ...myGyms.get(key)!,
          // "isSelected": myGyms.get(key)!['id'] == gymId,
          "isCurrent": myGyms.get(key)!['id'] == gymId,
        },
      );
      print("Current gym: ${myGyms.get(key)}");
      list.add(GymModel.fromJson(myGyms.get(key)!));
      print("DEBUG: SET 4");
    }
    print("DEBUG: SET 5 $list");
    if (list.isEmpty) {
      throw EmptyCacheExeption();
    }
    return list;
  }
}
