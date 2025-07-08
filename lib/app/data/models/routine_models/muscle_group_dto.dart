import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

class MuscleGroupDto {
  final int? id;
  final int apiId;
  final String arGroupName, enGroupName;
  MuscleGroupDto({
    this.id,
    required this.apiId,
    required this.arGroupName,
    required this.enGroupName,
  });

  factory MuscleGroupDto.fromEntity(MuscleGroup e) => MuscleGroupDto(
      id: e.id,
      apiId: e.apiId,
      arGroupName: e.arGroupName,
      enGroupName: e.enGroupName);
  MuscleGroup toEntity() => MuscleGroup(
      apiId: apiId, arGroupName: arGroupName, enGroupName: enGroupName);

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

  Map<String, dynamic> toJson() => {
        "id": id,
        "apiId": apiId,
        "arGroupName": arGroupName,
        "enGroupName": enGroupName,
      };
}
