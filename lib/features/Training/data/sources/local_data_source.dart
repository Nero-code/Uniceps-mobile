import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Training/data/models/presence_model.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';
import 'package:uniceps/features/Training/services/entities/avatar.dart';

/// Abstract class [LocalTrainingSource] for SoC
abstract class LocalTrainingSource {
  Future<TrainingProgramModel> getTrainingProgram();
  Future<void> saveTrainingProgram(TrainingProgramModel model);
  Future<Map<String, double>> getWeights();
  Future<void> saveNewWeight(Map<String, double> val);
  Future<List<PresenceModel>> getPresence(String gymId);
  Future<void> savePresenceUnderGym(List<PresenceModel> list, String gymId);
  Future<Avatar> getAvatar();
}

class LocalTrainingSourceImpl implements LocalTrainingSource {
  final Box<Map<dynamic, dynamic>> trainBox;
  final Box<double> lastWBox;

  LocalTrainingSourceImpl({required this.trainBox, required this.lastWBox});

  @override
  Future<TrainingProgramModel> getTrainingProgram() async {
    final routine = trainBox.get(HIVE_TRAINING_BOX);
    // var weightsRes = lastWBox.get(HIVE_LAST_WEIGHT_BOX);
    Map<String, double> weights = {};
    if (routine == null || routine.isEmpty) {
      throw EmptyCacheExeption();
    }
    for (var i in lastWBox.keys) {
      weights.addAll({"$i": lastWBox.get(i) ?? 0});
    }
    return TrainingProgramModel.fromJson(routine, weights);
  }

  @override
  Future<void> saveTrainingProgram(TrainingProgramModel model) async {
    await trainBox.put(HIVE_TRAINING_BOX, model.toJson());
  }

  @override
  Future<void> saveNewWeight(Map<String, double> val) async {
    await lastWBox.put(val.keys.first, val.values.first);
  }

  @override
  Future<void> savePresenceUnderGym(
      List<PresenceModel> list, String gymId) async {
    final map = <String, dynamic>{};
    final jsonList = <Map<String, dynamic>>[];
    for (var i in list) {
      jsonList.add(i.toJson());
    }
    map.addAll({gymId: jsonList});

    await trainBox.put("Presence", map);
  }

  @override
  Future<List<PresenceModel>> getPresence(String gymId) async {
    final res = trainBox.get("Presence");
    final list = <PresenceModel>[];
    if (res != null) {
      for (var i in res[gymId]) {
        list.add(PresenceModel.fromJson(i));
      }
      return list;
    } else {
      throw EmptyCacheExeption();
    }
  }

  @override
  Future<Avatar> getAvatar() {
    // TODO: implement getAvatar
    throw UnimplementedError();
  }

  @override
  Future<Map<String, double>> getWeights() async {
    print("Inside local getWeight:");
    final Map<String, double> weights = {};
    for (var i in lastWBox.keys) {
      weights.addAll({"$i": lastWBox.get(i) as double});
    }
    print("weights: $weights");
    return weights;
  }
}
