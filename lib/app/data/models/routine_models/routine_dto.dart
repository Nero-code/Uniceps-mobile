import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';

class RoutineDto extends Routine implements BaseDTO {
  const RoutineDto({
    required super.id,
    required super.apiId,
    required super.issuerId,
    required super.name,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
    required super.trainingDays,
    super.isCurrent,
  });
  factory RoutineDto.fromJson(Map<String, dynamic> json) => RoutineDto(
        id: json['id'],
        apiId: json['apiId'],
        issuerId: json['issuerId'],
        name: json['name'],
        description: json['description'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        trainingDays: json['trainingDays)'],
      );
}
