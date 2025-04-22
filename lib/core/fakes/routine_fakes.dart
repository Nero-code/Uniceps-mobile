import 'dart:convert';

import 'package:uniceps/app/data/models/training_models/exercise_v2_model.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/fakes/exercises_json.dart';

final fakeRoutine = Routine(
  id: null,
  apiId: null,
  description: null,
  version: 0,
  isSynced: false,
  name: "Circular",
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
  trainingDays: [
    RoutineDay(
        id: null,
        apiId: null,
        routineId: 0,
        name: "All",
        index: 0,
        exercises: (jsonDecode(exercisesJson) as List)
            .map((e) => RoutineItem(
                  id: null,
                  apiId: null,
                  dayId: 0,
                  index: 0,
                  version: 0,
                  isSynced: false,
                  exercise: ExerciseV2Model.fromJson(e),
                  sets: const [
                    RoutineSet(
                        id: null,
                        apiId: null,
                        routineItemId: 0,
                        index: 0,
                        reps: 12,
                        version: 0,
                        isSynced: false),
                    RoutineSet(
                        id: null,
                        apiId: null,
                        routineItemId: 0,
                        index: 1,
                        reps: 10,
                        version: 0,
                        isSynced: false),
                    RoutineSet(
                        id: null,
                        apiId: null,
                        routineItemId: 0,
                        index: 2,
                        reps: 08,
                        version: 0,
                        isSynced: false),
                  ],
                ))
            .toList(),
        version: 0,
        isSynced: false),
  ],
);
