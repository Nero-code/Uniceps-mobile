import 'package:equatable/equatable.dart';

class ExerciseModel extends Equatable {
  final String id, tId, name, imageUrl;

  ExerciseModel({
    required this.id,
    required this.tId,
    required this.name,
    required this.imageUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, imageUrl];
}
