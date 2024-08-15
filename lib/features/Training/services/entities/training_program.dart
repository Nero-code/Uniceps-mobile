import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';

class TrainingProgram {
  final String id, name;
  final Map<MuscleGroup, Exercise> program;

  TrainingProgram({
    required this.id,
    required this.name,
    required this.program,
  });
}


// {
//   "RoutineId": 26,
//   "RoutineNumber": 0,
//   "RoutineDate": "2024-04-22",
//   "pid": 3,
//   "Schedule": [
//     {
//       "id": 296,
//       "ExerciseName": "مد و جزر",
//       "ExerciseImage": "6",
//       "Muscle_Group": 8,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 1
//     },
//     {
//       "id": 297,
//       "ExerciseName": "طحن",
//       "ExerciseImage": "1",
//       "Muscle_Group": 8,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 2
//     },
//     {
//       "id": 298,
//       "ExerciseName": "ثني اليدين بالبار مستلقيا ",
//       "ExerciseImage": "1",
//       "Muscle_Group": 6,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 1
//     },
//     {
//       "id": 299,
//       "ExerciseName": "ثني اليدين جالسا بالبار",
//       "ExerciseImage": "8",
//       "Muscle_Group": 6,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 2
//     },
//     {
//       "id": 300,
//       "ExerciseName": "ضغط مستوي قبضة ضيقة ",
//       "ExerciseImage": "3",
//       "Muscle_Group": 6,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 3
//     },
//     {
//       "id": 301,
//       "ExerciseName": "واقفا بالبار",
//       "ExerciseImage": "1",
//       "Muscle_Group": 5,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 1
//     },
//     {
//       "id": 302,
//       "ExerciseName": "مقعد سكوات",
//       "ExerciseImage": "6",
//       "Muscle_Group": 5,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 2
//     },
//     {
//       "id": 303,
//       "ExerciseName": "ضغط بار خلف الراس جالسا",
//       "ExerciseImage": "2",
//       "Muscle_Group": 2,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 1
//     },
//     {
//       "id": 304,
//       "ExerciseName": "ضغط بار امام الراس جالسا",
//       "ExerciseImage": "8",
//       "Muscle_Group": 2,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 2
//     },
//     {
//       "id": 305,
//       "ExerciseName": "سكوات",
//       "ExerciseImage": "5",
//       "Muscle_Group": 4,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 1
//     },
//     {
//       "id": 306,
//       "ExerciseName": "مكبس",
//       "ExerciseImage": "3",
//       "Muscle_Group": 4,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 2
//     },
//     {
//       "id": 307,
//       "ExerciseName": "واقفا ",
//       "ExerciseImage": "5",
//       "Muscle_Group": 7,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 1
//     },
//     {
//       "id": 308,
//       "ExerciseName": "مكبس",
//       "ExerciseImage": "1",
//       "Muscle_Group": 7,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 2
//     },
//     {
//       "id": 309,
//       "ExerciseName": "ضغط مستوي بالبار",
//       "ExerciseImage": "6",
//       "Muscle_Group": 1,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 1
//     },
//     {
//       "id": 310,
//       "ExerciseName": "ضغط عالي بالبار",
//       "ExerciseImage": "8",
//       "Muscle_Group": 1,
//       "orders": null,
//       "notes": null,
//       "itemOrder": 2
//     }
//   ],
//   "GroupMapping": {
//     "1": "صدر + باي",
//     "2": [
//       8
//     ],
//     "3": [
//       8,
//       2
//     ],
//     "4": [
//       3,
//       8
//     ],
//     "5": [
//       2
//     ],
//     "6": []
//   }
// }