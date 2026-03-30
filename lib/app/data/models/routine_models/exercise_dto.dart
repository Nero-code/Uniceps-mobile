import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart' as ex;

part 'exercise_dto.g.dart';

@JsonSerializable()
class ExerciseDto {
  @JsonKey(name: 'exerciseId')
  final String apiId;
  final String name;
  final String? imageUrl;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final Uint8List? imageBitMap;

  final String muscleGroupName;
  final String muscleGroupCode;

  final String muscleHeadName;
  final String muscleHeadCode;

  @JsonKey(name: 'muscleAux1')
  final String? auxMuscle1;
  @JsonKey(name: 'muscleAux2')
  final String? auxMuscle2;
  @JsonKey(name: 'muscleAux3')
  final String? auxMuscle3;
  @JsonKey(name: 'mechanism')
  final String laterals;
  @JsonKey(name: 'implementation')
  final String? description;

  @JsonKey(name: 'equipmentName')
  final String toolName;
  @JsonKey(name: 'equipmentCode')
  final String toolCode;

  @JsonKey(name: 'lastUpdated')
  final DateTime timestamp;

  const ExerciseDto({
    required this.apiId,
    required this.name,
    required this.imageUrl,
    this.imageBitMap,
    required this.muscleGroupName,
    required this.muscleGroupCode,
    required this.muscleHeadName,
    required this.muscleHeadCode,
    required this.auxMuscle1,
    required this.auxMuscle2,
    required this.auxMuscle3,
    required this.laterals,
    required this.description,
    required this.toolName,
    required this.toolCode,
    required this.timestamp,
  });

  factory ExerciseDto.fromEntity(ex.Exercise e) => ExerciseDto(
    apiId: e.apiId,
    name: e.name,
    imageUrl: e.imagePath,
    imageBitMap: e.imageBitMap,
    muscleGroupName: e.muscleGroupName,
    muscleGroupCode: e.muscleGroupCode,
    muscleHeadName: e.muscleHeadName,
    muscleHeadCode: e.muscleHeadCode,
    auxMuscle1: e.auxMuscle1,
    auxMuscle2: e.auxMuscle2,
    auxMuscle3: e.auxMuscle3,
    laterals: e.laterals,
    description: e.description,
    toolName: e.toolName,
    toolCode: e.toolCode,
    timestamp: e.timestamp,
  );

  ex.Exercise toEntity() => ex.Exercise(
    apiId: apiId,
    name: name,
    imagePath: imageUrl,
    imageBitMap: imageBitMap,
    muscleGroupName: muscleGroupName,
    muscleGroupCode: muscleGroupCode,
    muscleHeadName: muscleHeadName,
    muscleHeadCode: muscleHeadCode,
    auxMuscle1: auxMuscle1,
    auxMuscle2: auxMuscle2,
    auxMuscle3: auxMuscle3,
    laterals: laterals,
    description: description,
    toolName: toolName,
    toolCode: toolCode,
    timestamp: timestamp,
  );

  factory ExerciseDto.fromJson(Map<String, dynamic> json) => _$ExerciseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseDtoToJson(this);

  // factory ExerciseDto.fromJson(Map<String, dynamic> json) {
  //   // Map<Lang, String> map = {};
  //   // if (json['muscleGroupTranslations'] != null) {
  //   //   map = parseTranslations(json['muscleGroupTranslations']);
  //   // }
  //   return ExerciseDto(
  //     apiId: json['id'],
  //     name: json['name'],
  //     // muscleGroupTranslations: map,
  //     muscleGroupName: json['muscleGroup'],
  //     imageUrl: json['imageUrl'],
  //     imageBitMap: null,
  //     version: json['version'],
  //     mediaVersion: json['mediaVersion'],
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //   'id': apiId,
  //   'name': name,
  //   // 'muscleGroupTranslations': encodeTranslations(muscleGroupTranslations),
  //   'muscleGroup': muscleGroupName,
  //   'imageUrl': imageUrl,
  //   'imageBitMap': imageBitMap,
  //   'version': version,
  //   'mediaVersion': mediaVersion,
  // };

  factory ExerciseDto.fromFile(Map<String, dynamic> json) {
    return ExerciseDto(
      apiId: json['ExerciseId'],
      name: json['ExerciseName'],
      imageUrl: json['ExerciseUrl'],
      imageBitMap: null,
      muscleGroupName: '',
      muscleGroupCode: '',
      muscleHeadName: '',
      muscleHeadCode: '',
      auxMuscle1: null,
      auxMuscle2: null,
      auxMuscle3: null,
      laterals: '',
      description: null,
      toolName: '',
      toolCode: '',
      timestamp: DateTime.now(),
    );
  }
  Map<String, dynamic> toFile() => {'ExerciseId': apiId, 'ExerciseName': name, 'ExerciseUrl': imageUrl};

  factory ExerciseDto.fromTable(Exercise exercise, String? imageUrl, Uint8List? imageBitMap) => ExerciseDto(
    apiId: exercise.apiId,
    name: exercise.name,
    muscleGroupName: exercise.muscleGroupName,
    imageUrl: exercise.imageName,
    imageBitMap: imageBitMap,
    muscleGroupCode: exercise.muscleGroupCode,
    muscleHeadName: exercise.muscleHeadName,
    muscleHeadCode: exercise.muscleHeadCode,
    auxMuscle1: exercise.auxMuscle1,
    auxMuscle2: exercise.auxMuscle2,
    auxMuscle3: exercise.auxMuscle3,
    laterals: exercise.laterals,
    description: exercise.description,
    toolName: exercise.toolName,
    toolCode: exercise.toolCode,
    timestamp: exercise.timestamp,
  );

  ExerciseDto copyWith({
    String? apiId,
    String? name,
    String? muscleGroupName,
    String? muscleGroupCode,
    String? imageUrl,
    Uint8List? imageBitMap,
    int? version,
    int? mediaVersion,
  }) => ExerciseDto(
    apiId: apiId ?? this.apiId,
    name: name ?? this.name,
    imageUrl: imageUrl ?? this.imageUrl,
    imageBitMap: imageBitMap ?? this.imageBitMap,
    muscleGroupName: muscleGroupName ?? this.muscleGroupName,
    muscleGroupCode: muscleGroupCode ?? this.muscleGroupCode,
    muscleHeadName: muscleHeadName,
    muscleHeadCode: muscleHeadCode,
    auxMuscle1: auxMuscle1,
    auxMuscle2: auxMuscle2,
    auxMuscle3: auxMuscle3,
    laterals: laterals,
    description: description,
    toolName: toolName,
    toolCode: toolCode,
    timestamp: timestamp,
  );
}
