import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/sources/local/dal_account/account_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/auth_contracts.dart';
import 'package:uniceps/app/data/sources/services/token/token_service_simple.dart';
import 'package:uniceps/app/data/stores/auth/email_auth_repo.dart';
import 'package:uniceps/core/errors/failure.dart';

import 'email_auth_repo_test.mocks.dart';

@GenerateMocks([IOTPAuthSource, SimpleTokenService, IAccountLocalSource, InternetConnectionChecker, Logger])
void main() {
  late EmailAuthRepo repo;
  late MockIOTPAuthSource mockOtpAuthSource;
  late MockSimpleTokenService mockTokenService;
  late MockIAccountLocalSource mockAccountLocalSource;
  late MockInternetConnectionChecker mockConnection;
  late MockLogger mockLogger;

  setUp(() {
    mockOtpAuthSource = MockIOTPAuthSource();
    mockTokenService = MockSimpleTokenService();
    mockAccountLocalSource = MockIAccountLocalSource();
    mockConnection = MockInternetConnectionChecker();
    mockLogger = MockLogger();
    repo = EmailAuthRepo(
      otpAuthSource: mockOtpAuthSource,
      tokenService: mockTokenService,
      accountLocalSource: mockAccountLocalSource,
      connection: mockConnection,
      logger: mockLogger,
    );
  });

  const tCredential = 'test@example.com';

  group('verifyCredential', () {
    test('should check if there is an internet connection', () async {
      // arrange
      when(mockConnection.hasConnection).thenAnswer((_) async => true);
      when(mockOtpAuthSource.verifyCredential(credential: anyNamed('credential'))).thenAnswer((_) async => true);
      // act
      await repo.verifyCredential(credential: tCredential);
      // assert
      verify(mockConnection.hasConnection);
    });

    group('when online', () {
      setUp(() {
        when(mockConnection.hasConnection).thenAnswer((_) async => true);
      });

      test('should call IOTPAuthSource.verifyCredential with the correct credential', () async {
        // arrange
        when(mockOtpAuthSource.verifyCredential(credential: anyNamed('credential'))).thenAnswer((_) async => true);
        // act
        await repo.verifyCredential(credential: tCredential);
        // assert
        verify(mockOtpAuthSource.verifyCredential(credential: tCredential));
      });

      test('should return Right(true) when the call to the remote data source is successful', () async {
        // arrange
        when(mockOtpAuthSource.verifyCredential(credential: anyNamed('credential'))).thenAnswer((_) async => true);
        // act
        final result = await repo.verifyCredential(credential: tCredential);
        // assert
        expect(result, const Right(true));
      });

      test(
        'should return Left(AuthFailure.unautherizedFailure()) when the call to the remote data source is unsuccessful',
        () async {
          // arrange
          when(mockOtpAuthSource.verifyCredential(credential: anyNamed('credential'))).thenThrow(Exception());
          // act
          final result = await repo.verifyCredential(credential: tCredential);
          // assert
          expect(result, const Left(AuthFailure.unautherizedFailure()));
        },
      );
    });

    group('when offline', () {
      setUp(() {
        when(mockConnection.hasConnection).thenAnswer((_) async => false);
      });

      test('should return Left(AuthFailure.aOffline())', () async {
        // act
        final result = await repo.verifyCredential(credential: tCredential);
        // assert
        expect(result, const Left(AuthFailure.aOffline()));
        verifyZeroInteractions(mockOtpAuthSource);
      });
    });
  });
}
