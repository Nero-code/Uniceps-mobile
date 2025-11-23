import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class SimpleTokenService {
  static const _accessTokenKey = 'access_token';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    final token = await _storage.read(key: _accessTokenKey);
    if (token != null && token.isNotEmpty) {
      return token;
    }
    throw SessionGenerationException();
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }
}
