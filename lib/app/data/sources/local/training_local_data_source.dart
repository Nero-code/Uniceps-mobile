import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
import 'package:uniceps/app/data/models/profile_models/gym_model.dart';
import 'package:uniceps/app/data/models/training_models/training_prog_model.dart';

/// Abstract class [LocalTrainingSource] for SoC
abstract class LocalTrainingSource {
  // Training Resposibility
  Future<TrainingProgramModel> getTrainingProgram(
      String gymId); // MIGRATION DONE
  Future<void> saveTrainingProgram(
      TrainingProgramModel model); // MIGRATION DONE
  Future<bool> deleteTrainingProgram(String gymId); // MIGRATION DONE

  // Weights Resposibility
  Future<Map<String, double>> getWeights(); // MIGRATION DONE
  Future<void> saveNewWeight(Map<String, double> val); // MIGRATION DONE

  // Duplicated Resposibility
  Future<List<GymModel>>
      getSubscribedToGyms(); // Duplicated    // MIGRATION DONE
  Future<List<GymModel>> cacheSubsToGyms(
      List<GymModel> list); // Duplicated   // MIGRATION DONE
  Future<List<GymModel>> setSelectedGym(String gymId); // MIGRATION DONE
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

  /// Caches List of Gyms the player has joined.
  ///
  /// Preserves the state of the gym at the local level such as
  /// the [isSelected] and [isCurrent] properties.
  ///
  /// [Read More](/home/posiden/Data/Flutter_Apps/uniceps/lib/app/domain/classes/profile_classes/gym.dart)
  @override
  Future<List<GymModel>> cacheSubsToGyms(List<GymModel> list) async {
    /// Caching gyms is a little bit tricky, Because:
    ///
    /// First, We need to get the list of already stored MyGyms in the system,
    /// and these models have an important property called [isSelected / isCurrent]
    ///
    /// Then, we must update all gyms while preserving the [isSelected] and
    /// [isCurrent] state.
    /// thank goodness that this property is singular and not some advanced model
    /// managing for the current gym.
    ///
    /// NOTE: isSelected property is used to seperate Gyms from MyGyms in BLoC
    logger.t("Cacheing MyGyms: ${list.length}");

    final List<GymModel> localList = [];

    /// Here we fetch all local MyGyms and store them in [localList]
    for (var key in myGyms.keys) {
      localList.add(GymModel.fromJson(myGyms.get(key)!));
    }
    logger.t("LocalList: ${localList.length}");
    for (var i in list) {
      /// Then we check if the gym already exists locally.
      if (localList.contains(i)) {
        /// If so, we take the isSelected and isCurrent properties from element
        /// [i] in [list] and add it to temporary [map]
        final map = i.toJson();
        map.addAll({
          "isSelected": localList[localList.indexOf(i)].isSelected,
          "isCurrent": localList[localList.indexOf(i)].isCurrent,
        });

        /// Create a new updated object with the old [is]Flags
        final updatedGym = GymModel.fromJson(map);

        logger.t("Removing GYM-MODEL ITEM:");

        /// Replace the old item with the updated item, and push changes to
        /// HIVE database
        localList.remove(i);
        localList.add(updatedGym);
        await myGyms.put(i.id, map);

        /// Continue is used so the rest of the `for` loop is ignored
        continue;
      }

      /// If Not, then just add it without any changes
      await myGyms.put(i.id, i.toJson());
      localList.add(i);
    }
    return localList;
  }

  /// Updates a Gym to become **Current**.
  ///
  /// Checks for *availablity*  >>  ABSURD
  ///
  /// Throws [EmptyCacheExeption].
  @override
  Future<List<GymModel>> setSelectedGym(String gymId) async {
    logger.t("DEBUG: SET 1");
    if (!myGyms.containsKey(gymId)) {
      ///
      /// In What World Would This Execute???
      ///
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
