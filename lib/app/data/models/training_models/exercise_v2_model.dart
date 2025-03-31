import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';

class ExerciseV2Model extends ExerciseV2 {
  const ExerciseV2Model({
    required super.id,
    required super.muscleGroup,
    required super.name,
    required super.imageUrl,
    required super.imageBitMap,
  });

  factory ExerciseV2Model.fromJson(Map<String, dynamic> json) {
    return ExerciseV2Model(
      id: json['Tid'],
      muscleGroup: json['GroupId'],
      name: json['Name'],
      imageUrl: json['ImageId'].toString(),
      imageBitMap: json['imageBitMap'],
    );
  }
}
