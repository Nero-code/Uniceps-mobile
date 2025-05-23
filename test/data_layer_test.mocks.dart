// Mocks generated by Mockito 5.4.4 from annotations
// in uniceps/test/data_layer_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i11;

import 'package:firebase_core/firebase_core.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:http/http.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i10;
import 'package:uniceps/app/data/sources/local/dal_auth/account_local_source.dart'
    as _i12;
import 'package:uniceps/app/data/models/auth_models/user_model.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_1 extends _i1.SmartFake
    implements _i2.StreamedResponse {
  _FakeStreamedResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBox_2<E> extends _i1.SmartFake implements _i3.Box<E> {
  _FakeBox_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLogger_3 extends _i1.SmartFake implements _i4.Logger {
  _FakeLogger_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_4 extends _i1.SmartFake implements _i5.UserModel {
  _FakeUserModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseApp_5 extends _i1.SmartFake implements _i6.FirebaseApp {
  _FakeFirebaseApp_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNotificationSettings_6 extends _i1.SmartFake
    implements _i7.NotificationSettings {
  _FakeNotificationSettings_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  @override
  _i8.Future<_i2.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<_i11.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i11.Uint8List>.value(_i11.Uint8List(0)),
        returnValueForMissingStub:
            _i8.Future<_i11.Uint8List>.value(_i11.Uint8List(0)),
      ) as _i8.Future<_i11.Uint8List>);

  @override
  _i8.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i2.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Box].
///
/// See the documentation for Mockito's code generation for more information.
class MockBox<E> extends _i1.Mock implements _i3.Box<E> {
  @override
  Iterable<E> get values => (super.noSuchMethod(
        Invocation.getter(#values),
        returnValue: <E>[],
        returnValueForMissingStub: <E>[],
      ) as Iterable<E>);

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
        returnValueForMissingStub: _i10.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);

  @override
  bool get isOpen => (super.noSuchMethod(
        Invocation.getter(#isOpen),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get lazy => (super.noSuchMethod(
        Invocation.getter(#lazy),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  Iterable<dynamic> get keys => (super.noSuchMethod(
        Invocation.getter(#keys),
        returnValue: <dynamic>[],
        returnValueForMissingStub: <dynamic>[],
      ) as Iterable<dynamic>);

  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  bool get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isNotEmpty => (super.noSuchMethod(
        Invocation.getter(#isNotEmpty),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  Iterable<E> valuesBetween({
    dynamic startKey,
    dynamic endKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #valuesBetween,
          [],
          {
            #startKey: startKey,
            #endKey: endKey,
          },
        ),
        returnValue: <E>[],
        returnValueForMissingStub: <E>[],
      ) as Iterable<E>);

  @override
  E? getAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #getAt,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as E?);

  @override
  Map<dynamic, E> toMap() => (super.noSuchMethod(
        Invocation.method(
          #toMap,
          [],
        ),
        returnValue: <dynamic, E>{},
        returnValueForMissingStub: <dynamic, E>{},
      ) as Map<dynamic, E>);

  @override
  dynamic keyAt(int? index) => super.noSuchMethod(
        Invocation.method(
          #keyAt,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Stream<_i3.BoxEvent> watch({dynamic key}) => (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
          {#key: key},
        ),
        returnValue: _i8.Stream<_i3.BoxEvent>.empty(),
        returnValueForMissingStub: _i8.Stream<_i3.BoxEvent>.empty(),
      ) as _i8.Stream<_i3.BoxEvent>);

  @override
  bool containsKey(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i8.Future<void> put(
    dynamic key,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> putAt(
    int? index,
    E? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAt,
          [
            index,
            value,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> putAll(Map<dynamic, E>? entries) => (super.noSuchMethod(
        Invocation.method(
          #putAll,
          [entries],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<int> add(E? value) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [value],
        ),
        returnValue: _i8.Future<int>.value(0),
        returnValueForMissingStub: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);

  @override
  _i8.Future<Iterable<int>> addAll(Iterable<E>? values) => (super.noSuchMethod(
        Invocation.method(
          #addAll,
          [values],
        ),
        returnValue: _i8.Future<Iterable<int>>.value(<int>[]),
        returnValueForMissingStub: _i8.Future<Iterable<int>>.value(<int>[]),
      ) as _i8.Future<Iterable<int>>);

  @override
  _i8.Future<void> delete(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> deleteAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #deleteAt,
          [index],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> deleteAll(Iterable<dynamic>? keys) => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [keys],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> compact() => (super.noSuchMethod(
        Invocation.method(
          #compact,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<int> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i8.Future<int>.value(0),
        returnValueForMissingStub: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> flush() => (super.noSuchMethod(
        Invocation.method(
          #flush,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [LocalUserSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalUserSourceImpl extends _i1.Mock
    implements _i12.AccountLocalSourceImpl {
  @override
  _i3.Box<Map<dynamic, dynamic>> get userBox => (super.noSuchMethod(
        Invocation.getter(#userBox),
        returnValue: _FakeBox_2<Map<dynamic, dynamic>>(
          this,
          Invocation.getter(#userBox),
        ),
        returnValueForMissingStub: _FakeBox_2<Map<dynamic, dynamic>>(
          this,
          Invocation.getter(#userBox),
        ),
      ) as _i3.Box<Map<dynamic, dynamic>>);

  // @override
  // _i3.Box<Map<dynamic, dynamic>> get playerBox => (super.noSuchMethod(
  //       Invocation.getter(#playerBox),
  //       returnValue: _FakeBox_2<Map<dynamic, dynamic>>(
  //         this,
  //         Invocation.getter(#playerBox),
  //       ),
  //       returnValueForMissingStub: _FakeBox_2<Map<dynamic, dynamic>>(
  //         this,
  //         Invocation.getter(#playerBox),
  //       ),
  //     ) as _i3.Box<Map<dynamic, dynamic>>);

  @override
  _i8.Future<void> Function() get resetBottun => (super.noSuchMethod(
        Invocation.getter(#resetBottun),
        returnValue: () => _i8.Future<void>.value(),
        returnValueForMissingStub: () => _i8.Future<void>.value(),
      ) as _i8.Future<void> Function());

  @override
  _i4.Logger get logger => (super.noSuchMethod(
        Invocation.getter(#logger),
        returnValue: _FakeLogger_3(
          this,
          Invocation.getter(#logger),
        ),
        returnValueForMissingStub: _FakeLogger_3(
          this,
          Invocation.getter(#logger),
        ),
      ) as _i4.Logger);

  @override
  _i8.Future<_i5.UserModel> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i8.Future<_i5.UserModel>.value(_FakeUserModel_4(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i5.UserModel>.value(_FakeUserModel_4(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i8.Future<_i5.UserModel>);

  @override
  _i8.Future<void> saveUser(_i5.UserModel? model) => (super.noSuchMethod(
        Invocation.method(
          #saveUser,
          [model],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<bool> isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<void> localLogout() => (super.noSuchMethod(
        Invocation.method(
          #localLogout,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [FirebaseMessaging].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseMessaging extends _i1.Mock implements _i7.FirebaseMessaging {
  @override
  _i6.FirebaseApp get app => (super.noSuchMethod(
        Invocation.getter(#app),
        returnValue: _FakeFirebaseApp_5(
          this,
          Invocation.getter(#app),
        ),
        returnValueForMissingStub: _FakeFirebaseApp_5(
          this,
          Invocation.getter(#app),
        ),
      ) as _i6.FirebaseApp);

  @override
  set app(_i6.FirebaseApp? _app) => super.noSuchMethod(
        Invocation.setter(
          #app,
          _app,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isAutoInitEnabled => (super.noSuchMethod(
        Invocation.getter(#isAutoInitEnabled),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i8.Stream<String> get onTokenRefresh => (super.noSuchMethod(
        Invocation.getter(#onTokenRefresh),
        returnValue: _i8.Stream<String>.empty(),
        returnValueForMissingStub: _i8.Stream<String>.empty(),
      ) as _i8.Stream<String>);

  @override
  Map<dynamic, dynamic> get pluginConstants => (super.noSuchMethod(
        Invocation.getter(#pluginConstants),
        returnValue: <dynamic, dynamic>{},
        returnValueForMissingStub: <dynamic, dynamic>{},
      ) as Map<dynamic, dynamic>);

  @override
  _i8.Future<_i7.RemoteMessage?> getInitialMessage() => (super.noSuchMethod(
        Invocation.method(
          #getInitialMessage,
          [],
        ),
        returnValue: _i8.Future<_i7.RemoteMessage?>.value(),
        returnValueForMissingStub: _i8.Future<_i7.RemoteMessage?>.value(),
      ) as _i8.Future<_i7.RemoteMessage?>);

  @override
  _i8.Future<void> deleteToken() => (super.noSuchMethod(
        Invocation.method(
          #deleteToken,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<String?> getAPNSToken() => (super.noSuchMethod(
        Invocation.method(
          #getAPNSToken,
          [],
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);

  @override
  _i8.Future<String?> getToken({String? vapidKey}) => (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [],
          {#vapidKey: vapidKey},
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);

  @override
  _i8.Future<bool> isSupported() => (super.noSuchMethod(
        Invocation.method(
          #isSupported,
          [],
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<_i7.NotificationSettings> getNotificationSettings() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNotificationSettings,
          [],
        ),
        returnValue: _i8.Future<_i7.NotificationSettings>.value(
            _FakeNotificationSettings_6(
          this,
          Invocation.method(
            #getNotificationSettings,
            [],
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i7.NotificationSettings>.value(
            _FakeNotificationSettings_6(
          this,
          Invocation.method(
            #getNotificationSettings,
            [],
          ),
        )),
      ) as _i8.Future<_i7.NotificationSettings>);

  @override
  _i8.Future<_i7.NotificationSettings> requestPermission({
    bool? alert = true,
    bool? announcement = false,
    bool? badge = true,
    bool? carPlay = false,
    bool? criticalAlert = false,
    bool? provisional = false,
    bool? sound = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestPermission,
          [],
          {
            #alert: alert,
            #announcement: announcement,
            #badge: badge,
            #carPlay: carPlay,
            #criticalAlert: criticalAlert,
            #provisional: provisional,
            #sound: sound,
          },
        ),
        returnValue: _i8.Future<_i7.NotificationSettings>.value(
            _FakeNotificationSettings_6(
          this,
          Invocation.method(
            #requestPermission,
            [],
            {
              #alert: alert,
              #announcement: announcement,
              #badge: badge,
              #carPlay: carPlay,
              #criticalAlert: criticalAlert,
              #provisional: provisional,
              #sound: sound,
            },
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i7.NotificationSettings>.value(
            _FakeNotificationSettings_6(
          this,
          Invocation.method(
            #requestPermission,
            [],
            {
              #alert: alert,
              #announcement: announcement,
              #badge: badge,
              #carPlay: carPlay,
              #criticalAlert: criticalAlert,
              #provisional: provisional,
              #sound: sound,
            },
          ),
        )),
      ) as _i8.Future<_i7.NotificationSettings>);

  @override
  _i8.Future<void> sendMessage({
    String? to,
    Map<String, String>? data,
    String? collapseKey,
    String? messageId,
    String? messageType,
    int? ttl,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendMessage,
          [],
          {
            #to: to,
            #data: data,
            #collapseKey: collapseKey,
            #messageId: messageId,
            #messageType: messageType,
            #ttl: ttl,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> setAutoInitEnabled(bool? enabled) => (super.noSuchMethod(
        Invocation.method(
          #setAutoInitEnabled,
          [enabled],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> setDeliveryMetricsExportToBigQuery(bool? enabled) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDeliveryMetricsExportToBigQuery,
          [enabled],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> setForegroundNotificationPresentationOptions({
    bool? alert = false,
    bool? badge = false,
    bool? sound = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setForegroundNotificationPresentationOptions,
          [],
          {
            #alert: alert,
            #badge: badge,
            #sound: sound,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> subscribeToTopic(String? topic) => (super.noSuchMethod(
        Invocation.method(
          #subscribeToTopic,
          [topic],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> unsubscribeFromTopic(String? topic) => (super.noSuchMethod(
        Invocation.method(
          #unsubscribeFromTopic,
          [topic],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}
