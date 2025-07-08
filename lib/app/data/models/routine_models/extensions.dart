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

extension MuscleGroupExtension on MuscleGroup {
  MuscleGroupDto toDto() => MuscleGroupDto.fromEntity(this);
}

extension ExerciseV2Extension on ExerciseV2 {
  ExerciseV2Dto toDto() => ExerciseV2Dto.fromEntity(this);
}

//
//
//

extension RoutineSetExtension on RoutineSet {
  RoutineSetDto toDto() => RoutineSetDto.fromEntity(this);
}

//
//
//

extension RoutineItemExtension on RoutineItem {
  RoutineItemDto toDto() => RoutineItemDto.fromEntity(this);
}

//
//
//

extension DaysExtension on RoutineDay {
  RoutineDayDto toDto() => RoutineDayDto.fromEntity(this);
}

//
//
//

extension RoutineExtension on Routine {
  RoutineDto toDto() => RoutineDto.fromEntity(this);
}
