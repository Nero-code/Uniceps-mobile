import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/contracts/auth_repo/i_auth_contracts.dart';

abstract class IOTPAuthSource {
  Future<bool> verifyCredential(
      {required String credential,
      CredentialType credentialType = CredentialType.email,
      AccountType accountType = AccountType.normal});
  Future<String> validateOTP({required String credential, required String otp});
}

abstract class I2FAuthSource {
  Future<bool> verifyCredentials({
    required String credential,
    required String password,
    CredentialType type = CredentialType.email,
  });
  Future<String> validateCode({
    required String code,
    required String credential,
    required String password,
    required String notifyToken,
  });
}
