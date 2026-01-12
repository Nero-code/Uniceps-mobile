import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_sets_local_source.dart';
import 'package:uniceps/app/data/stores/routine/routine_sets_repo.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'routine_sets_repo_test.mocks.dart';

@GenerateMocks([IRoutineSetsLocalSourceContract, Logger])
void main() {
  late RoutineSetsRepo repo;
  late MockIRoutineSetsLocalSourceContract mockLocalSource;
  late MockLogger mockLogger;

  setUp(() {
    mockLocalSource = MockIRoutineSetsLocalSourceContract();
    mockLogger = MockLogger();
    repo = RoutineSetsRepo(localSource: mockLocalSource, logger: mockLogger);
    repo.lazyItemSetsBuffer.clear();
  });

  final tRoutineSet = const RoutineSet(
    id: 1,
    routineItemId: 1,
    index: 0,
    reps: 10,
    isSynced: false,
    version: 1,
    apiId: 1,
    weight: 10.0,
  );
  final tRoutineSetDto = RoutineSetDto.fromEntity(tRoutineSet);
  const tItemId = 1;

  group('getItemSets', () {
    test('should return item sets from local source', () async {
      // arrange
      when(mockLocalSource.getItemSets(tItemId)).thenAnswer((_) async => [tRoutineSetDto]);
      // act
      final result = await repo.getItemSets(tItemId);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, [tRoutineSet]));
      expect(repo.lazyItemSetsBuffer[tItemId], [tRoutineSet]);
    });

    test('should return DatabaseFailure on exception', () async {
      // arrange
      when(mockLocalSource.getItemSets(tItemId)).thenThrow(Exception());
      // act
      final result = await repo.getItemSets(tItemId);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('addItemSets', () {
    test('should add item set and return updated list', () async {
      // arrange
      when(mockLocalSource.addSets(any)).thenAnswer((_) async => [tRoutineSetDto]);
      repo.lazyItemSetsBuffer[tItemId] = [];
      // act
      final result = await repo.addItemSets(tItemId);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, [tRoutineSet]));
      expect(repo.lazyItemSetsBuffer[tItemId], [tRoutineSet]);
    });

    test('should return DatabaseFailure on exception', () async {
      // arrange
      when(mockLocalSource.addSets(any)).thenThrow(Exception());
      // act
      final result = await repo.addItemSets(tItemId);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('updateSet', () {
    test('should update set and return updated list', () async {
      // arrange
      repo.lazyItemSetsBuffer[tItemId] = [tRoutineSet];
      final updatedSet = tRoutineSet.copyWith(reps: 12);
      when(mockLocalSource.updateSet(any)).thenAnswer((_) async => RoutineSetDto.fromEntity(updatedSet));
      // act
      final result = await repo.updateSet(updatedSet);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, [updatedSet]));
      expect(repo.lazyItemSetsBuffer[tItemId]?.first.reps, 12);
    });

    test('should return DatabaseFailure on exception', () async {
      // arrange
      when(mockLocalSource.updateSet(any)).thenThrow(Exception());
      // act
      final result = await repo.updateSet(tRoutineSet);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('removeItemSet', () {
    test('should remove set and return updated list', () async {
      // arrange
      final tRoutineSet2 = tRoutineSet.copyWith(id: 2, index: 1);
      repo.lazyItemSetsBuffer[tItemId] = [tRoutineSet, tRoutineSet2];
      when(mockLocalSource.removeSets(any)).thenAnswer((_) async => 1);
      when(mockLocalSource.saveAllSets(any)).thenAnswer((_) async => []);
      // act
      final result = await repo.removeItemSet(tRoutineSet);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, [tRoutineSet2.copyWith(index: 0)]));
      expect(repo.lazyItemSetsBuffer[tItemId]?.first.id, 2);
    });

    test('should return DatabaseFailure on exception', () async {
      // arrange
      when(mockLocalSource.removeSets(any)).thenThrow(Exception());
      // act
      final result = await repo.removeItemSet(tRoutineSet);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('removeAllItemSets', () {
    test('should remove all sets for an item', () async {
      // arrange
      repo.lazyItemSetsBuffer[tItemId] = [tRoutineSet];
      // act
      final result = await repo.removeAllItemSets(tItemId);
      // assert
      expect(result, const Right(unit));
      expect(repo.lazyItemSetsBuffer.containsKey(tItemId), isFalse);
    });

    test('should return Right(unit) if item not in buffer', () async {
      // act
      final result = await repo.removeAllItemSets(tItemId);
      // assert
      expect(result, const Right(unit));
    });
  });
}
