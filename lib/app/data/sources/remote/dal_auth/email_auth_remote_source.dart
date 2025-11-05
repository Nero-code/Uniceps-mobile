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

    final res = await client.post(Uri.https(API_V2, HTTP_REGISTER),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({"email": credential}));
    logger.d("${res.statusCode}\n${res.body}");

    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    }
    throw "";
  }

  @override
  Future<T> validateOTP<T>({
    required String credential,
    required String otp,
    required T Function(Map<String, dynamic> json) parser,
  }) async {
    logger.d("START FUNC: validateOTP()");

    final notifyToken = await FirebaseMessaging.instance.getToken();
    final res = await client.post(Uri.https(API_V2, HTTP_VERIFY_CODE),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
            {"otp": otp, "email": credential, "notify_token": notifyToken}));
    logger.d("VerifyCode --> res.statusCode : ${res.statusCode}");

    if (res.statusCode == 200 || res.statusCode == 201) {
      logger.d("VerifyOtp -> jsonDecode(res.body): ${jsonDecode(res.body)}");
      return parser(jsonDecode(res.body) as Map<String, dynamic>);
    }

    logger.d("END FUNC: validateOTP(): RES: ${res.statusCode}");
    throw ServerException();
  }
}
// {
//   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoib3NhbWFzZGExMTEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6WyIwYmExZmMwYy0wMjA0LTQ3NDMtYTE1NS1hZjRhNjJhMjc3MWEiLCIwYmExZmMwYy0wMjA0LTQ3NDMtYTE1NS1hZjRhNjJhMjc3MWEiXSwianRpIjoiNmMxOTRiYjktYTIyNC00MzIwLWE2MzgtYjQxZGU5NWQ5MDNkIiwidXNlclR5cGUiOiJOb3JtYWwiLCJleHAiOjE3NjQ4NDI5OTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3QiLCJhdWQiOiJGbHV0dGVyLWFwcCJ9.vG6QtrFZrx6SI-r5t53QHZ65MCV_8Rxlr1Tj3ofVW34",
//   "expiresAt": "2025-12-04T10:09:54Z",
//   "userType": 0,
//   "id": "0ba1fc0c-0204-4743-a155-af4a62a2771a"
// }
