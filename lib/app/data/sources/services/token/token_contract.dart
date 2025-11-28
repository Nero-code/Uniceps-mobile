abstract class TokenContract {
  Future<Session> getSession();
  Future<void> setSession(Session s);
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
