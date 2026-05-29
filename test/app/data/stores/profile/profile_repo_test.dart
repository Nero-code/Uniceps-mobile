import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/auth_models/profile_model.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_profile/profile_remote_source.dart';
import 'package:uniceps/app/data/stores/profile/profile_repo.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'profile_repo_test.mocks.dart';

@GenerateMocks([IProfileLocalSource, IProfileRemoteSource])
void main() {
  late ProfileRepo repo;
  late MockIProfileLocalSource mockLocalSource;
  late MockIProfileRemoteSource mockRemoteSource;
  late Profile tPlayer;
  late ProfileModel tPlayerModel;

  setUp(() {
    mockLocalSource = MockIProfileLocalSource();
    mockRemoteSource = MockIProfileRemoteSource();
    repo = ProfileRepo(
      localSource: mockLocalSource,
      remoteSource: mockRemoteSource,
      networkInfo: NetworkInfo(internetConnection: InternetConnection.createInstance()),
    );

    tPlayer = Profile(name: 'Test Player', gender: Gender.male, birthDate: DateTime.now());
    tPlayerModel = ProfileModel.fromEntity(tPlayer);
  });

  group('getProfile', () {
    test('should return a Player when the call to local source is successful', () async {
      // arrange
      when(mockLocalSource.getProfileData()).thenAnswer((_) async => tPlayerModel);
      // act
      final result = await repo.getProfile();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r.name, tPlayer.name));
      verify(mockLocalSource.getProfileData());
      verifyNoMoreInteractions(mockLocalSource);
    });

    test('should return an EmptyCacheFailure when the local source is empty', () async {
      // arrange
      when(mockLocalSource.getProfileData()).thenThrow(Exception());
      // act
      final result = await repo.getProfile();
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<EmptyCacheFailure>()), (r) => fail('Expected Left, got Right: \$r'));
      verify(mockLocalSource.getProfileData());
      verifyNoMoreInteractions(mockLocalSource);
    });
  });

  group('saveProfile', () {
    test('should return Right(unit) when the call to local source is successful', () async {
      // arrange
      when(mockLocalSource.saveProfileData(any)).thenAnswer((_) async => unit);
      // act
      final result = await repo.saveProfile(tPlayer);
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, unit));
      verify(mockLocalSource.saveProfileData(any));
      verifyNoMoreInteractions(mockLocalSource);
    });

    test('should return a DatabaseFailure when the call to local source is unsuccessful', () async {
      // arrange
      when(mockLocalSource.saveProfileData(any)).thenThrow(Exception());
      // act
      final result = await repo.saveProfile(tPlayer);
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
      verify(mockLocalSource.saveProfileData(any));
      verifyNoMoreInteractions(mockLocalSource);
    });
  });
}
