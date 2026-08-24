import 'package:flutter/foundation.dart';

class Exercise {
  final String apiId;
  final String name;
  final String? imagePath;
  final Uint8List? imageBitMap;

  final String muscleGroupName;
  final String muscleGroupCode;

  final String muscleHeadName;
  final String muscleHeadCode;

  final String? auxMuscle1;
  final String? auxMuscle2;
  final String? auxMuscle3;
  final String laterals;
  final String? description;

  final String toolName;
  final String toolCode;

  final DateTime timestamp;

  const Exercise({
    required this.apiId,
    required this.name,
    required this.imagePath,
    required this.imageBitMap,
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

  Exercise copyWith({
    String? apiId,
    String? name,
    String? imagePath,
    Uint8List? imageBitMap,

    String? muscleGroupName,
    String? muscleGroupCode,

    String? muscleHeadName,
    String? muscleHeadCode,

    String? auxMuscle1,
    String? auxMuscle2,
    String? auxMuscle3,
    String? laterals,
    String? description,

    String? toolName,
    String? toolCode,

    DateTime? timestamp,
  }) => Exercise(
    apiId: apiId ?? this.apiId,
    name: name ?? this.name,
    imagePath: imagePath ?? this.imagePath,
    imageBitMap: imageBitMap ?? this.imageBitMap,
    muscleGroupName: muscleGroupName ?? this.muscleGroupName,
    muscleGroupCode: muscleGroupCode ?? this.muscleGroupCode,
    muscleHeadName: muscleHeadName ?? this.muscleHeadName,
    muscleHeadCode: muscleHeadCode ?? this.muscleHeadCode,
    auxMuscle1: auxMuscle1 ?? this.auxMuscle1,
    auxMuscle2: auxMuscle2 ?? this.auxMuscle2,
    auxMuscle3: auxMuscle3 ?? this.auxMuscle3,
    laterals: laterals ?? this.laterals,
    description: description ?? this.description,
    toolName: toolName ?? this.toolName,
    toolCode: toolCode ?? this.toolCode,
    timestamp: timestamp ?? this.timestamp,
  );

  @override
  String toString() {
    return """{
    apiId: $apiId,
    name: $name,
    muscleGroupTranslations: @Deprecated,
    muscleGroup: $muscleGroupName,
    imageUrl: $imagePath,
  }""";
  }
}
