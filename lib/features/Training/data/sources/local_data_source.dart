import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Training/data/models/presence_model.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';

abstract class LocalTrainingSource {
  Future<TrainingProgramModel> getTrainingProgram();
  Future<void> saveTrainingProgram(TrainingProgramModel model);
  Future<List<PresenceModel>> getPresence(String gymId);
  Future<void> savePresenceUnderGym(List<PresenceModel> list, String gymId);
}

class LocalTrainingSourceImpl implements LocalTrainingSource {
  final Box<Map<String, dynamic>> trainBox;

  LocalTrainingSourceImpl({required this.trainBox});

  @override
  Future<TrainingProgramModel> getTrainingProgram() async {
    final res = trainBox.get("trainingProgram");
    if (res == null || res.isEmpty) {
      throw EmptyCacheExeption();
    }
    return TrainingProgramModel.fromJson(res);
  }

  @override
  Future<void> saveTrainingProgram(TrainingProgramModel model) async {
    await trainBox.put("trainingProgram", model.toJson());
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
}
