import 'package:uniceps/features/Training/services/entities/training_program.dart';

class TrainingProgramModel extends TrainingProgram {
  TrainingProgramModel(
      {required super.id, required super.name, required super.program});

  factory TrainingProgramModel.fromJson(Map<String, dynamic> json) {
    return TrainingProgramModel(
      id: json['id'],
      name: json['name'],
      program: json['program'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'program': program,
    };
  }
}
