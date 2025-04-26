import 'package:uniceps/app/data/sources/local/database.dart';

class MuscleGroup {
  final int? id;
  final int apiId;
  final String arGroupName, enGroupName;

  const MuscleGroup(
      {this.id,
      required this.apiId,
      required this.arGroupName,
      required this.enGroupName});

  factory MuscleGroup.fromTable(ExerciseGroup group) => MuscleGroup(
        id: group.id,
        apiId: group.apiId,
        arGroupName: group.arName,
        enGroupName: group.enName,
      );
}
