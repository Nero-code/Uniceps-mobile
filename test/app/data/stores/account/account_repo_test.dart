import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/models/account_models/membership_model.dart';
import 'package:uniceps/app/data/sources/local/dal_account/account_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_account/account_remote_source.dart';
import 'package:uniceps/app/data/sources/services/token/token_service_simple.dart';
import 'package:uniceps/app/data/stores/account/account_repo.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'account_repo_test.mocks.dart';

@GenerateMocks([IAccountLocalSource, IAccountRemoteSource, InternetConnectionChecker, SimpleTokenService, Logger])
void main() {
  late AccountRepo repo;
  late MockIAccountLocalSource mockLocalSource;
  late MockIAccountRemoteSource mockRemoteSource;
  late MockInternetConnectionChecker mockConnection;
  late MockSimpleTokenService mockTokenService;
  late MockLogger mockLogger;

  setUp(() {
    mockLocalSource = MockIAccountLocalSource();
    mockRemoteSource = MockIAccountRemoteSource();
    mockConnection = MockInternetConnectionChecker();
    mockTokenService = MockSimpleTokenService();
    mockLogger = MockLogger();
    repo = AccountRepo(
      localSource: mockLocalSource,
      remoteSource: mockRemoteSource,
      checker: mockConnection,
      tokenService: mockTokenService,
      logger: mockLogger,
    );
  });

  final tAccountModel = AccountModel(
    uid: '1',
    email: 'test@example.com',
    createdAt: DateTime(2023, 1, 1),
    type: AccountType.normal,
  );
  final tAccount = tAccountModel.toEntity();

  final tMembershipModel = MembershipModel(
    planId: '1',
    planName: 'Test Plan',
    price: 9.99,
    startDate: DateTime(2023, 1, 1),
    endDate: DateTime(2023, 1, 31),
    isNotified: false,
    isActive: true,
    isGift: false,
  );
  final tMembership = tMembershipModel.toEntity();

  group('getUserAccount', () {
    test('should return an Account when the call to local source is successful', () async {
      // arrange
      when(mockLocalSource.getUserAccount()).thenAnswer((_) async => tAccountModel);
      // act
      final result = await repo.getUserAccount();
      // assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, tAccount));
      verify(mockLocalSource.getUserAccount());
      verifyNoMoreInteractions(mockLocalSource);
    });

    test('should return a DatabaseFailure when the call to local source is unsuccessful', () async {
      // arrange
      final errorMessage = 'Error getting account';
      when(mockLocalSource.getUserAccount()).thenThrow(Exception(errorMessage));
      // act
      final result = await repo.getUserAccount();
      // assert
      expect(result.isLeft(), isTrue);
      result.fold((l) => expect(l, isA<DatabaseFailure>()), (r) => fail('Expected Left, got Right: \$r'));
      verify(mockLocalSource.getUserAccount());
      verifyNoMoreInteractions(mockLocalSource);
    });
  });

  group('getUserMembership', () {
    test('should check for internet connection', () async {
      // arrange
      when(mockConnection.hasConnection).thenAnswer((_) async => true);
      when(mockRemoteSource.getUserMembership()).thenAnswer((_) async => tMembershipModel);
      when(mockLocalSource.saveUserMembership(any)).thenAnswer((_) async => true);
      // act
      await repo.getUserMembership();
      // assert
      verify(mockConnection.hasConnection);
    });

    group('when online', () {
      setUp(() {
        when(mockConnection.hasConnection).thenAnswer((_) async => true);
      });

      test('should return a Membership when the call to remote source is successful', () async {
        // arrange
        when(mockConnection.hasConnection).thenAnswer((_) async => true);
        when(mockRemoteSource.getUserMembership()).thenAnswer((_) async => tMembershipModel);
        when(mockLocalSource.saveUserMembership(any)).thenAnswer((_) async => true);
        // act
        final result = await repo.getUserMembership();
        // assert
        expect(result.isRight(), isTrue);
        result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, tMembership));
        verify(mockRemoteSource.getUserMembership());
        verify(mockLocalSource.saveUserMembership(tMembershipModel));
      });

      test('should return a MembershipFailure when the call to remote source is unsuccessful', () async {
        // arrange
        when(mockRemoteSource.getUserMembership()).thenThrow(Exception());
        // act
        final result = await repo.getUserMembership();
        // assert
        expect(result.isLeft(), isTrue);
        result.fold(
          (l) => expect(l, const MembershipFailure.cantGetPlan()),
          (r) => fail('Expected Left, got Right: \$r'),
        );
        verify(mockRemoteSource.getUserMembership());
        verifyZeroInteractions(mockLocalSource);
      });
    });

    group('when offline', () {
      setUp(() {
        when(mockConnection.hasConnection).thenAnswer((_) async => false);
      });

      test('should return a Membership from the local source', () async {
        // arrange
        when(mockLocalSource.getCurrentPlan()).thenAnswer((_) async => tMembershipModel);
        // act
        final result = await repo.getUserMembership();
        // assert
        expect(result.isRight(), isTrue);
        result.fold((l) => fail('Expected Right, got Left: \$l'), (r) => expect(r, tMembership));
        verify(mockLocalSource.getCurrentPlan());
        verifyZeroInteractions(mockRemoteSource);
      });

      test('should return a MembershipFailure when the local source throws an exception', () async {
        // arrange
        when(mockLocalSource.getCurrentPlan()).thenThrow(Exception());
        // act
        final result = await repo.getUserMembership();
        // assert
        expect(result.isLeft(), isTrue);
        result.fold(
          (l) => expect(l, const MembershipFailure.mmOffline()),
          (r) => fail('Expected Left, got Right: \$r'),
        );
        verify(mockLocalSource.getCurrentPlan());
        verifyZeroInteractions(mockRemoteSource);
      });
    });
  });
}
