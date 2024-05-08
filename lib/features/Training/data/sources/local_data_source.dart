import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Training/data/models/training_prog_model.dart';

abstract class LocalTrainingSource {
  Future<TrainingProgramModel> getTrainingProgram();
  Future<void> saveTrainingProgram(TrainingProgramModel model);
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
}
