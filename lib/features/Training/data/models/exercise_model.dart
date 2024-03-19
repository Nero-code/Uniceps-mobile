import 'package:uniceps/features/Training/services/entities/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.id,
    required super.name,
    required super.tId,
    required super.imageUrl,
    required super.description,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      tId: json['tId'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tId': tId,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
