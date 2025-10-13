import 'package:uniceps/app/domain/classes/account_entities/account.dart';

abstract class IOTPAuthSource {
  Future<bool> verifyCredential(
      {required String credential,
      AccountType accountType = AccountType.normal});
  Future<String> validateOTP({required String credential, required String otp});
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
