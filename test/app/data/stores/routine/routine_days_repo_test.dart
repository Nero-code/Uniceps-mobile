import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_days_local_source.dart';
import 'package:uniceps/app/data/stores/routine/routine_days_repo.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'routine_days_repo_test.mocks.dart';

@GenerateMocks([IRoutineDaysLocalSourceContract, Logger])
void main() {
  late RoutineDaysRepo repo;
  late MockIRoutineDaysLocalSourceContract mockLocalSource;
  late MockLogger mockLogger;

  setUp(() {
    mockLocalSource = MockIRoutineDaysLocalSourceContract();
    mockLogger = MockLogger();
    repo = RoutineDaysRepo(localSource: mockLocalSource, logger: mockLogger);
  });

  final tRoutineDay = RoutineDay(id: 1, routineId: 1, name: 'Day 1', index: 0, exercises: []);
  final tRoutineDayDto = RoutineDayDto.fromEntity(tRoutineDay);

  group('getDaysUnderRoutine', () {
    test('should return list of RoutineDay from local source', () async {
      // arrange
      when(mockLocalSource.getDays(any)).thenAnswer((_) async => [tRoutineDayDto]);
      // act
      final result = await repo.getDaysUnderRoutine(1);
      // assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Expected Right, got Left: $l'), (r) => expect(r.length, 1));
      expect(repo.currentRoutineDays.length, 1);
    });

    test('should return EmptyCacheFailure on exception', () async {
      // arrange
      when(mockLocalSource.getDays(any)).thenThrow(Exception());
      // act
      final result = await repo.getDaysUnderRoutine(1);
      // assert
      expect(result, isA<Left<Failure, List<RoutineDay>>>());
    });
  });

  group('addDay', () {
    test('should add day and return updated list', () async {
      // arrange
      when(mockLocalSource.addDay(any)).thenAnswer((_) async => tRoutineDayDto);
      // act
      final result = await repo.addDay(tRoutineDay);
      // assert
      expect(result.isRight(), true);
      expect(repo.currentRoutineDays.length, 1);
    });

    test('should return DatabaseFailure on exception', () async {
      // arrange
      when(mockLocalSource.addDay(any)).thenThrow(Exception());
      // act
      final result = await repo.addDay(tRoutineDay);
      // assert
      expect(result, isA<Left<Failure, List<RoutineDay>>>());
    });
  });

  group('removeDay', () {
    test('should remove day and reorder remaining', () async {
      // arrange
      repo.currentRoutineDays.addAll([tRoutineDay, tRoutineDay.copyWith(id: 2, index: 1)]);
      when(mockLocalSource.removeDay(any)).thenAnswer((_) async => 1);
      when(mockLocalSource.saveOrder(any)).thenAnswer((_) async => []);
      // act
      final result = await repo.removeDay(tRoutineDay);
      // assert
      expect(result.fold((l) => l, (r) => r.length), 1);
      expect(repo.currentRoutineDays.first.index, 0);
    });
  });

  group('renameDay', () {
    test('should rename day and return updated list', () async {
      // arrange
      repo.currentRoutineDays.add(tRoutineDay);
      final renamedDay = tRoutineDay.copyWith(name: 'New Name');
      when(mockLocalSource.renameDay(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.renameDay(renamedDay);
      // assert
      expect(result.isRight(), true);
      expect(repo.currentRoutineDays.first.name, 'New Name');
    });
  });

  group('reorderDays', () {
    test('should reorder days and return updated list', () async {
      // arrange
      final reorderedList = [tRoutineDay.copyWith(id: 2, index: 0), tRoutineDay.copyWith(id: 1, index: 1)];
      when(
        mockLocalSource.saveOrder(any),
      ).thenAnswer((_) async => reorderedList.map((e) => RoutineDayDto.fromEntity(e)).toList());
      // act
      final result = await repo.reorderDays(reorderedList);
      // assert
      expect(result.fold((l) => l, (r) => r.length), 2);
      expect(repo.currentRoutineDays.first.id, 2);
    });
  });
}
