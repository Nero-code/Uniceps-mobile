import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/domain/models/training_models/training_prog_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';

abstract class ITrainingLocalSource {
  // Training Resposibility
  Future<TrainingProgramModel> getTrainingProgram(String gymId);
  Future<void> saveTrainingProgram(TrainingProgramModel model);
  Future<bool> deleteTrainingProgram(String gymId);

  // Weights Resposibility
  Future<Map<String, double>> getWeights();
  Future<void> saveNewWeight(Map<String, double> val);
}

class TrainingDBService implements ITrainingLocalSource {
  const TrainingDBService({
    required this.trainBox,
    required this.lastWBox,
    required this.cacheManager,
    required this.logger,
  });

  final Box<Map<dynamic, dynamic>> trainBox;
  final Box<double> lastWBox;
  final ImageCacheManager cacheManager;
  final Logger logger;

  final title = "TrainingDBService";

  @override
  Future<TrainingProgramModel> getTrainingProgram(String gymId) async {
    logger.t("$title --> getTrainingProgram");
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

  /// @TODO: Needs Refactoring:
  ///
  /// FIRST: needs the ability to store [LastTrainingDay]
  /// inside the model in database, this mekes the maintinance
  /// easier for the long term and provides clean seperations of responsibility
  ///
  @override
  Future<void> saveTrainingProgram(TrainingProgramModel model) async {
    logger.t("$title --> saveTrainingProgram");
    final old = trainBox.get(model.gymId);
    if (old != null && old['created_at'] != model.createdAt.toIso8601String()) {
      final cache = await SharedPreferences.getInstance();
      await cache.clear();
    }
    await trainBox.put(model.gymId, model.toJson());
  }

  @override
  Future<Map<String, double>> getWeights() async {
    logger.t("$title --> getWeight:");
    final Map<String, double> weights = {};
    for (var i in lastWBox.keys) {
      weights.addAll({"$i": lastWBox.get(i) as double});
    }
    // logger.t("weights: $weights");
    return weights;
  }

  /// REFACTOR IDEA ~~~~~~ (NO)
  ///
  /// we may need to put wieghts within the excersise model directly,
  /// this means we need an exersises box to store them in, which in
  /// turn need synchronization with API
  ///
  @override
  Future<void> saveNewWeight(Map<String, double> val) async {
    logger.t("$title --> saveNewWeight:");
    await lastWBox.put(val.keys.first, val.values.first);
  }

  @override
  Future<bool> deleteTrainingProgram(String gymId) async {
    logger.t("$title --> deleteTrainingProgram:");
    await trainBox.delete(gymId);
    return true;
  }
}
