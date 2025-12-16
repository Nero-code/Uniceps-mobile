import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/services/import/file_parse_service.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/data/stores/routine/routine_with_heat_repo.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';

import 'routine_with_heat_repo_test.mocks.dart';

@GenerateMocks([IRoutineManagementLocalSourceContract, UniFileManager, MediaHelper, Logger])
void main() {
  late RoutineWithHeatRepo repo;
  late MockIRoutineManagementLocalSourceContract mockLocalSource;
  late MockUniFileManager mockUniFileManager;
  late MockMediaHelper mockMediaHelper;
  late MockLogger mockLogger;
  late Routine tRoutine;
  late RoutineDto tRoutineDto;
  late ({Routine routine, RoutineHeat heat}) tRoutineWithHeat;

  setUp(() {
    mockLocalSource = MockIRoutineManagementLocalSourceContract();
    mockUniFileManager = MockUniFileManager();
    mockMediaHelper = MockMediaHelper();
    mockLogger = MockLogger();
    repo = RoutineWithHeatRepo(
      localSource: mockLocalSource,
      fileParseService: mockUniFileManager,
      mediaHelper: mockMediaHelper,
      logger: mockLogger,
    );
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
    tRoutineWithHeat = (routine: tRoutine, heat: RoutineHeat.cold(tRoutine.name));
    repo.routines.clear();
  });

  group('getAllRoutinesWithHeat', () {
    test('should get routines with heat from local source', () async {
      // arrange
      when(
        mockLocalSource.getAllRoutinesWithHeat(),
      ).thenAnswer((_) async => [(routine: tRoutineDto, heat: RoutineHeat.cold(tRoutineDto.name))]);
      // act
      final result = await repo.getAllRoutinesWithHeat();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) {
        expect(r, isA<List<({RoutineHeat heat, Routine routine})>>());
        expect(r.first.routine.id, tRoutine.id);
      });
      expect(repo.routines, isNotEmpty);
    });
  });

  group('createRoutine', () {
    test('should create routine and add to list', () async {
      // arrange
      when(mockLocalSource.createRoutine(any)).thenAnswer((_) async => tRoutineDto);
      // act
      final result = await repo.createRoutine('New Routine');
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) => expect(r.first.routine.id, tRoutine.id));
      expect(repo.routines, isNotEmpty);
    });
  });

  group('updateRoutine', () {
    test('should update routine in list', () async {
      // arrange
      repo.routines.add(tRoutineWithHeat);
      final updatedRoutine = tRoutine.copyWith(name: 'Updated');
      when(mockLocalSource.updateRoutine(any)).thenAnswer((_) async => RoutineDto.fromEntity(updatedRoutine));

      // act
      final result = await repo.updateRoutine(updatedRoutine);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) => expect(r.first.routine.name, 'Updated'));
      expect(repo.routines.first.routine.name, 'Updated');
    });
  });

  group('setCurrentRoutine', () {
    test('should set current routine in list', () async {
      // arrange
      repo.routines.add(tRoutineWithHeat);
      when(mockLocalSource.setCurrentRoutine(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.setCurrentRoutine(tRoutine);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) => expect(r.first.routine.isCurrent, isTrue));
      expect(repo.routines.first.routine.isCurrent, isTrue);
    });
  });

  group('deleteRoutine', () {
    test('should delete routine from list', () async {
      // arrange
      repo.routines.add(tRoutineWithHeat);
      when(mockLocalSource.deleteRoutine(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.deleteRoutine(tRoutine);
      // assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Expected Right, got $l'), (r) => expect(r, isEmpty));
      expect(repo.routines, isEmpty);
    });
  });
}
