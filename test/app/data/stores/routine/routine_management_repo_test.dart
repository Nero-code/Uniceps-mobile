import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/services/internet_client/client_helper.dart';
import 'package:uniceps/app/data/stores/routine/routine_management_repo.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'routine_management_repo_test.mocks.dart';

@GenerateMocks([IRoutineManagementLocalSourceContract, InternetConnectionChecker, ClientHelper])
void main() {
  late RoutineManagementRepo repo;
  late MockIRoutineManagementLocalSourceContract mockLocalSource;
  late MockInternetConnectionChecker mockInternet;
  late MockClientHelper mockClientHelper;
  late Routine tRoutine;
  late RoutineDto tRoutineDto;

  setUp(() {
    mockLocalSource = MockIRoutineManagementLocalSourceContract();
    mockInternet = MockInternetConnectionChecker();
    mockClientHelper = MockClientHelper();
    repo = RoutineManagementRepo(localSource: mockLocalSource, internet: mockInternet, clientHelper: mockClientHelper);
    repo.routines.clear();
    tRoutine = Routine(
      id: 1,
      apiId: 1,
      version: 1,
      name: 'Test Routine',
      description: 'Test Description',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      trainingDays: const [],
      isSynced: false,
      isCurrent: false,
    );
    tRoutineDto = RoutineDto.fromEntity(tRoutine);
  });

  group('getAllRoutines', () {
    test('should get routines from local source', () async {
      // arrange
      when(mockLocalSource.getAllRoutines()).thenAnswer((_) async => [tRoutineDto]);
      // act
      final result = await repo.getAllRoutines();
      // assert
      expect(result.getOrElse(() => []), isA<List<Routine>>());
      expect(repo.routines, isNotEmpty);
    });

    test('should return EmptyCacheFailure when no routines are found', () async {
      // arrange
      when(mockLocalSource.getAllRoutines()).thenAnswer((_) async => []);
      // act
      final result = await repo.getAllRoutines();
      // assert
      expect(result, const Left(EmptyCacheFailure(errorMessage: "")));
    });
  });

  group('createRoutine', () {
    test('should create routine and add to list', () async {
      // arrange
      when(mockLocalSource.createRoutine(any)).thenAnswer((_) async => tRoutineDto);
      // act
      final result = await repo.createRoutine('New Routine');
      // assert
      expect(result.getOrElse(() => []), isA<List<Routine>>());
      expect(repo.routines, isNotEmpty);
    });
  });

  group('updateRoutine', () {
    test('should update routine in list', () async {
      // arrange
      repo.routines.add(tRoutine);
      final updatedRoutine = tRoutine.copyWith(name: 'Updated');
      when(mockLocalSource.updateRoutine(any)).thenAnswer((_) async => RoutineDto.fromEntity(updatedRoutine));
      // act
      final result = await repo.updateRoutine(updatedRoutine);
      // assert
      expect(result.getOrElse(() => []).first.name, 'Updated');
      expect(repo.routines.first.name, 'Updated');
    });
  });

  group('deleteRoutine', () {
    test('should delete routine from list', () async {
      // arrange
      repo.routines.add(tRoutine);
      when(mockLocalSource.deleteRoutine(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.deleteRoutine(tRoutine);
      // assert
      expect(result.isRight(), true);
      expect(repo.routines, isEmpty);
    });
  });

  group('setCurrentRoutine', () {
    test('should set current routine in list', () async {
      // arrange
      repo.routines.add(tRoutine);
      when(mockLocalSource.setCurrentRoutine(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.setCurrentRoutine(tRoutine);
      // assert
      expect(result.getOrElse(() => []).first.isCurrent, isTrue);
      expect(repo.routines.first.isCurrent, isTrue);
    });
  });
}
