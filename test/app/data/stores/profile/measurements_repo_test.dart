import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/stores/profile/measurements_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'measurements_repo_test.mocks.dart';

@GenerateMocks([IMeasurementsLocalSource, Logger])
void main() {
  late MeasurementsRepo repo;
  late MockIMeasurementsLocalSource mockLocalSource;
  late MockLogger mockLogger;
  late Measurement tMeasurement;
  late MeasurementModel tMeasurementModel;

  setUp(() {
    mockLocalSource = MockIMeasurementsLocalSource();
    mockLogger = MockLogger();
    repo = MeasurementsRepo(localSource: mockLocalSource, logger: mockLogger);
    repo.buffer.clear();

    tMeasurement = Measurement(
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
    );
    tMeasurementModel = MeasurementModel.fromEntity(tMeasurement);
  });

  group('getMeasurements', () {
    test('should return measurements from buffer if not empty', () async {
      // arrange
      repo.buffer.add(tMeasurement);
      // act
      final result = await repo.getMeasurements();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r.first.id, tMeasurement.id));
      verifyZeroInteractions(mockLocalSource);
    });

    test('should return measurements from local source if buffer is empty', () async {
      // arrange
      when(mockLocalSource.getMeasurements()).thenAnswer((_) async => [tMeasurementModel]);
      // act
      final result = await repo.getMeasurements();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r.first.id, tMeasurement.id));
      verify(mockLocalSource.getMeasurements());
      expect(repo.buffer.first.id, tMeasurement.id);
    });

    test('should return noRecords failure when local source is empty', () async {
      // arrange
      when(mockLocalSource.getMeasurements()).thenAnswer((_) async => []);
      // act
      final result = await repo.getMeasurements();
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, const MeasurementFailure.noRecords()), (r) => fail('Expected Left, got Right: \$r'));
    });

    test('should return msDbFailure on local source exception', () async {
      // arrange
      when(mockLocalSource.getMeasurements()).thenThrow(Exception());
      // act
      final result = await repo.getMeasurements();
      // assert
      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, const MeasurementFailure.msDbFailure()),
        (r) => fail('Expected Left, got Right: \$r'),
      );
    });
  });

  group('createMeasurement', () {
    test('should create measurement and add to buffer', () async {
      // arrange
      when(mockLocalSource.saveMeasurement(any)).thenAnswer((_) async => 2);
      // act
      final result = await repo.createMeasurement(tMeasurement.copyWith(id: 0));
      // assert
      expect(result, const Right(unit));
      expect(repo.buffer.first.id, 2);
    });

    test('should return msDbFailure on exception', () async {
      // arrange
      when(mockLocalSource.saveMeasurement(any)).thenThrow(Exception());
      // act
      final result = await repo.createMeasurement(tMeasurement);
      // assert
      expect(result, const Left(MeasurementFailure.msDbFailure()));
    });
  });

  group('updateMeasurement', () {
    test('should update measurement and buffer', () async {
      // arrange
      repo.buffer.add(tMeasurement);
      final updatedMeasurement = tMeasurement.copyWith(lArm: 32);
      when(mockLocalSource.saveMeasurement(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.updateMeasurement(updatedMeasurement);
      // assert
      expect(result, const Right(unit));
      expect(repo.buffer.first.lArm, 32);
    });

    test('should return msDbFailure on exception', () async {
      // arrange
      when(mockLocalSource.saveMeasurement(any)).thenThrow(Exception());
      // act
      final result = await repo.updateMeasurement(tMeasurement);
      // assert
      expect(result, const Left(MeasurementFailure.msDbFailure()));
    });
  });

  group('deleteMeasurement', () {
    test('should delete measurement and remove from buffer', () async {
      // arrange
      repo.buffer.add(tMeasurement);
      when(mockLocalSource.deleteMeasurement(any)).thenAnswer((_) async => 1);
      // act
      final result = await repo.deleteMeasurement(tMeasurement);
      // assert
      expect(result, const Right(unit));
      expect(repo.buffer, isEmpty);
    });

    test('should return msDbFailure on exception', () async {
      // arrange
      when(mockLocalSource.deleteMeasurement(any)).thenThrow(Exception());
      // act
      final result = await repo.deleteMeasurement(tMeasurement);
      // assert
      expect(result, const Left(MeasurementFailure.msDbFailure()));
    });
  });
}
