import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';

extension MuscleGroupDtoExtension on MuscleGroupDto {
  MuscleGroup fromDto() => MuscleGroup(
        apiId: apiId,
        arGroupName: arGroupName,
        enGroupName: enGroupName,
      );
}

extension MuscleGroupExtension on MuscleGroup {
  MuscleGroupDto asDto() => MuscleGroupDto(
        id: id,
        apiId: apiId,
        arGroupName: arGroupName,
        enGroupName: enGroupName,
      );
}

extension ExerciseV2Extension on ExerciseV2 {
  RoutineItem toItem(int dayId, int index) => RoutineItem(
      id: null,
      dayId: dayId,
      index: index,
      exercise: this,
      sets: [],
      apiId: null,
      version: 0,
      isSynced: false);

  ExerciseV2Dto asDto() => ExerciseV2Dto(
        id: id,
        apiId: apiId,
        muscleGroupId: muscleGroupId,
        name: name,
        imageUrl: imageUrl,
        imageBitMap: imageBitMap,
      );
}

//
//
//
extension RoutineSetDtoExtenstion on RoutineSetDto {
  RoutineSet fromDto() => RoutineSet(
        id: id,
        apiId: apiId,
        routineItemId: routineItemId,
        version: version,
        index: index,
        reps: reps,
        weight: weight,
        isSynced: isSynced,
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
      weight: weight,
      isSynced: isSynced);
}

//
//
//

extension RoutinItemDtoExtension on RoutineItemDto {
  RoutineItem fromDto() => RoutineItem(
        id: id,
        apiId: apiId,
        dayId: dayId,
        index: index,
        version: version,
        exercise: exercise,
        sets: sets,
        isSynced: isSynced,
      );
}

extension RoutineItemExtension on RoutineItem {
  RoutineItemDto asDto() => RoutineItemDto(
      id: id,
      apiId: apiId,
      dayId: dayId,
      index: index,
      version: version,
      exerciseV2Dto: exercise.asDto(),
      setsDto: sets.map((e) => e.asDto()).toList(),
      isSynced: isSynced);
}

//
//
//

extension DaysDtoExtension on RoutineDayDto {
  RoutineDay fromDto() => RoutineDay(
        routineId: routineId,
        name: name,
        index: index,
        exercises: exercises,
      );
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

//
//
//

extension RoutineDtoExtension on RoutineDto {
  Routine fromDto() => Routine(
      id: id,
      apiId: apiId,
      version: version,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      trainingDays: trainingDaysDto.map((d) => d.fromDto()).toList(),
      isSynced: isSynced);
}

extension RoutineExtension on Routine {
  RoutineDto asDto() => RoutineDto(
        id: id,
        apiId: apiId,
        version: version,
        name: name,
        description: description,
        isCurrent: isCurrent,
        createdAt: createdAt,
        updatedAt: updatedAt,
        trainingDaysDto: trainingDays.map((e) => e.asDto()).toList(),
        isSynced: isSynced,
      );
}
