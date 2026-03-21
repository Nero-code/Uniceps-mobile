import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/data/stores/routine/exercises_repo.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'exercises_repo_test.mocks.dart';

@GenerateMocks([IExercisesRemoteSourceContract, IExercisesLocalSourceContract, NetworkInfo])
void main() {
  late ExercisesRepo repo;
  late MockIExercisesRemoteSourceContract mockRemoteSource;
  late MockIExercisesLocalSourceContract mockLocalSource;
  late MockNetworkInfo mockInternet;
  final logger = Logger();

  setUp(() {
    mockRemoteSource = MockIExercisesRemoteSourceContract();
    mockLocalSource = MockIExercisesLocalSourceContract();
    mockInternet = MockNetworkInfo();
    repo = ExercisesRepo(
      remoteSource: mockRemoteSource,
      localSource: mockLocalSource,
      internet: mockInternet,
      logger: logger,
    );
  });

  final tMuscleGroup = const MuscleGroup(apiId: 1, muscleGroup: 'Chest');
  final tMuscleGroupDto = MuscleGroupDto.fromEntity(tMuscleGroup);
  final tExercise = Exercise(
    apiId: '1',
    name: 'Push-up',
    imagePath: 'url',
    imageBitMap: Uint8List(0),
    muscleGroup: 'Chest',
    version: 1,
    mediaVersion: 1,
  );
  final tExerciseDto = ExerciseDto.fromEntity(tExercise);

  group('getExerciseGroups', () {
    test('should return muscle groups when online', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => true);
      when(mockRemoteSource.getExerciseGroups()).thenAnswer((_) async => [tMuscleGroupDto]);
      // act
      final result = await repo.getExerciseGroups();
      // assert
      expect(result.isRight(), isTrue);
    });

    test('should return OfflineFailure when offline', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => false);
      // act
      final result = await repo.getExerciseGroups();
      // assert
      expect(result.isLeft(), true);
    });

    test('should return ServerFailure on remote source exception', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => true);
      when(mockRemoteSource.getExerciseGroups()).thenThrow(Exception());
      // act
      final result = await repo.getExerciseGroups();
      // assert
      expect(result, isA<Left<Failure, List<MuscleGroup>>>());
    });
  });

  group('getExercises', () {
    test('should return exercises and update cache when online', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => true);
      when(mockRemoteSource.getAllExercises()).thenAnswer((_) async => [tExerciseDto]);
      // act
      final result = await repo.getExercises();
      // assert
      expect(result.isRight(), isTrue);
    });

    test('should return OfflineFailure when offline', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => false);
      // act
      final result = await repo.getExercises();
      // assert
      expect(result.isLeft(), true);
    });
  });

  group('getExercisesByGroup', () {
    test('should return exercises by group when online', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => true);
      when(mockRemoteSource.getExercisesByGroup(any)).thenAnswer((_) async => [tExerciseDto]);
      // act
      final result = await repo.getExercisesByGroup(tMuscleGroup);
      // assert
      expect(result, isA<Right<Failure, List<Exercise>>>());
    });

    test('should return OfflineFailure when offline', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => false);
      // act
      final result = await repo.getExercisesByGroup(tMuscleGroup);
      // assert
      expect(result.isLeft(), true);
    });
  });
}
