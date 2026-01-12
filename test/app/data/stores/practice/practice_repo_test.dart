import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/practice_models/extensions.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/stores/practice/practice_repo.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'practice_repo_test.mocks.dart';

@GenerateMocks([ITSessionLocalSourceContract])
void main() {
  late PracticeRepo repo;
  late MockITSessionLocalSourceContract mockLocalSource;

  setUp(() {
    mockLocalSource = MockITSessionLocalSourceContract();
    repo = PracticeRepo(localSource: mockLocalSource);
  });

  final tRoutine = Routine(
    id: 1,
    apiId: 1,
    version: 1,
    name: 'Test Routine',
    description: 'Test Description',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    trainingDays: const [],
    isSynced: false,
  );
  final tRoutineDto = RoutineDto.fromEntity(tRoutine);
  final tRoutineDay = RoutineDay(id: 1, routineId: 1, name: 'Day 1', index: 0, exercises: []);
  final tRoutineDayDto = RoutineDayDto.fromEntity(tRoutineDay);
  final tSession = TSession(
    id: 1,
    dayId: 1,
    dayName: 'Day 1',
    logs: const [],
    apiId: 1,
    createdAt: DateTime.now(),
    finishedAt: DateTime.now().add(const Duration(minutes: 30)),
  );
  final tSessionModel = TSessionModel.fromEntity(tSession);
  final tLog = TLog(
    id: 1,
    sessionId: 1,
    exerciseId: 1,
    exerciseIndex: 0,
    setIndex: 0,
    reps: 10,
    weight: 100,
    completedAt: DateTime.now(),
    apiId: 1,
  );
  final tLogModel = tLog.toDto();
  final tRoutineHeat = RoutineHeat.cold('Test Routine');

  group('getCurrentRoutine', () {
    test('should get current routine from local source', () async {
      // arrange
      when(mockLocalSource.getCurrentRoutine()).thenAnswer((_) async => Tuple2(tRoutineDto, 1));
      // act
      final result = await repo.getCurrentRoutine();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) {
        expect(r.head.id, tRoutine.id);
        expect(r.tail, 1);
      });
    });

    test('should return EmptyCacheFailure when no routine is found', () async {
      // arrange
      when(mockLocalSource.getCurrentRoutine()).thenAnswer((_) async => const Tuple2(null, null));
      // act
      final result = await repo.getCurrentRoutine();
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<EmptyCacheFailure>()), (r) => fail('Expected Left, got \$r'));
    });
  });

  group('getPracticeDay', () {
    test('should get practice day from local source', () async {
      // arrange
      when(mockLocalSource.getPracticeDay(any)).thenAnswer((_) async => tRoutineDayDto);
      // act
      final result = await repo.getPracticeDay(1);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) => expect(r.id, tRoutineDay.id));
    });
  });

  group('getPreviousSession', () {
    test('should get previous session from local source', () async {
      // arrange
      when(mockLocalSource.getPreviousSession()).thenAnswer((_) async => tSessionModel);
      // act
      final result = await repo.getPreviousSession();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) => expect(r.id, tSession.id));
    });
  });

  group('startTrainingSession', () {
    test('should start a new training session', () async {
      // arrange
      when(mockLocalSource.startTrainingSession(any, any)).thenAnswer((_) async => tSessionModel);
      // act
      final result = await repo.startTrainingSession(1, 'Day 1');
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) => expect(r.id, tSession.id));
    });
  });

  group('logSetComplete', () {
    test('should log a completed set', () async {
      // arrange
      repo.startTrainingSession(1, 'Day 1');
      when(mockLocalSource.startTrainingSession(any, any)).thenAnswer((_) async => tSessionModel);
      when(mockLocalSource.logSet(any, any)).thenAnswer((_) async => tLogModel);
      await repo.startTrainingSession(1, 'Day 1');
      // act
      final result = await repo.logSetComplete(tLog, 0.1);
      // assert
      expect(result.isRight(), isTrue);
    });

    test('should return EmptyCacheFailure if no session is started', () async {
      // act
      final result = await repo.logSetComplete(tLog, 0.1);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<EmptyCacheFailure>()), (r) => fail('Expected Left, got \$r'));
    });
  });

  group('finishTrainingSession', () {
    test('should finish the training session', () async {
      // arrange
      when(mockLocalSource.finishTrainingSession(any, any)).thenAnswer((_) async => unit);
      // act
      final result = await repo.finishTrainingSession(tSession, true);
      // assert
      expect(result, const Right(unit));
    });
  });

  group('getCurrentRoutineWithHeat', () {
    test('should get current routine with heat from local source', () async {
      // arrange
      when(mockLocalSource.getCurrentRoutineWithHeat()).thenAnswer((_) async => Tuple2(tRoutineDto, tRoutineHeat));
      // act
      final result = await repo.getCurrentRoutineWithHeat();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got \$l'), (r) {
        expect(r.head.id, tRoutine.id);
        expect(r.tail, tRoutineHeat);
      });
    });
  });
}
