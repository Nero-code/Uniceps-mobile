import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class TokenService {
  TokenService(
      {required FlutterSecureStorage storage, required http.Client client})
      : _client = client,
        _storage = storage;

  late final http.Client _client;
  final FlutterSecureStorage _storage;
  Session? _session;

  Future<Session?> get session async {
    print("getting Session...");
    final isSessionCreated = await _createSession();
    if (isSessionCreated) {
      return _session;
    }
    throw SessionGenerationException();
  }

  // bool get isLoggedIn => _refreshToken != null;
  // void setToken(String token) {
  //   _refreshToken = token;
  // }

  Future<void> setLoginSession(String token, String access) async {
    _session = Session(accessToken: access, createdAt: DateTime.now());
    print("setLoginSession => ${_session != null}");
  }

  Future<bool> _createSession() async {
    print("createSession");
    if (!await _storage.containsKey(key: 'refresh')) return false;

    print("createSession => found a token");
    print("createSession => session hasExpired(${_session?.hasExpired})");

    final refreshToken = _storage.read(key: 'refresh') as String;
    if (_session == null || _session!.hasExpired) {
      try {
        final res = await _client.post(
          Uri.parse("$API$HTTP_ACCESS_TOKEN"),
          body: jsonEncode({'refresh': refreshToken}),
        );
        print("result Code : ${res.statusCode}");
        print("result body : ${res.body}");
        if (res.statusCode == 200 || res.statusCode == 201) {
          _session = Session(
            accessToken: jsonDecode(res.body)['access'],
            createdAt: DateTime.now(),
          );
          print("createSession => New Session Available (Done)!");
          return true;
        }
        return false;
      } catch (e) {
        print("createSession => Error!");
        print(e);
        return false;
      }
    }
    return true;
  }

  Future<bool> ensureRefreshTokenIsValid() async {
    print("ensureTokenIsValid");
    // if no token, then use is not logged in
    if (!await _storage.containsKey(key: 'refresh')) return false;
    print("ensureTokenIsValid => found a token");
    final refreshToken = _storage.read(key: 'refresh') as String;
    final issuedAt = DateTime.parse(_storage.read(key: 'issuedAt') as String);

    //  if token time-to-live < 15 days then it's up-to-date
    if (issuedAt.difference(DateTime.now()).inDays < 15) return true;
    if (issuedAt.difference(DateTime.now()).inDays > 30) {
      _storage.deleteAll();
      return false;
    }
    if (_session == null) return true;

    try {
      final res = await _client.post(Uri.parse("$API" "$HTTP_REFRESH_TOKEN"),
          body: jsonEncode({
            "refresh": refreshToken,
            "device_token": await FirebaseMessaging.instance.getToken()
          }));
      if (res.statusCode == 200 || res.statusCode == 201) {
        // final userDto = UserDto.fromJson(res.data);
        // await _storage.setString('refresh', userDto.refreshToken);
        // await _storage.setString(
        //     'issuedAt', userDto.issuedAt.toIso8601String());
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Session {
  const Session({required String accessToken, required DateTime createdAt})
      : _createdAt = createdAt,
        _accessToken = accessToken;
  final String _accessToken;
  final DateTime _createdAt;

  String get accessToken => _accessToken;

  bool get hasExpired => DateTime.now().difference(_createdAt).inHours > 20;
}
