import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_days_commands.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_days_contract.dart';

import 'routine_days_test.mocks.dart';

const fakeDay1 =
    RoutineDay(routineId: 0, name: "Day 1", index: 0, exercises: []);
const fakeDay2 =
    RoutineDay(routineId: 0, name: "Day 2", index: 1, exercises: []);

final fakeDays = [fakeDay1, fakeDay2];

@GenerateMocks([IRoutineDaysContract])
void main() {
  group('Routine Days Commands Tests', () {
    late MockIRoutineDaysContract mockRepo;
    late RoutineDaysCommands commands;

    setUp(() {
      mockRepo = MockIRoutineDaysContract();
      commands = RoutineDaysCommands(repo: mockRepo);
    });

    test('getDaysUnderRoutine - success scenario', () async {
      when(mockRepo.getDaysUnderRoutine(0))
          .thenAnswer((_) async => Right(fakeDays));

      final either = await commands.getDaysUnderRoutine(0);

      expect(either.isRight(), true);
      either.fold(
        (l) => fail("Expected success, got failure!"),
        (days) {
          expect(days.length, equals(fakeDays.length));
          expect(days[0].routineId, equals(fakeDay1.routineId));
          expect(days[1].routineId, equals(fakeDay2.routineId));
        },
      );
    });

    test('addDay - success scenario', () async {
      const newDay =
          RoutineDay(routineId: 0, name: "Day 3", index: 2, exercises: []);
      when(mockRepo.addDay(newDay))
          .thenAnswer((_) async => Right([...fakeDays, newDay]));

      final either = await commands.addDay(newDay);

      expect(either.isRight(), true);
      either.fold(
        (l) => fail("Expected success, got failure!"),
        (days) {
          expect(days.length, equals(fakeDays.length + 1));
          expect(days[2].name, equals("Day 3"));
        },
      );
    });

    test('removeDay - success scenario', () async {
      when(mockRepo.removeDay(fakeDays[1]))
          .thenAnswer((_) async => Right([fakeDays[0]]));

      final either = await commands.removeDay(fakeDays[1]);

      expect(either.isRight(), true);
      either.fold(
        (l) => fail("Expected success, got failure!"),
        (days) => expect(days.length, equals(fakeDays.length - 1)),
      );
    });

    test('renameDay - success scenario', () async {
      const renamedDay =
          RoutineDay(routineId: 0, name: "Renamed", index: 1, exercises: []);
      when(mockRepo.renameDay(renamedDay))
          .thenAnswer((_) async => Right([fakeDays[0], renamedDay]));

      final either = await commands.renameDay(renamedDay);

      expect(either.isRight(), true);
      either.fold(
        (l) => fail("Expected success, got failure!"),
        (days) {
          expect(days.length, equals(fakeDays.length));
          expect(days[1].name, isNot(fakeDays[1].name));
          expect(days[1].name, equals("Renamed"));
        },
      );
    });

    test('reorderDays - success scenario', () async {
      when(mockRepo.reorderDays([fakeDays[1], fakeDays[0]]))
          .thenAnswer((_) async => Right([fakeDays[1], fakeDays[0]]));

      final either = await commands.reorderDays([fakeDays[1], fakeDays[0]]);

      expect(either.isRight(), true);
      either.fold(
        (l) => fail("Expected success, got failure!"),
        (days) {
          expect(days.length, equals(fakeDays.length));
          expect(days[0].name, equals(fakeDays[1].name));
          expect(days[1].name, equals(fakeDays[0].name));
        },
      );
    });
  });
}
