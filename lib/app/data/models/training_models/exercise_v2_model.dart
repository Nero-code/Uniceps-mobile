import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/core/constants/constants.dart';

class ExerciseV2Model extends ExerciseV2 {
  const ExerciseV2Model({
    required super.id,
    required super.apiId,
    required super.muscleGroup,
    required super.name,
    required super.imageUrl,
    required super.imageBitMap,
  });

  factory ExerciseV2Model.fromJson(Map<String, dynamic> json) {
    return ExerciseV2Model(
      id: json['Tid'],
      apiId: json['apiId'],
      muscleGroup: trSections.firstWhere((tr) => json['GroupId'] == tr.id),
      name: json['Name'],
      imageUrl: json['ImageId'].toString(),
      imageBitMap: json['imageBitMap'],
    );
  }
}
