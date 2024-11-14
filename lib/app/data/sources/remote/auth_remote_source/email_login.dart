import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/models/auth_models/user_model.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class I2FAuthService {
  Future<void> verifyCredentials({required String credential});

  Future<UserModel> verifyCodeSent(
      {required String code,
      required String credential,
      required String notifyToken});

  // Future<Map<dynamic, dynamic>> sendNotifyToken(String token);

  // Future<void> logout();
  // Future<bool> deleteAccount();
  // Future<bool> isLoggedIn();
}

class EmailAuthService implements I2FAuthService {
  final http.Client client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Logger logger;

  const EmailAuthService({
    required this.userBox,
    required this.client,
    required this.logger,
  });
  @override
  Future<UserModel> verifyCodeSent(
      {required String code,
      required String credential,
      required String notifyToken}) async {
    logger.d("START FUNC: verifyCodeSent()");
    final res = await client.post(Uri.parse(API + HTTP_VERIFY_CODE),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
            {"otp": code, "email": credential, "notify_token": notifyToken}));
    logger.d("VerifyCode --> res.statusCode : ${res.statusCode}");
    if (res.statusCode == 200 || res.statusCode == 201) {
      //
      // Profile Exists
      //
      logger.d(res.body);
      logger.d("VerifyCode --> jsonDecode(res.body)['token'] : "
          "${jsonDecode(res.body)['token']}");
      return UserModel(
        id: "id",
        token: jsonDecode(res.body)['token'],
        email: credential,
        notifyToken: notifyToken,
      );
    } else if (res.statusCode == 201) {
      //
      //Profile does not Exist!!
      //
      // return jsonDecode(res.body)['token'];

      logger.d(res.body);
      return UserModel(
        id: "id",
        token: jsonDecode(res.body)['token'],
        email: credential,
      );
    }

    logger.d("END   FUNC: verifyCodeSent(): RES: ${res.statusCode}");
    throw ServerException();
  }

  @override
  Future<void> verifyCredentials({required String credential}) async {
    logger.d("START FUNC: verifyEmail()");
    final res = await client.post(Uri.parse(API + HTTP_REGISTER),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({"email": credential}));
    logger.d("${res.statusCode}\n${res.body}");
    if (res.statusCode == 200) {
      logger.d(res.body);
      return;
    }

    logger.d("END   FUNC: verifyEmail(): RES: ${res.statusCode}");
    throw Exception();
  }

  // @override
  // Future<Map<dynamic, dynamic>> sendNotifyToken(String token) async {
  //   logger.d("inside sendNotifyToken");
  //   final res = await client.post(
  //     Uri.parse(
  //       "$API" " $HTTP_REGISTER" "$HTTP_REFRESH",
  //     ),
  //     headers: {
  //       ...HEADERS,
  //       "x-access-token": userBox.get(HIVE_USER_BOX)!['token'],
  //     },
  //   );
  //   logger.d("statusCode: ${res.statusCode}");
  //   logger.d("body: ${res.body}");

  //   if (res.statusCode == 201) {
  //     return jsonDecode(res.body);
  //   }
  //   throw AuthException();
  // }

  // @override
  // Future<void> logout() async {
  //   final res = await client.get(
  //       Uri.parse(
  //         "$API" "$HTTP_REGISTER" "/logout",
  //       ),
  //       headers: {
  //         'x-access-token': userBox.get(HIVE_USER_BOX)!['token'],
  //       });
  //   logger.d(res.statusCode);
  //   if (res.statusCode == 200) {
  //     return;
  //   }
  //   throw AuthException();
  // }

  // @override
  // Future<bool> deleteAccount() async {
  //   final res =
  //       await client.delete(Uri.parse("$API" "$HTTP_REGISTER"), headers: {
  //     'x-access-token': userBox.get(HIVE_USER_BOX)!['token'],
  //   });
  //   logger.d("response: ${res.statusCode} \n${res.body}");
  //   if (res.statusCode == 200 ||
  //       res.statusCode == 404 ||
  //       res.statusCode == 401) {
  //     return true;
  //   }
  //   throw ServerException();
  // }

  // @override
  // Future<bool> isLoggedIn() {
  //   throw UnimplementedError();
  // }
}
