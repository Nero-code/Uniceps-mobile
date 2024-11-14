import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IAccountService {
  Future<Map<dynamic, dynamic>> refreshNotifyToken(String token);

  Future<void> logout();
  Future<bool> deleteAccount();
  Future<bool> isLoggedIn();
}

class LogoutService implements IAccountService {
  const LogoutService({
    required this.client,
    required this.logger,
    required this.userBox,
  });

  final Box<Map<dynamic, dynamic>> userBox;
  final Client client;
  final Logger logger;

  @override
  Future<Map<dynamic, dynamic>> refreshNotifyToken(String token) async {
    logger.d("inside sendNotifyToken");
    final res = await client.post(
      Uri.parse(
        "$API" " $HTTP_REGISTER" "$HTTP_REFRESH",
      ),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!['token'],
      },
    );
    logger.d("statusCode: ${res.statusCode}");
    logger.d("body: ${res.body}");

    if (res.statusCode == 201) {
      return jsonDecode(res.body);
    }
    throw AuthException();
  }

  @override
  Future<void> logout() async {
    final res = await client.get(
        Uri.parse(
          "$API" "$HTTP_REGISTER" "/logout",
        ),
        headers: {
          'x-access-token': userBox.get(HIVE_USER_BOX)!['token'],
        });
    logger.d(res.statusCode);
    if (res.statusCode == 200) {
      return;
    }
    throw AuthException();
  }

  @override
  Future<bool> deleteAccount() async {
    final res =
        await client.delete(Uri.parse("$API" "$HTTP_REGISTER"), headers: {
      'x-access-token': userBox.get(HIVE_USER_BOX)!['token'],
    });
    logger.d("response: ${res.statusCode} \n${res.body}");
    if (res.statusCode == 200 ||
        res.statusCode == 404 ||
        res.statusCode == 401) {
      return true;
    }
    throw ServerException();
  }

  @override
  Future<bool> isLoggedIn() async {
    logger.d("check 1: Inside Local isLoggedIn ");

    logger.d(userBox.get(HIVE_USER_BOX)?.toString());
    final user = userBox.get(HIVE_USER_BOX);

    logger.d("User in Box: $user");
    if (user == null || !user.containsKey("token")) throw EmptyCacheExeption();
    // final notify = await firebaseMessaging.getToken();
    // if (notify != user['notify']) {
    //   user.addAll({'notify': notify});
    //   userBox.put(HIVE_USER_BOX, user);
    // }
    return true;
  }
}
