import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

class RoutineTableParser {
  // final AppDatabase _database;
  final Box<Uint8List> imagesCache;
  final Routine routine;
  final List<DaysGroupData> days;
  final List<RoutineItem> items;
  final List<Exercise> exercises;
  final List<ExerciseGroup> groups;
  final List<RoutineSet> sets;

  const RoutineTableParser({
    // required AppDatabase database,
    required this.imagesCache,
    required this.routine,
    required this.days,
    required this.items,
    required this.exercises,
    required this.groups,
    required this.sets,
  });

  RoutineDto toDto() {
    List<RoutineDayDto> routineDays = [];
    print("found routine");
    for (final dayTable in days) {
      print("found day");
      //
      List<RoutineItemDto> dayItems = [];
      for (final itemTable in items) {
        print("found item");
        if (itemTable.dayId == dayTable.id) {
          //
          List<RoutineSetDto> itemSets = [];
          for (final setTable in sets) {
            print("found set");
            if (setTable.routineItemId == itemTable.id) {
              itemSets.add(RoutineSetDto.fromTable(setTable));
            }
          }

          final exercise =
              exercises.firstWhere((e) => e.apiId == itemTable.exerciseId);
          final img = imagesCache.get(exercise.imageUrl);
          final group =
              groups.firstWhere((g) => g.apiId == exercise.muscleGroup);
          final itemDto = RoutineItemDto.fromTable(
            itemTable,
            ExerciseV2Dto.fromTable(exercise, group, exercise.imageUrl, img),
            itemSets,
          );

          dayItems.add(itemDto);
        }
      }

      final dayDto = RoutineDayDto.fromTable(dayTable, dayItems);
      routineDays.add(dayDto);
    }
    print(routine.name);
    for (var element in routineDays) {
      print(element.name);
      for (var item in element.items) {
        print(item.exerciseV2Dto.name);
      }
    }
    return RoutineDto.fromTable(routine, routineDays);
  }
}
