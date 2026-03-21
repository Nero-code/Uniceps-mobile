import 'package:flutter/foundation.dart';

class Exercise {
  const Exercise({
    required this.apiId,
    required this.name,
    // required this.muscleGroupTranslations,
    required this.muscleGroup,
    required this.imagePath,
    required this.imageBitMap,
    required this.version,
    required this.mediaVersion,
  });

  final String apiId;
  final String name, imagePath;

  // final Map<Lang, String> muscleGroupTranslations;
  final String muscleGroup;

  final Uint8List? imageBitMap;

  final int version;
  final int mediaVersion;

  @override
  String toString() {
    return """{
    apiId: $apiId,
    name: $name,
    muscleGroupTranslations: @Depricated,
    muscleGroup: $muscleGroup,
    imageUrl: $imagePath,
  }""";
  }
}
