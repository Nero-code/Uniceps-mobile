import 'package:flutter/foundation.dart';

class ExerciseV2 {
  const ExerciseV2({
    required this.id,
    required this.apiId,
    required this.muscleGroup,
    required this.name,
    required this.imageUrl,
    required this.imageBitMap,
  });

  final int? id, apiId;
  final int muscleGroup;
  final String name, imageUrl;
  final Uint8List? imageBitMap;

  @override
  String toString() {
    return """{
    id: $id,
    name: $name,
    muscleGroup: $muscleGroup,
    imageUrl: $imageUrl,
  }""";
  }
}
