import 'package:uniceps/app/domain/classes/training_entities/exercise.dart';

class ExerciseModel extends Exercise {
  const ExerciseModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.notes,
    required super.muscleGroup,
    required super.itemOrder,
    required super.sets,
    super.imageBitMap,
    super.lastWaight = 0,
    super.isCompleted = false,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    //  PROBING TYPES
    //
    // print("Prob for exercises parsing algorithm");
    // print("id:     ${json['id'].runtimeType}");
    // print("exName: ${json['ExerciseName'].runtimeType}");
    // print("exImg:  ${json['ExerciseImage'].runtimeType}");
    // print("notes:  ${json['notes'].runtimeType}");
    // print("mg:     ${json['Muscle_Group'].runtimeType}");
    // print("itemo:  ${json['itemOrder'].runtimeType}");
    // print("sets:   ${json['sets'].runtimeType}");
    // print("lastW:  ${json['lastWaight'].runtimeType}");
    // print("image:  ${json['image'].runtimeType}");
    //
    // ///////////////////////////////////////////////////
    return ExerciseModel(
      id: json['id'].toString(),
      name: json['ExerciseName'],
      imageUrl: json['ExerciseImage'],
      notes: json['notes'] ?? "",
      muscleGroup: json['Muscle_Group'],
      itemOrder: json['itemOrder'],
      sets: json['sets'] ?? "",
      lastWaight: json['lastWaight'],
      imageBitMap: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'ExerciseName': name,
      'ExerciseImage': imageUrl,
      'notes': notes,
      'Muscle_Group': muscleGroup,
      'itemOrder': itemOrder,
      'sets': sets,
    };
  }

  @override
  List<Object?> get props => [id, name, lastWaight];
}
