import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  /// `id`: Unique Id.
  ///
  /// `name`: name of the exercise.
  ///
  /// `description`: more explaination for the exercise.
  ///
  /// `tId`: Training Id the exercise belongs to.
  final String id, name, notes, orders, imageUrl;
  final int muscleGroup, itemOrder;
  final double lastWaight;

  const Exercise({
    required this.id,
    required this.name,
    required this.notes,
    required this.muscleGroup,
    required this.itemOrder,
    required this.orders,
    required this.imageUrl,
    required this.lastWaight,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        muscleGroup,
        imageUrl,
      ];
}
