import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/data/stores/routine/exercises_repo.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'exercises_repo_test.mocks.dart';

@GenerateMocks([IExercisesRemoteSourceContract, InternetConnectionChecker])
void main() {
  late ExercisesRepo repo;
  late MockIExercisesRemoteSourceContract mockRemoteSource;
  late MockInternetConnectionChecker mockInternet;
  final logger = Logger();

  setUp(() {
    mockRemoteSource = MockIExercisesRemoteSourceContract();
    mockInternet = MockInternetConnectionChecker();
    repo = ExercisesRepo(remoteSource: mockRemoteSource, internet: mockInternet, logger: logger);
  });

  final tMuscleGroup = const MuscleGroup(apiId: 1, muscleGroupTranslations: {Lang.en: 'Chest'});
  final tMuscleGroupDto = MuscleGroupDto.fromEntity(tMuscleGroup);
  final tExercise = ExerciseV2(
    apiId: 1,
    name: 'Push-up',
    imageUrl: 'url',
    imageBitMap: Uint8List(0),
    muscleGroupTranslations: const {Lang.en: 'Chest'},
  );
  final tExerciseDto = ExerciseV2Dto.fromEntity(tExercise);

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

  group('getExercisesByFilter', () {
    test('should return filtered exercises when online', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => true);
      when(mockRemoteSource.getExercisesByFilter(any)).thenAnswer((_) async => [tExerciseDto]);
      // act
      final result = await repo.getExercisesByFilter('push');
      // assert
      expect(result.isRight(), isTrue);
    });

    test('should return OfflineFailure when offline', () async {
      // arrange
      when(mockInternet.hasConnection).thenAnswer((_) async => false);
      // act
      final result = await repo.getExercisesByFilter('push');
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
      expect(result, isA<Right<Failure, List<ExerciseV2>>>());
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
