import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/sources/services/internet_client/client_helper.dart';
import 'package:uniceps/core/constants/constants.dart';

abstract class IExercisesRemoteSourceContract {
  Future<List<MuscleGroupDto>> getExerciseGroups();
  Future<List<ExerciseDto>> getAllExercises();
  // Future<List<ExerciseV2Dto>> getExercisesByFilter(String filter);
  Future<List<ExerciseDto>> getExercisesByGroup(MuscleGroupDto group);
}

class ExercisesRemoteSourceImpl implements IExercisesRemoteSourceContract {
  final ClientHelper _clientHelper;

  const ExercisesRemoteSourceImpl({required ClientHelper clientHelper}) : _clientHelper = clientHelper;

  @override
  Future<List<MuscleGroupDto>> getExerciseGroups() async {
    return await _clientHelper.getListHandler<MuscleGroupDto>(
      API_V2,
      HTTP_MUSCLE_GROUPS,
      MuscleGroupDto.fromJson,
      needsHeader: false,
    );
  }

  @override
  Future<List<ExerciseDto>> getAllExercises() async {
    return await _clientHelper.getListHandler<ExerciseDto>(
      API_V2,
      HTTP_EXERCISES,
      ExerciseDto.fromJson,
      needsHeader: false,
    );
  }

  // @override
  // Future<List<ExerciseV2Dto>> getExercisesByFilter(String filter) async {
  //   return await _clientHelper.getListHandler<ExerciseV2Dto>(API_V2, HTTP_EXERCISES, ExerciseV2Dto.fromJson,
  //       needsHeader: false);
  // }

  @override
  Future<List<ExerciseDto>> getExercisesByGroup(MuscleGroupDto group) async {
    return await _clientHelper.getListHandler(
      API_V2,
      HTTP_EXERCISES,
      ExerciseDto.fromJson,
      needsHeader: false,
      queryParams: {'id': "${group.apiId}"},
    );
  }
}
