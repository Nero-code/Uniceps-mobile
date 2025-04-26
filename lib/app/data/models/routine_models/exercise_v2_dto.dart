import 'package:flutter/foundation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

class ExerciseV2Dto extends ExerciseV2 implements BaseDTO {
  const ExerciseV2Dto({
    required super.id,
    required super.apiId,
    required super.muscleGroup,
    required super.name,
    required super.imageUrl,
    required super.imageBitMap,
  });

  factory ExerciseV2Dto.fromJson(Map<String, dynamic> json) => ExerciseV2Dto(
        id: json['id'],
        apiId: json['apiId'],
        muscleGroup: json['muscleGroup'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        imageBitMap: null,
      );

  factory ExerciseV2Dto.fromTable(Exercise exercise, ExerciseGroup group,
          String imageUrl, Uint8List? imageBitMap) =>
      ExerciseV2Dto(
          id: exercise.id,
          apiId: exercise.apiId,
          muscleGroup: MuscleGroup.fromTable(group),
          name: exercise.name,
          imageUrl: imageUrl,
          imageBitMap: imageBitMap);

  ExerciseV2Dto copywith({
    int? id,
    int? apiId,
    MuscleGroup? muscleGroup,
    String? name,
    String? imageUrl,
    Uint8List? imageBitMap,
  }) =>
      ExerciseV2Dto(
          id: id ?? this.id,
          apiId: apiId ?? this.apiId,
          muscleGroup: muscleGroup ?? this.muscleGroup,
          name: name ?? this.name,
          imageUrl: imageUrl ?? this.imageUrl,
          imageBitMap: imageBitMap ?? this.imageBitMap);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'apiId': apiId,
        'muscleGroup': muscleGroup,
        'name': name,
        'imageUrl': imageUrl,
        'imageBitMap': imageBitMap,
      };
}
