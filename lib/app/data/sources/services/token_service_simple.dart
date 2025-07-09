import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SimpleTokenService {
  static const _accessTokenKey = 'access_token';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  Future<bool> hasValidAccessToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
