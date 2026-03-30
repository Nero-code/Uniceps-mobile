import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/core/constants/api_routes.dart';

abstract class IExercisesRemoteSourceContract {
  Future<List<MuscleGroupDto>> getExerciseGroups();
  Future<List<ExerciseDto>> getAllExercises([DateTime? timestamp]);
  Future<List<ExerciseDto>> getExercisesByGroup(MuscleGroupDto group);

  Future<Uint8List> getExerciseImage(String imageUrl);
}

class ExercisesRemoteSourceImpl implements IExercisesRemoteSourceContract {
  final ClientHelper _clientHelper;
  final http.Client _client;

  const ExercisesRemoteSourceImpl({required ClientHelper clientHelper, required http.Client client})
    : _clientHelper = clientHelper,
      _client = client;

  @override
  Future<List<MuscleGroupDto>> getExerciseGroups() async {
    return await _clientHelper.getListHandler<MuscleGroupDto>(
      ApiRoutes.domain,
      ApiRoutes.muscleGroups,
      MuscleGroupDto.fromJson,
      needsHeader: false,
    );
  }

  @override
  Future<List<ExerciseDto>> getAllExercises([DateTime? timestamp]) async {
    return await _clientHelper.getListHandler<ExerciseDto>(
      ApiRoutes.domain,
      ApiRoutes.exercises,
      ExerciseDto.fromJson,
      needsHeader: false,
    );
  }

  @override
  Future<List<ExerciseDto>> getExercisesByGroup(MuscleGroupDto group) async {
    return await _clientHelper.getListHandler(
      ApiRoutes.domain,
      ApiRoutes.exercises,
      ExerciseDto.fromJson,
      needsHeader: false,
      queryParams: {'MuscleGroupCode': group.muscleGroupCode},
    );
  }

  @override
  Future<Uint8List> getExerciseImage(String exerciseId) async {
    final res = await _client.get(Uri.https(ApiRoutes.domain, ApiRoutes.exerciseImage(exerciseId)));
    return res.bodyBytes;
  }
}
