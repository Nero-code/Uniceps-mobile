import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_commands.dart';
// import 'package:uniceps/app/domain/contracts/routine_repo/i_routine_management_contract.dart';
import 'routine_management_test.mocks.dart';

final mockRoutine1 = Routine(
    id: 0,
    apiId: null,
    version: 0,
    name: "routine 1",
    description: "description",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    trainingDays: [],
    isSynced: false);

final mockRoutine2 = Routine(
    id: 1,
    apiId: null,
    version: 0,
    name: "routine 2",
    description: "description",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    trainingDays: [],
    isSynced: false);

final mockRoutines = [mockRoutine1, mockRoutine2];

// @GenerateMocks([IRoutineManagementContract])
void main() {
  group('Routine Management Commands Tests', () {
    late MockIRoutineManagementContract mockRepo;
    late RoutineManagementCommands commands;

    setUp(() {
      mockRepo = MockIRoutineManagementContract();
      commands = RoutineManagementCommands(repo: mockRepo);
    });

    test('getAllRoutines - success scenario', () async {
      when(mockRepo.getAllRoutines())
          .thenAnswer((_) async => Right(mockRoutines));

      final result = await commands.getAllRoutines();

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success, got failure'),
        (routines) => expect(routines, equals(mockRoutines)),
      );
    });

    test('createRoutine - success scenario', () async {
      final newRoutine = Routine(
          id: 2,
          apiId: null,
          version: 0,
          name: "Morning Routine",
          description: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          trainingDays: [],
          isSynced: false);

      when(mockRepo.createRoutine('Morning Routine'))
          .thenAnswer((_) async => Right([...mockRoutines, newRoutine]));

      final result = await commands.createRoutine('Morning Routine');

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success, got failure'),
        (routines) {
          expect(routines.length, equals(mockRoutines.length + 1));
          expect(routines[2].name, equals("Morning Routine"));
        },
      );
    });

    test('updateRoutine - success scenario', () async {
      final updatedRoutine = Routine(
        id: 1,
        apiId: null,
        version: 0,
        name: "New Routine",
        description: "description",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        trainingDays: [],
        isSynced: false,
      );

      mockRoutines[1] = updatedRoutine;
      when(mockRepo.updateRoutine(updatedRoutine))
          .thenAnswer((_) async => Right(mockRoutines));

      final result = await commands.updateRoutine(updatedRoutine);

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success, got failure'),
        (routines) {
          expect(routines.length, equals(mockRoutines.length));
          expect(routines[1].name, equals(mockRoutines[1].name));
          expect(routines[1].name, equals("New Routine"));
        },
      );
    });

    test('deleteRoutine - success scenario', () async {
      when(mockRepo.deleteRoutine(mockRoutines[1]))
          .thenAnswer((_) async => Right(mockRoutines));

      final result = await commands.deleteRoutine(mockRoutines[1]);

      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success, got failure'),
        (routines) => expect(routines.length, equals(mockRoutines.length)),
      );
    });
  });
}
