import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IExercisesRemoteSourceContract {
  Future<List<MuscleGroupDto>> getExerciseGroups();
  Future<List<ExerciseV2Dto>> getAllExercises();
  Future<List<ExerciseV2Dto>> getExercisesByFilter(String filter);
  Future<List<ExerciseV2Dto>> getExercisesByGroup(MuscleGroupDto group);
}

class ExercisesRemoteSourceImpl implements IExercisesRemoteSourceContract {
  final ClientHelper _clientHelper;

  const ExercisesRemoteSourceImpl({required ClientHelper clientHelper})
      : _clientHelper = clientHelper;

  @override
  Future<List<MuscleGroupDto>> getExerciseGroups() async {
    return await _clientHelper.getListHandler<MuscleGroupDto>(
        API_V2, HTTP_MUSCLE_GROUPS, (json) => MuscleGroupDto.fromJson(json));
  }

  @override
  Future<List<ExerciseV2Dto>> getAllExercises() async {
    return await _clientHelper.getListHandler<ExerciseV2Dto>(
        API_V2, HTTP_EXERCISES, (json) => ExerciseV2Dto.fromJson(json));
  }

  @override
  Future<List<ExerciseV2Dto>> getExercisesByFilter(String filter) async {
    return await _clientHelper.getListHandler<ExerciseV2Dto>(
        API_V2, HTTP_EXERCISES, (json) => ExerciseV2Dto.fromJson(json));
  }

  @override
  Future<List<ExerciseV2Dto>> getExercisesByGroup(MuscleGroupDto group) async {
    return await _clientHelper.getListHandler(
        API_V2, HTTP_EXERCISES, (json) => ExerciseV2Dto.fromJson(json));
  }
}
