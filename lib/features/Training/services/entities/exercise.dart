import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
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

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      tId: json['tId'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
