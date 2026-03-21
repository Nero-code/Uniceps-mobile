import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

class MuscleGroupDto {
  final int? id;
  final int apiId;
  final String muscleGroup;
  MuscleGroupDto({this.id, required this.apiId, required this.muscleGroup});

  factory MuscleGroupDto.fromEntity(MuscleGroup e) =>
      MuscleGroupDto(id: e.id, apiId: e.apiId, muscleGroup: e.muscleGroup);
  MuscleGroup toEntity() => MuscleGroup(apiId: apiId, muscleGroup: (muscleGroup));

  factory MuscleGroupDto.fromJson(Map<String, dynamic> json) => MuscleGroupDto(
    apiId: json['id'],
    // muscleGroup: {Lang.ar: json['name'] as String, Lang.en: json['engName'] as String},
    muscleGroup: json['name'] as String,
  );

  // factory MuscleGroupDto.fromTable(ExerciseGroup group) => MuscleGroupDto(
  //     id: group.id,
  //     apiId: group.apiId,
  //     muscleGroup:
  //         parseTranslations(group.muscleGroup));

  Map<String, dynamic> toJson() => {
    "id": id, "apiId": apiId,
    // 'muscleGroup': encodeTranslations(muscleGroup),
    'muscleGroup': muscleGroup,
  };
}
