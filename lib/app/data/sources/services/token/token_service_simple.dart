import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/sources/services/token/token_contract.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class SimpleTokenService implements TokenContract {
  static const _accessTokenKey = 'access_token';
  static const _expirationDate = 'access_token_expiration_date';

  final FlutterSecureStorage _storage;
  final http.Client _client;
  final Logger _logger;
  const SimpleTokenService({required FlutterSecureStorage storage, required http.Client client, required Logger logger})
    : _storage = storage,
      _client = client,
      _logger = logger;

  Future<void> saveAccessToken(String accessToken, DateTime expireDate) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _expirationDate, value: expireDate.toIso8601String());
  }

  Future<String?> getAccessToken() async {
    _logger.t('Getting Access Token');
    if (await isTokenValid()) {
      return await _storage.read(key: _accessTokenKey);
    }
    throw InvalidTokenException();
  }

  Future<bool> isTokenValid() async {
    final token = await _storage.read(key: _accessTokenKey);
    final expirationDateString = await _storage.read(key: _expirationDate);
    _logger.t('token: ${token?.length},\nexpirationDate$expirationDateString)');
    if (token == null || token.isEmpty || expirationDateString == null || expirationDateString.isEmpty) {
      _logger.i('Token either not found or has expired!');
      return false;
    }
    final expirationDate = DateTime.parse(expirationDateString);
    if (expirationDate.difference(DateTime.now()).inDays < 0) {
      _logger.i('Found token but it has expired');
      return false;
    }
    if (expirationDate.difference(DateTime.now()).inDays < 6) {
      refreshToken(token);
    }
    return true;
  }

  Future<void> refreshToken(String oldToken) async {
    final notify = await FirebaseMessaging.instance.getToken();
    final info = await DeviceInfoPlugin().androidInfo;
    final res = await _client.get(
      Uri.https(API_V2, HTTP_REFRESH_TOKEN, {'notify': notify ?? '', 'deviceId': info.id}),
      headers: {
        'Authorization': "Bearer $oldToken",
        'content-type': 'application/json;charset=utf-8',
        'accept': 'application/json',
      },
    );
    _logger.d("Token: ${res.statusCode} : ${res.body}");
    if (res.statusCode == 200 || res.statusCode == 201) {
      final token = jsonDecode(res.body)['token'] as String;
      await _storage.write(key: _accessTokenKey, value: token);
      await _storage.write(key: _expirationDate, value: DateTime.now().toIso8601String());
      _logger.t('Token Refreshed Successfully! : ${res.statusCode}');
    }
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _expirationDate);
  }

  @override
  Future<Session> getSession() {
    throw UnimplementedError();
  }

  @override
  Future<void> setSession(Session s) {
    throw UnimplementedError();
  }
}
