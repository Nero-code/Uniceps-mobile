import 'package:intl/intl.dart';
import 'package:uniceps/features/Training/data/models/exercise_model.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';

class TrainingProgramModel extends TrainingProgram {
  TrainingProgramModel({
    required super.id,
    required super.gymId,
    required super.pid,
    required super.createdAt,
    required super.daysGroupMap,
    required super.exercises,
  });

  factory TrainingProgramModel.fromJson(
      Map<dynamic, dynamic> json, Map<String, double> weights) {
    final List<ExerciseModel> list = [];
    print("-----------------PROB FOR TRAINING PROGRAM--------------");
    print("id:             ${json['rid'].runtimeType}");
    print("gymId:          ${json['gym_id'].runtimeType}");
    print("pid:            ${json['pid'].runtimeType}");
    print("routine_date:   ${json['routine_date'].runtimeType}");
    print("days_group_map: ${json['days_group_map'].runtimeType}");

    for (Map<String, dynamic> i in json['routine_items']) {
      i.addAll({'lastWaight': weights["${i['id']}"] ?? 0.0});
      list.add(ExerciseModel.fromJson(i));
    }
    // list.sort((a, b) => a.muscleGroup.compareTo(b.muscleGroup));

    list.sort((a, b) => a.itemOrder.compareTo(b.itemOrder));

    return TrainingProgramModel(
      id: "${json['rid']}",
      gymId: json['gym_id'],
      pid: json['pid'],
      createdAt: DateFormat("yyyy-MM-dd").parse(json['routine_date']),
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
      'routine_date': DateFormat("yyyy-MM-dd").format(createdAt),
      'days_group_map': daysGroupMap,
      'routine_items': list,
    };
  }
}
