import 'package:uniceps/core/constants/constants.dart';

class MuscleGroup {
  final int? id;
  final int apiId;
  final Map<Lang, String> muscleGroupTranslations;

  const MuscleGroup({
    this.id,
    required this.apiId,
    required this.muscleGroupTranslations,
  });
}
