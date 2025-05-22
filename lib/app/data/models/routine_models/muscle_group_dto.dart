import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

class MuscleGroupDto extends MuscleGroup implements BaseDTO {
  MuscleGroupDto({
    super.id,
    required super.apiId,
    required super.arGroupName,
    required super.enGroupName,
  });

  factory MuscleGroupDto.fromJson(Map<String, dynamic> json) => MuscleGroupDto(
        apiId: json['id'],
        arGroupName: json['name'],
        enGroupName: json['engName'],
      );

  factory MuscleGroupDto.fromTable(ExerciseGroup group) => MuscleGroupDto(
        id: group.id,
        apiId: group.apiId,
        arGroupName: group.arName,
        enGroupName: group.enName,
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "apiId": apiId,
        "arGroupName": arGroupName,
        "enGroupName": enGroupName,
      };
}
