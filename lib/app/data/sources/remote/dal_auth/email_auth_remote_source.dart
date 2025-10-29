import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/auth_contracts.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class OTPAuthSource implements IOTPAuthSource {
  final http.Client client;
  final Logger logger;

  const OTPAuthSource({
    required this.client,
    required this.logger,
  });

  @override
  Future<bool> verifyCredential({
    required String credential,
    AccountType accountType = AccountType.normal,
  }) async {
    logger.d("START FUNC: verifyEmail()");

    final res = await client.post(Uri.parse(API + HTTP_REGISTER),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({"email": credential}));
    logger.d("${res.statusCode}\n${res.body}");

    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    }
    throw "";
  }

  @override
  Future<String> validateOTP(
      {required String credential, required String otp}) async {
    logger.d("START FUNC: verifyCodeSent()");

    final notifyToken = await FirebaseMessaging.instance.getToken();
    final res = await client.post(Uri.parse(API + HTTP_VERIFY_CODE),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
            {"otp": otp, "email": credential, "notify_token": notifyToken}));
    logger.d("VerifyCode --> res.statusCode : ${res.statusCode}");

    if (res.statusCode == 200 || res.statusCode == 201) {
      logger.d(res.body);
      logger.d("VerifyCode --> jsonDecode(res.body)['token'] : "
          "${jsonDecode(res.body)['token']}");
      return jsonDecode(res.body)['token'];
    }

    logger.d("END   FUNC: verifyCodeSent(): RES: ${res.statusCode}");
    throw ServerException();
  }
}
