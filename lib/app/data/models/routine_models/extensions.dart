import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';

extension ExerciseV2Extension on ExerciseV2 {
  ExerciseV2Dto asDto() => ExerciseV2Dto(
        id: id,
        apiId: apiId,
        muscleGroup: muscleGroup,
        name: name,
        imageUrl: imageUrl,
        imageBitMap: imageBitMap,
      );
}

extension RoutineSetExtension on RoutineSet {
  RoutineSetDto asDto() => RoutineSetDto(
      id: id,
      apiId: apiId,
      routineItemId: routineItemId,
      version: version,
      index: index,
      reps: reps,
      isSynced: isSynced);
}

extension RoutineItemExtension on RoutineItem {
  RoutineItemDto asDto() => RoutineItemDto(
      id: id,
      apiId: apiId,
      dayId: dayId,
      version: version,
      exerciseV2Dto: exercise.asDto(),
      setsDto: sets.map((e) => e.asDto()).toList(),
      isSynced: isSynced);
}

extension DaysExtension on RoutineDay {
  RoutineDayDto asDto() => RoutineDayDto(
      id: id,
      apiId: apiId,
      routineId: routineId,
      version: version,
      name: name,
      index: index,
      items: exercises.map((e) => e.asDto()).toList(),
      isSynced: isSynced);
}

extension RoutineExtension on Routine {
  RoutineDto asDto() => RoutineDto(
      id: id,
      apiId: apiId,
      issuerId: issuerId,
      version: version,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      trainingDaysDto: trainingDays.map((e) => e.asDto()).toList(),
      isSynced: isSynced);
}
