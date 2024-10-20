import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/data/models/user_model.dart';
// import 'package:uniceps/features/Auth/services/enitites/player.dart';

abstract class RemoteAuthSource {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> verifyEmail({required String email});
  Future<UserModel> verifyCodeSent(
      {required String code,
      required String email,
      required String notifyToken});
  Future<void> verifyGymCode({required String gymCode});
  Future<void> uploadPlayerInfo({required PlayerModel player});
  Future<void> requestPasswordChange(String newPass);
  Future<PlayerModel> getPlayerInfo();
  // Future<bool> isLoggedIn();
  Future<Map<dynamic, dynamic>> sendNotifyToken(String token);
  Future<void> logout();
}

class RemoteAuthSourceImpl implements RemoteAuthSource {
  final http.Client client;
  final Box<Map<dynamic, dynamic>> userBox;
  final Logger logger;

  RemoteAuthSourceImpl({
    required this.client,
    required this.userBox,
    required this.logger,
  });

  @override
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    logger.d("START FUNC: loginWithEmailAndPassword()");
    final res = await client.post(
      Uri.http(API, "/login", {}),
      body: {"email": email, "password": password},
    );

    if (res.statusCode == 200) {
      logger.d(res.body);
      return;
    }
    logger
        .d("END   FUNC: loginWithEmailAndPassword():   RES: ${res.statusCode}");
    throw AuthException();
  }

  @override
  Future<void> requestPasswordChange(String newPass) async {
    final res = await getIt('/login', {});
    if (res.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> uploadPlayerInfo({required PlayerModel player}) async {
    final res = await client.put(
      Uri.parse("$API$HTTP_PLAYER_INFO"),
      headers: {
        ...HEADERS,
        "x-access-token": userBox.get(HIVE_USER_BOX)!["token"]
      },
      body: player.toJson(),
    );
    if (res.statusCode != 200) {
      throw NotFoundException();
    }
  }

  @override
  Future<UserModel> verifyCodeSent(
      {required String code,
      required String email,
      required String notifyToken}) async {
    logger.d("START FUNC: verifyCodeSent()");
    final res = await client.post(Uri.parse(API + HTTP_VERIFY_CODE),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
            {"otp": code, "email": email, "notify_token": notifyToken}));
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
        email: email,
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
        email: email,
      );
    }

    logger.d("END   FUNC: verifyCodeSent(): RES: ${res.statusCode}");
    throw ServerException();
  }

  @override
  Future<void> verifyEmail({required String email}) async {
    logger.d("START FUNC: verifyEmail()");
    final res = await client.post(Uri.parse(API + HTTP_REGISTER),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({"email": email}));
    if (res.statusCode == 200) {
      logger.d(res.body);
      return;
    }

    logger.d("END   FUNC: verifyEmail(): RES: ${res.statusCode}");
    throw Exception();
  }

  @override
  Future<void> verifyGymCode({required String gymCode}) async {
    final res = await client
        .post(Uri.parse("$API/Auth/verify_gym"), body: {"gym_code": gymCode});
    if (res.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<PlayerModel> getPlayerInfo() async {
    logger.d("inside GetPlayerInfo");
    logger.d(userBox.get(HIVE_USER_BOX)!["token"]);
    final res = await client.get(Uri.parse(API + HTTP_PLAYER_INFO), headers: {
      ...HEADERS,
      "x-access-token": "${userBox.get(HIVE_USER_BOX)!["token"]}",
    });
    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body);
      logger.d("PlayerProfile: ${{
        ...temp,
        "email": userBox.get(HIVE_USER_BOX)!['email']
      }}");
      return PlayerModel.fromJson(
          {...temp, "email": userBox.get(HIVE_USER_BOX)!['email']});
    }
    throw ServerException();
  }

  // @override
  // Future<bool> isLoggedIn() {
  //   final res = await
  //   throw ;
  // }

  ///
  ///   H E L P E R   M E T H O D   FOR HTTP CLIENT
  ///

  Future<http.Response> getIt(
    String suffix,
    Map<String, dynamic> body, [
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ]) async {
    // final res = Uri.parse(FAKE_API + suffix);
    // final res2 = http.Request("GET", res);
    // res2.body = jsonEncode(body);
    // return await res2.send();
    return await client.get(
      Uri.http(API, suffix, queryParameters),
      headers: {
        "content-type": "application/json",
        ...?headers,
      },
    );
  }

  @override
  Future<Map<dynamic, dynamic>> sendNotifyToken(String token) async {
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
}

// final class ApiAuthResponse {
//   final bool isNew;
//   final String token;

//   ApiAuthResponse({required this.isNew, required this.token});
// }
