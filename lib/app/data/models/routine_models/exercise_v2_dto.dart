import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';

class ExerciseV2Dto extends ExerciseV2 implements BaseDTO {
  const ExerciseV2Dto({
    required super.id,
    required super.apiId,
    required super.muscleGroup,
    required super.name,
    required super.imageUrl,
    required super.imageBitMap,
  });

  factory ExerciseV2Dto.fromJson(Map<String, dynamic> json) => ExerciseV2Dto(
        id: json['id'],
        apiId: json['apiId'],
        muscleGroup: json['muscleGroup'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        imageBitMap: null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'apiId': apiId,
        'muscleGroup': muscleGroup,
        'name': name,
        'imageUrl': imageUrl,
        'imageBitMap': imageBitMap,
      };
}
