import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart' as hive;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uniceps/app/data/sources/local/auth_local_source/account_local_source.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

import '../../data_layer_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<http.Client>(),
  MockSpec<hive.Box>(),
  MockSpec<AccountLocalSourceImpl>(),
  MockSpec<FirebaseMessaging>(),
])
void main() {
  // Box<Map<String, dynamic>> playerBox;
  // Box<Map<String, dynamic>> userBox;
  // final logger = Logger();
  // setUp(() async {
  //   userBox = await Hive.openBox("Box1");
  //   playerBox = await Hive.openBox("Box2");
  // });
  group("Local Data Layer Tests", () {
    final userBox = MockBox<Map<dynamic, dynamic>>();
    // final playerBox = MockBox<Map<dynamic, dynamic>>();
    final mockFirebaseMessaging = MockFirebaseMessaging();
    final userSource = AccountLocalSourceImpl(
      userBox: userBox,
      // playerBox: playerBox,
      resetBottun: () async {},
      logger: Logger(),
      firebaseMessaging: mockFirebaseMessaging,
    );
    group("User Source", () {
      test("should return [User Logged In] when token is the same", () async {
        //  Arrange

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
        //  Arrange

        //  Act
        when(userBox.get(HIVE_USER_BOX)).thenReturn({"token": ""});

        //  Assert
        expect(await userSource.isLoggedIn(), throwsA(EmptyCacheExeption));
      });
    });

    group("Attendence Source", () {
      test("should get Measurements", () {});
    });
  });
}
