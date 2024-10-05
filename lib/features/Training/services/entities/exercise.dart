import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  /// `id`: Unique Id.
  ///
  /// `name`: name of the exercise.
  ///
  /// `description`: more explaination for the exercise.
  ///
  /// `tId`: Training Id the exercise belongs to.
  final String id, name, notes, sets, imageUrl;
  final int muscleGroup, itemOrder;
  final double lastWaight;
  final bool isCompleted;
  final Uint8List? imageBitMap;

  const Exercise({
    required this.id,
    required this.name,
    required this.notes,
    required this.muscleGroup,
    required this.itemOrder,
    required this.sets,
    required this.imageUrl,
    required this.lastWaight,
    this.isCompleted = false,
    this.imageBitMap,
  });

  @override
  List<Object?> get props => [id, name, muscleGroup, imageUrl];
}
