import 'package:uniceps/app/domain/classes/account_entities/account.dart';

abstract class IOTPAuthSource {
  Future<bool> verifyCredential(
      {required String credential,
      AccountType accountType = AccountType.normal});
  Future<T> validateOTP<T>({
    required String credential,
    required String otp,
    required T Function(Map<String, dynamic> json) parser,
  });
}

abstract class I2FAuthSource {
  Future<bool> verifyCredentials({
    required String credential,
    required String password,
  });
  Future<String> validateCode({
    required String code,
    required String credential,
    required String password,
    required String notifyToken,
  });
}
