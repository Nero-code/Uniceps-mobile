import 'package:flutter/foundation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart'
    as ex;

class ExerciseV2Dto {
  final int? id, apiId;
  final int muscleGroupId;
  final String name, imageUrl;
  final Uint8List? imageBitMap;
  const ExerciseV2Dto({
    this.id,
    required this.apiId,
    required this.muscleGroupId,
    required this.name,
    required this.imageUrl,
    required this.imageBitMap,
  });

  factory ExerciseV2Dto.fromEntity(ex.ExerciseV2 e) => ExerciseV2Dto(
        apiId: e.apiId,
        muscleGroupId: e.muscleGroupId,
        name: e.name,
        imageUrl: e.imageUrl,
        imageBitMap: e.imageBitMap,
      );

  ex.ExerciseV2 toEntity() => ex.ExerciseV2(
        id: id,
        apiId: apiId,
        muscleGroupId: muscleGroupId,
        name: name,
        imageUrl: imageUrl,
        imageBitMap: imageBitMap,
      );

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

  Map<String, dynamic> toJson() => {
        'id': id,
        'apiId': apiId,
        'muscleGroupId': muscleGroupId,
        'name': name,
        'imageUrl': imageUrl,
        'imageBitMap': imageBitMap,
      };
}
