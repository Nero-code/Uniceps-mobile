import 'package:flutter/foundation.dart';
import 'package:uniceps/core/constants/constants.dart';

class ExerciseV2 {
  const ExerciseV2({
    required this.apiId,
    required this.name,
    required this.muscleGroupTranslations,
    required this.imageUrl,
    required this.imageBitMap,
  });

  final int apiId;
  final String name, imageUrl;

  final Map<Lang, String> muscleGroupTranslations;
  final Uint8List? imageBitMap;

  @override
  String toString() {
    return """{
    apiId: $apiId,
    name: $name,
    muscleGroupTranslations: $muscleGroupTranslations,
    imageUrl: $imageUrl,
  }""";
  }
}
