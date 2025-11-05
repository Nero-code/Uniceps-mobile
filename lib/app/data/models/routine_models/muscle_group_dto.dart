import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/core/constants/constants.dart';

class MuscleGroupDto {
  final int? id;
  final int apiId;
  final Map<Lang, String> muscleGroupTranslations;
  MuscleGroupDto({
    this.id,
    required this.apiId,
    required this.muscleGroupTranslations,
  });

  factory MuscleGroupDto.fromEntity(MuscleGroup e) => MuscleGroupDto(
      id: e.id,
      apiId: e.apiId,
      muscleGroupTranslations: e.muscleGroupTranslations);
  MuscleGroup toEntity() => MuscleGroup(
      apiId: apiId, muscleGroupTranslations: (muscleGroupTranslations));

  factory MuscleGroupDto.fromJson(Map<String, dynamic> json) => MuscleGroupDto(
        apiId: json['id'],
        muscleGroupTranslations: {
          Lang.ar: json['name'] as String,
          Lang.en: json['engName'] as String,
        },
      );

  factory MuscleGroupDto.fromTable(ExerciseGroup group) => MuscleGroupDto(
      id: group.id,
      apiId: group.apiId,
      muscleGroupTranslations:
          parseTranslations(group.muscleGroupTranslations));

  Map<String, dynamic> toJson() => {
        "id": id,
        "apiId": apiId,
        'muscleGroupTranslations': encodeTranslations(muscleGroupTranslations),
      };
}
