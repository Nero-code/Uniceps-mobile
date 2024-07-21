import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  /// `id`: Unique Id.
  ///
  /// `name`: name of the exercise.
  ///
  /// `description`: more explaination for the exercise.
  ///
  /// `tId`: Training Id the exercise belongs to.
  final String id, name, description, tId, imageUrl;
  final int lastWaight;

  const Exercise({
    required this.id,
    required this.name,
    required this.tId,
    required this.imageUrl,
    required this.description,
    this.lastWaight = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastWaight,
      ];
}
