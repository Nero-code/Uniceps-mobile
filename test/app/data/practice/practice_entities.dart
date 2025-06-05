import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;

const mockGroups =
    db.ExerciseGroup(id: 0, apiId: 0, arName: "arName", enName: "enName");
const mockExercise =
    db.Exercise(id: 0, apiId: 0, name: "mockEx", imageUrl: "", muscleGroup: 0);
const mockSet = db.RoutineSet(
    id: 0,
    roundIndex: 0,
    repsCount: 10,
    version: 0,
    isSynced: false,
    routineItemId: 0);
const mockItem = db.RoutineItem(
  id: 0,
  apiId: null,
  dayId: 0,
  index: 0,
  version: 0,
  isSynced: false,
  exerciseId: 0,
);
const mockDay = db.DaysGroupData(
  id: 0,
  apiId: null,
  routineId: 0,
  version: 0,
  dayName: "day 1",
  index: 0,
  isSynced: false,
);
final mockRoutine = db.Routine(
  id: 0,
  name: "Routine",
  isCurrent: false,
  description: "Mock Routine",
  createdAt: DateTime(2025, 5, 28),
  updatedAt: DateTime.now(),
  apiId: null,
  version: 0,
  isSynced: false,
);

final mockTLog = db.TLog(
  logId: 0,
  sessionId: 1,
  exerciseId: 0,
  exerciseIndex: 0,
  setIndex: 0,
  reps: 5,
  weight: 6,
  completedAt: DateTime.now(),
  version: 0,
  isSynced: false,
);
final mockFinishedTSession = db.TSession(
  tsId: 0,
  dayId: 0,
  startedAt: DateTime.now(),
  finishedAt: DateTime.now(),
  version: 0,
  isSynced: false,
);
final mockUnfinishedTSession = db.TSession(
  tsId: 1,
  dayId: 0,
  startedAt: DateTime.now(),
  finishedAt: null,
  version: 0,
  isSynced: false,
);

final mockTLogModel = TLogModel(
  id: null,
  sessionId: 1,
  exerciseId: 0,
  exerciseIndex: 0,
  setIndex: 0,
  reps: 15,
  weight: 50,
  completedAt: DateTime.now(),
);

final parseRoutine = RoutineDto(
  id: 0,
  apiId: null,
  version: 0,
  name: "Routine",
  description: "Mock Routine",
  createdAt: DateTime(2025, 5, 28),
  updatedAt: DateTime.now(),
  trainingDaysDto: [
    const RoutineDayDto(
        id: 0,
        apiId: null,
        routineId: 0,
        version: 0,
        name: "day 1",
        index: 0,
        items: [
          RoutineItemDto(
              id: 0,
              apiId: null,
              dayId: 0,
              index: 0,
              version: 0,
              exerciseV2Dto: ExerciseV2Dto(
                  apiId: 0,
                  muscleGroupId: 0,
                  name: "mockEx",
                  imageUrl: "",
                  imageBitMap: null),
              setsDto: [
                RoutineSetDto(
                    id: 0,
                    apiId: null,
                    routineItemId: 0,
                    version: 0,
                    index: 0,
                    reps: 10,
                    weight: 5.0,
                    isSynced: false)
              ],
              isSynced: false)
        ],
        isSynced: false)
  ],
  isSynced: false,
);
