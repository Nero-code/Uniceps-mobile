import 'package:uniceps/app/data/sources/local/database.dart';

class MuscleGroup {
  final int id;
  final String arGroupName, enGroupName;

  const MuscleGroup(
      {required this.id, required this.arGroupName, required this.enGroupName});

  factory MuscleGroup.fromTable(ExerciseGroup group) => MuscleGroup(
        id: group.id,
        arGroupName: group.arName,
        enGroupName: group.enName,
      );
}
