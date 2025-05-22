import 'dart:typed_data';

import 'package:uniceps/app/data/models/training_models/exercise_model.dart';
import 'package:uniceps/app/domain/classes/training_entities/training_program.dart';

class TrainingProgramModel extends TrainingProgram {
  const TrainingProgramModel({
    required super.id,
    required super.gymId,
    required super.pid,
    required super.createdAt,
    required super.daysGroupMap,
    required super.exercises,
  });

  factory TrainingProgramModel.fromJson(
      {required Map<dynamic, dynamic> json,
      required Map<String, double> weights,
      required Map<String, Uint8List> images}) {
    final List<ExerciseModel> list = [];
    // print("-----------------PROB FOR TRAINING PROGRAM--------------");
    // print("id:             ${json['rid'].runtimeType}");
    // print("gymId:          ${json['gym_id'].runtimeType}");
    // print("pid:            ${json['pid'].runtimeType}");
    // print("routine_date:   ${json['routine_date'].runtimeType}");
    // print("days_group_map: ${json['days_group_map'].runtimeType}");
    // print("weights:        ${weights.runtimeType}");
    // print("images:         ${images.entries}");

    for (Map<dynamic, dynamic> e in json['routine_items']) {
      var i = Map<String, dynamic>.from(e);
      i.addAll({
        'lastWaight': weights["${e['id']}"] ?? 0.0,
        'image': images["${e['id']}"],
      });
      list.add(ExerciseModel.fromJson(i));
    }

    list.sort((a, b) => a.itemOrder.compareTo(b.itemOrder));

    return TrainingProgramModel(
      id: "${json['rid']}",
      gymId: json['gym_id'].toString(),
      pid: json['pid'].toString(),
      createdAt: DateTime.parse(json['routine_date']),
      daysGroupMap: Map<String, String>.from(json['days_group_map']),
      exercises: list,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> list = [];

    for (var i in exercises) {
      list.add(i.toJson());
    }

    return {
      'rid': id,
      'gym_id': gymId,
      'pid': pid,
      'routine_date': createdAt.toIso8601String(),
      'days_group_map': daysGroupMap,
      'routine_items': list,
    };
  }
}
