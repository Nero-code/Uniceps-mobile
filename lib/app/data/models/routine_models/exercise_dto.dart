import 'package:flutter/foundation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart' as ex;

class ExerciseDto {
  final String apiId;
  final String name, imageUrl;
  // final Map<Lang, String> muscleGroupTranslations;
  final String muscleGroup;
  final Uint8List? imageBitMap;

  final int version;
  final int mediaVersion;

  const ExerciseDto({
    required this.apiId,
    required this.name,
    // required this.muscleGroupTranslations,
    required this.muscleGroup,
    required this.imageUrl,
    required this.imageBitMap,
    required this.version,
    required this.mediaVersion,
  });

  factory ExerciseDto.fromEntity(ex.Exercise e) => ExerciseDto(
    apiId: e.apiId,
    name: e.name,
    // muscleGroupTranslations: e.muscleGroupTranslations,
    muscleGroup: e.muscleGroup,
    imageUrl: e.imagePath,
    imageBitMap: e.imageBitMap,
    version: e.version,
    mediaVersion: e.mediaVersion,
  );

  ex.Exercise toEntity() => ex.Exercise(
    apiId: apiId,
    name: name,
    // muscleGroupTranslations: muscleGroupTranslations,
    muscleGroup: muscleGroup,
    imagePath: imageUrl,
    imageBitMap: imageBitMap,
    version: version,
    mediaVersion: mediaVersion,
  );

  factory ExerciseDto.fromJson(Map<String, dynamic> json) {
    // Map<Lang, String> map = {};
    // if (json['muscleGroupTranslations'] != null) {
    //   map = parseTranslations(json['muscleGroupTranslations']);
    // }
    return ExerciseDto(
      apiId: json['id'],
      name: json['name'],
      // muscleGroupTranslations: map,
      muscleGroup: json['muscleGroup'],
      imageUrl: json['imageUrl'],
      imageBitMap: null,
      version: json['version'],
      mediaVersion: json['mediaVersion'],
    );
  }
  Map<String, dynamic> toJson() => {
    'id': apiId,
    'name': name,
    // 'muscleGroupTranslations': encodeTranslations(muscleGroupTranslations),
    'muscleGroup': muscleGroup,
    'imageUrl': imageUrl,
    'imageBitMap': imageBitMap,
    'version': version,
    'mediaVersion': mediaVersion,
  };

  factory ExerciseDto.fromFile(Map<String, dynamic> json) {
    // Map<Lang, String> map = {};
    // if (json['Muscle'] != null) {
    //   map = parseTranslations(jsonEncode(json['Muscle']));
    // }
    return ExerciseDto(
      apiId: json['ExerciseId'],
      name: json['ExerciseName'],
      // muscleGroupTranslations: map,
      muscleGroup: json['ExerciseGroup'],
      imageUrl: json['ExerciseUrl'],
      imageBitMap: null,
      version: json['ExerciseVersion'],
      mediaVersion: json['ExerciseMediaVersion'],
    );
  }
  Map<String, dynamic> toFile() => {
    'ExerciseId': apiId,
    'ExerciseName': name,
    // 'Muscle': muscleGroupTranslations.map((key, value) => MapEntry(key.name, value)),
    'ExerciseUrl': imageUrl,
  };

  factory ExerciseDto.fromTable(Exercise exercise, String imageUrl, Uint8List? imageBitMap) => ExerciseDto(
    apiId: exercise.apiId,
    name: exercise.name,
    // muscleGroupTranslations: parseTranslations(exercise.muscleGroupTranslations),
    muscleGroup: exercise.muscleGroup,
    imageUrl: imageUrl,
    imageBitMap: imageBitMap,
    version: exercise.version,
    mediaVersion: exercise.mediaVersion,
  );

  ExerciseDto copyWith({
    String? apiId,
    String? name,
    // Map<Lang, String>? muscleGroupTranslations,
    String? muscleGroup,
    String? imageUrl,
    Uint8List? imageBitMap,
    int? version,
    int? mediaVersion,
  }) => ExerciseDto(
    apiId: apiId ?? this.apiId,
    name: name ?? this.name,
    // muscleGroupTranslations: muscleGroupTranslations ?? this.muscleGroupTranslations,
    muscleGroup: muscleGroup ?? this.muscleGroup,
    imageUrl: imageUrl ?? this.imageUrl,
    imageBitMap: imageBitMap ?? this.imageBitMap,
    version: version ?? this.version,
    mediaVersion: mediaVersion ?? this.mediaVersion,
  );
}
