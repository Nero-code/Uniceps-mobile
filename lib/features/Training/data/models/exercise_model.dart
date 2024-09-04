import 'package:uniceps/features/Training/services/entities/exercise.dart';

class ExerciseModel extends Exercise {
  const ExerciseModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.notes,
    required super.muscleGroup,
    required super.itemOrder,
    required super.orders,
    super.lastWaight = 0,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    //  PROBING TYPES
    //
    // print("Prob for exercises parsing algorithm");
    // print("id:     ${json['id'].runtimeType}");
    // print("exName: ${json['ExerciseName'].runtimeType}");
    // print("exImg:  ${json['ExerciseImage'].runtimeType}");
    // print("notes:  ${json['notes'] ?? "".runtimeType}");
    // print("mg:     ${json['Muscle_Group'].runtimeType}");
    // print("itemo:  ${json['itemOrder'].runtimeType}");
    // print("orders: ${json['orders'] ?? "".runtimeType}");
    // print("lastW:  ${json['lastWaight'].runtimeType}");
    //
    // ///////////////////////////////////////////////////
    return ExerciseModel(
      id: json['id'].toString(),
      name: json['ExerciseName'],
      imageUrl: json['ExerciseImage'],
      notes: json['notes'] ?? "",
      muscleGroup: json['Muscle_Group'],
      itemOrder: json['itemOrder'],
      orders: json['orders'] ?? "",
      lastWaight: json['lastWaight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ExerciseName': name,
      'ExerciseImage': imageUrl,
      'notes': notes,
      'muscleGroup': muscleGroup,
      'itemOrder': itemOrder,
      'orders': orders,
      'lastWaight': lastWaight,
    };
  }

  @override
  List<Object?> get props => [id, name, lastWaight];
}
