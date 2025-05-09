import 'package:flutter/foundation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';

class ExerciseV2Dto extends ExerciseV2 implements BaseDTO {
  const ExerciseV2Dto({
    super.id,
    required super.apiId,
    required super.muscleGroupId,
    required super.name,
    required super.imageUrl,
    required super.imageBitMap,
  });

  factory ExerciseV2Dto.fromJson(Map<String, dynamic> json) => ExerciseV2Dto(
        // id: json['id'],
        apiId: json['id'],
        muscleGroupId: json['muscleGroupId'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        imageBitMap: null,
      );

  factory ExerciseV2Dto.fromTable(Exercise exercise, ExerciseGroup group,
          String imageUrl, Uint8List? imageBitMap) =>
      ExerciseV2Dto(
          id: exercise.id,
          apiId: exercise.apiId,
          muscleGroupId: group.apiId,
          name: exercise.name,
          imageUrl: imageUrl,
          imageBitMap: imageBitMap);

  ExerciseV2Dto copywith({
    int? id,
    int? apiId,
    int? muscleGroupId,
    String? name,
    String? imageUrl,
    Uint8List? imageBitMap,
  }) =>
      ExerciseV2Dto(
          id: id ?? this.id,
          apiId: apiId ?? this.apiId,
          muscleGroupId: muscleGroupId ?? this.muscleGroupId,
          name: name ?? this.name,
          imageUrl: imageUrl ?? this.imageUrl,
          imageBitMap: imageBitMap ?? this.imageBitMap);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'apiId': apiId,
        'muscleGroupId': muscleGroupId,
        'name': name,
        'imageUrl': imageUrl,
        'imageBitMap': imageBitMap,
      };
}
