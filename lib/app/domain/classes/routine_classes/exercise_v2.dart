import 'package:flutter/foundation.dart';

class ExerciseV2 {
  const ExerciseV2({
    required this.id,
    required this.apiId,
    required this.muscleGroupId,
    required this.name,
    required this.imageUrl,
    required this.imageBitMap,
  });

  final int? id, apiId;
  final int muscleGroupId;
  final String name, imageUrl;
  final Uint8List? imageBitMap;

  @override
  String toString() {
    return """{
    id: $id,
    name: $name,
    muscleGroupId: $muscleGroupId,
    imageUrl: $imageUrl,
  }""";
  }
}
