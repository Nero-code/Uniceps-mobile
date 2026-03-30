import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

class MuscleGroupDto {
  final String muscleGroupCode;
  final String muscleGroupName;
  MuscleGroupDto({required this.muscleGroupCode, required this.muscleGroupName});

  factory MuscleGroupDto.fromEntity(MuscleGroup e) =>
      MuscleGroupDto(muscleGroupCode: e.muscleGroupCode, muscleGroupName: e.muscleGroupName);
  MuscleGroup toEntity() => MuscleGroup(muscleGroupCode: muscleGroupCode, muscleGroupName: (muscleGroupName));

  factory MuscleGroupDto.fromJson(Map<String, dynamic> json) =>
      MuscleGroupDto(muscleGroupCode: json['MuscleGroupCode'], muscleGroupName: json['MuscleGroupName'] as String);

  // factory MuscleGroupDto.fromTable(ExerciseGroup group) => MuscleGroupDto(
  //     id: group.id,
  //     apiId: group.apiId,
  //     muscleGroup:
  //         parseTranslations(group.muscleGroup));

  Map<String, dynamic> toJson() => {'MuscleGroupCode': muscleGroupCode, 'MuscleGroupName': muscleGroupName};
}
