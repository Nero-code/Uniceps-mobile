import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart' as hive;
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/models/auth_models/user_model.dart';
import 'package:uniceps/app/data/sources/local/dal_auth/account_local_source.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

import '../../data_layer_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<hive.Box>(),
  MockSpec<AccountLocalSourceImpl>(),
  MockSpec<FirebaseMessaging>(),
])
void main() {
  final logger = Logger();
  final mockFirebaseMessaging = MockFirebaseMessaging();

  const fakeUser = UserModel(
    id: "id",
    token: "this is a token",
    email: "john.doe@gmail.com",
  );
  const fakeUserAsMap = {
    'id': "id",
    'token': "this is a token",
    'email': "john.doe@gmail.com",
  };
  group("Local Data Layer Tests", () {
    final userBox = MockBox<Map<dynamic, dynamic>>();

    late IAccountLocalSource userSource;

    group("Account Sources", () {
      setUp(() {
        //  Arrange
        userSource = AccountLocalSourceImpl(
          userBox: userBox,
          resetBottun: () async {},
          logger: logger,
          firebaseMessaging: mockFirebaseMessaging,
        );
      });
      test("should return [User Logged In] when token is the same", () async {
        //  Act
        when(mockFirebaseMessaging.getToken()).thenAnswer(
          (realInvocation) async => "Hello i am a token",
        );
        when(userBox.get(HIVE_USER_BOX)).thenReturn(
          {"token": "Hello i am a token"},
        );

        //  Assert
        expect(await userSource.isLoggedIn(), equals(true));
      });

      test("should throw EmptyException when token is null", () async {
        //  Act
        when(userBox.get(HIVE_USER_BOX))
            .thenReturn({"Not a token": "Irrelevent value"});

        //  Assert
        expect(() async => await userSource.isLoggedIn(),
            throwsA(isA<EmptyCacheExeption>()));
      });

      test("should read User [Map] from the database and return [UserModel]",
          () async {
        //  Act
        when(
          userBox.get(HIVE_USER_BOX),
        ).thenReturn(fakeUserAsMap);

        //  Assert
        expect(
          await userSource.getUser(),
          equals(fakeUser),
        );
      });
      test("should save User [Map] to the database and return", () async {
        //  Act
        when(
          userBox.put(HIVE_USER_BOX, fakeUserAsMap),
        ).thenAnswer((realInvocation) async {});

        //  Assert
        expect(
          () async => await userSource.saveUser(fakeUser),
          isA<void>(),
        );
      });
    });

    group("Attendence Source", () {
      test("", () {});
    });
  });
}
