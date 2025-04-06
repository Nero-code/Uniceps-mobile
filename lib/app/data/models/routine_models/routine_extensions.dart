import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';

extension RoutineExtension on Routine {
  RoutineDto fromModel() => RoutineDto(
        id: id,
        apiId: apiId,
        issuerId: issuerId,
        name: name,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
        trainingDays: trainingDays,
        isCurrent: isCurrent,
      );
}
