import 'package:flutter/foundation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart' as ex;
import 'package:uniceps/core/constants/constants.dart';

class ExerciseV2Dto {
  final int apiId;
  final String name, imageUrl;
  final Map<Lang, String> muscleGroupTranslations;
  final Uint8List? imageBitMap;
  const ExerciseV2Dto({
    required this.apiId,
    required this.name,
    required this.muscleGroupTranslations,
    required this.imageUrl,
    required this.imageBitMap,
  });

  factory ExerciseV2Dto.fromEntity(ex.ExerciseV2 e) => ExerciseV2Dto(
        apiId: e.apiId,
        name: e.name,
        muscleGroupTranslations: e.muscleGroupTranslations,
        imageUrl: e.imageUrl,
        imageBitMap: e.imageBitMap,
      );

  ex.ExerciseV2 toEntity() => ex.ExerciseV2(
        apiId: apiId,
        name: name,
        muscleGroupTranslations: muscleGroupTranslations,
        imageUrl: imageUrl,
        imageBitMap: imageBitMap,
      );

  factory ExerciseV2Dto.fromJson(Map<String, dynamic> json) {
    Map<Lang, String> map = {};
    if (json['muscleGroupTranslations'] != null) {
      map = parseTranslations(json['muscleGroupTranslations']);
    }
    return ExerciseV2Dto(
      apiId: json['id'],
      name: json['name'],
      muscleGroupTranslations: map,
      imageUrl: json['imageUrl'],
      imageBitMap: null,
    );
  }

  factory ExerciseV2Dto.fromTable(Exercise exercise, String imageUrl, Uint8List? imageBitMap) => ExerciseV2Dto(
      apiId: exercise.apiId,
      name: exercise.name,
      muscleGroupTranslations: parseTranslations(exercise.muscleGroupTranslations),
      imageUrl: imageUrl,
      imageBitMap: imageBitMap);

  ExerciseV2Dto copywith({
    int? apiId,
    String? name,
    Map<Lang, String>? muscleGroupTranslations,
    String? imageUrl,
    Uint8List? imageBitMap,
  }) =>
      ExerciseV2Dto(
          apiId: apiId ?? this.apiId,
          name: name ?? this.name,
          muscleGroupTranslations: muscleGroupTranslations ?? this.muscleGroupTranslations,
          imageUrl: imageUrl ?? this.imageUrl,
          imageBitMap: imageBitMap ?? this.imageBitMap);

  Map<String, dynamic> toJson() => {
        'id': apiId,
        'name': name,
        'muscleGroupTranslations': encodeTranslations(muscleGroupTranslations),
        'imageUrl': imageUrl,
        'imageBitMap': imageBitMap,
      };
}
