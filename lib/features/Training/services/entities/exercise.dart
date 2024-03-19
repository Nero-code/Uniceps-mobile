import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  final String id, name, description, tId, imageUrl;

  const Exercise({
    required this.id,
    required this.name,
    required this.tId,
    required this.imageUrl,
    required this.description,
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
