import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_items_local_source.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/data/stores/routine/routine_items_repo.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'routine_items_repo_test.mocks.dart';

@GenerateMocks([IRoutineItemsLocalSourceContract, MediaHelper])
void main() {
  late RoutineItemsRepo repo;
  late MockIRoutineItemsLocalSourceContract mockLocalSource;
  late MockMediaHelper mockMediaHelper;

  setUp(() {
    mockLocalSource = MockIRoutineItemsLocalSourceContract();
    mockMediaHelper = MockMediaHelper();
    repo = RoutineItemsRepo(localSource: mockLocalSource, mediaHelper: mockMediaHelper);
    repo.itemsBuffer.clear();
    repo.loadedDays.clear();
  });

  final tExercise = ExerciseV2(
    apiId: 1,
    name: 'Test Exercise',
    muscleGroupTranslations: const {Lang.en: 'Chest'},
    imageUrl: 'test_url',
    imageBitMap: Uint8List(0),
  );

  final tRoutineItem = RoutineItem(
    id: 1,
    apiId: 1,
    dayId: 1,
    index: 0,
    version: 1,
    exercise: tExercise,
    sets: const [],
    isSynced: false,
  );

  final tRoutineItemDto = RoutineItemDto.fromEntity(tRoutineItem);
  const tDayId = 1;

  group('getItemsUnderDay', () {
    test('should get items from local source if day not loaded', () async {
      // arrange
      when(mockLocalSource.getItemsByDay(tDayId)).thenAnswer((_) async => [tRoutineItemDto]);
      // act
      final result = await repo.getItemsUnderDay(tDayId);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) {
        expect(r, isA<List<RoutineItem>>());
        expect(r.first.id, tRoutineItem.id);
      });
      expect(repo.itemsBuffer.first.id, tRoutineItem.id);
      expect(repo.loadedDays, contains(tDayId));
    });

    test('should return items from buffer if day is loaded', () async {
      // arrange
      when(mockLocalSource.getItemsByDay(any)).thenAnswer((_) async => [tRoutineItemDto]);
      repo.itemsBuffer.add(tRoutineItem);
      repo.loadedDays.add(tDayId);
      // act
      final result = await repo.getItemsUnderDay(tDayId);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r.first.id, tRoutineItem.id));
    });

    test('should return a DatabaseFailure on local source exception', () async {
      // arrange
      when(mockLocalSource.getItemsByDay(any)).thenThrow(Exception());
      // act
      final result = await repo.getItemsUnderDay(tDayId);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('addItems', () {
    test('should add items and return updated list', () async {
      // arrange
      when(mockLocalSource.addItems(any)).thenAnswer((_) async => [tRoutineItemDto]);
      // act
      final result = await repo.addItems(tDayId, [tExercise]);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r.first.exercise.name, tExercise.name));
      expect(repo.itemsBuffer, isNotEmpty);
    });

    test('should return a DatabaseFailure on local source exception', () async {
      // arrange
      when(mockLocalSource.addItems(any)).thenThrow(Exception());
      // act
      final result = await repo.addItems(tDayId, [tExercise]);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('reorderItems', () {
    test('should reorder items and return updated list', () async {
      // arrange
      repo.itemsBuffer.add(tRoutineItem);
      final reorderedItem = tRoutineItem.copyWith(index: 1);
      when(mockLocalSource.reorderItems(any)).thenAnswer((_) async => [RoutineItemDto.fromEntity(reorderedItem)]);
      // act
      final result = await repo.reorderItems([reorderedItem]);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r.first.index, 1));
    });

    test('should return a DatabaseFailure on local source exception', () async {
      // arrange
      when(mockLocalSource.reorderItems(any)).thenThrow(Exception());
      // act
      final result = await repo.reorderItems([]);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('removeItem', () {
    test('should remove item and return updated list', () async {
      // arrange
      repo.itemsBuffer.add(tRoutineItem);
      when(mockLocalSource.removeItem(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.removeItem(tRoutineItem);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, isEmpty));
      expect(repo.itemsBuffer, isEmpty);
    });

    test('should return a DatabaseFailure on local source exception', () async {
      // arrange
      when(mockLocalSource.removeItem(any)).thenThrow(Exception());
      // act
      final result = await repo.removeItem(tRoutineItem);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });

  group('removeDayItems', () {
    test('should remove all items for a day from buffer', () async {
      // arrange
      repo.itemsBuffer.add(tRoutineItem);
      // act
      final result = await repo.removeDayItems(tDayId);
      // assert
      expect(result, const Right(unit));
      expect(repo.itemsBuffer, isEmpty);
    });
  });

  group('copySetsToAll', () {
    test('should call local source to copy sets', () async {
      // arrange
      when(mockLocalSource.copySetsToAll(any, any)).thenAnswer((_) async => unit);
      // act
      final result = await repo.copySetsToAll(tDayId, tRoutineItem.id!);
      // assert
      expect(result, const Right(unit));
      verify(mockLocalSource.copySetsToAll(tDayId, tRoutineItem.id!));
    });

    test('should return DatabaseFailure on exception', () async {
      // arrange
      when(mockLocalSource.copySetsToAll(any, any)).thenThrow(Exception());
      // act
      final result = await repo.copySetsToAll(tDayId, tRoutineItem.id!);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
    });
  });
}
