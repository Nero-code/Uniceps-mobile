import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkInfo {
  final InternetConnection _internetConnection;
  const NetworkInfo({required InternetConnection internetConnection}) : _internetConnection = internetConnection;

  Future<bool> get hasConnection async =>
      _internetConnection.lastTryResults == .connected ? true : await _internetConnection.hasInternetAccess;
}
