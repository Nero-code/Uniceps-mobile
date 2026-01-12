import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/stores/performance/performance_repo.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'performance_repo_test.mocks.dart';

@GenerateMocks([
  IProfileLocalSource,
  IRoutineManagementLocalSourceContract,
  ITSessionLocalSourceContract,
  IMeasurementsLocalSource,
])
void main() {
  late PerformanceRepo repo;
  late MockIProfileLocalSource mockProfileSource;
  late MockIRoutineManagementLocalSourceContract mockRoutineSource;
  late MockITSessionLocalSourceContract mockSessionSource;
  late MockIMeasurementsLocalSource mockMeasurementSource;

  setUp(() {
    mockProfileSource = MockIProfileLocalSource();
    mockRoutineSource = MockIRoutineManagementLocalSourceContract();
    mockSessionSource = MockITSessionLocalSourceContract();
    mockMeasurementSource = MockIMeasurementsLocalSource();
    repo = PerformanceRepo(
      profileLocalSource: mockProfileSource,
      routineLocalSource: mockRoutineSource,
      tSessionsLocalSource: mockSessionSource,
      measurementsLocalSource: mockMeasurementSource,
    );
  });

  final tSessionModel = TSessionModel(
    id: 1,
    dayId: 1,
    dayName: 'Day 1',
    logs: [
      TLogModel(
        id: 0,
        sessionId: 1,
        exerciseId: 1,
        exerciseIndex: 0,
        setIndex: 0,
        reps: 5,
        weight: 5,
        completedAt: DateTime.now(),
      ),
    ],
    createdAt: DateTime.now(),
    finishedAt: DateTime.now().add(const Duration(hours: 1)),
    progress: 1.0,
    apiId: null,
    version: 1,
    isSynced: false,
  );

  group('getSessionsReport', () {
    test('should return a SessionsReport', () async {
      // arrange
      when(mockSessionSource.getSessionsByRoutine(any)).thenAnswer((_) async => [tSessionModel]);
      // act
      final result = await repo.getSessionsReport(1);
      // assert
      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => throw Exception()), isA<SessionsReport>());
    });
  });

  group('getLogsReport', () {
    test('should return a LogsReport', () async {
      // arrange
      repo.sessionsBuffer.addAll({
        1: [tSessionModel.toEntity()],
      });
      when(mockSessionSource.getSessionsByRoutine(any)).thenAnswer((_) async => [tSessionModel]);
      await repo.getSessionsReport(1);
      // act
      final result = await repo.getLogsReport(1);
      // assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Expected Right, got Left: $l'), (r) => expect(r, isA<LogsReport>()));
    });

    test('should return noValues failure when no sessions are buffered', () async {
      // act
      final result = await repo.getLogsReport(1);
      // assert
      expect(result, const Left(PerformanceFailure.noValues()));
    });
  });

  group('getPhysicalReport', () {
    test('should return a PhysicalReport', () async {
      // arrange
      when(
        mockProfileSource.getProfileData(),
      ).thenAnswer((_) async => PlayerModel(name: '', birthDate: DateTime.now(), gender: Gender.male));
      when(mockMeasurementSource.getMeasurements()).thenAnswer(
        (_) async => [
          MeasurementModel(
            id: 1,
            apiId: 1,
            height: 1,
            weight: 1,
            lArm: 1,
            rArm: 1,
            lHumerus: 1,
            rHumerus: 1,
            lLeg: 1,
            rLeg: 1,
            lThigh: 1,
            rThigh: 1,
            neck: 1,
            shoulders: 1,
            waist: 1,
            chest: 1,
            hips: 1,
            checkDate: DateTime.now(),
            version: 1,
            isSynced: false,
          ),
        ],
      );
      // act
      final result = await repo.getPhysicalReport();
      // assert
      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => throw Exception()), isA<PhysicalReport>());
    });

    test('should return noValues failure when measurements are empty', () async {
      // arrange
      when(
        mockProfileSource.getProfileData(),
      ).thenAnswer((_) async => PlayerModel(name: '', birthDate: DateTime.now(), gender: Gender.male));
      when(mockMeasurementSource.getMeasurements()).thenAnswer((_) async => []);
      // act
      final result = await repo.getPhysicalReport();
      // assert
      expect(result, const Left(PerformanceFailure.noValues()));
    });
  });
}
