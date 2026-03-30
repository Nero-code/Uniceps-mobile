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
