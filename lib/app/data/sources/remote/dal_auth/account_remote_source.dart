import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

abstract class IAccountRemoteSource {
  Future<void> logout();
  Future<void> deleteAccount();
  Future<bool> refreshNotifyToken();
}

class AccountRemoteSource implements IAccountRemoteSource {
  const AccountRemoteSource({
    required this.client,
    required this.logger,
    required this.userBox,
  });

  final Box<Map<dynamic, dynamic>> userBox;
  final Client client;
  final Logger logger;

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> refreshNotifyToken() {
    // TODO: implement refreshNotifyToken
    throw UnimplementedError();
  }
}
