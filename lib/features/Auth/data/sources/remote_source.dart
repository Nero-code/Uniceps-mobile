import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';

abstract class RemoteAuthSource {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> verifyEmail({required String email});
  Future<bool> verifyCodeSent(
      {required String code,
      required String email,
      required String notifyToken});
  Future<void> verifyGymCode({required String gymCode});
  Future<void> uploadPlayerInfo({required PlayerModel player});
  Future<void> requestPasswordChange(String newPass);
  Future<Player> getPlayerInfo();
  // Future<bool> isLoggedIn();
}

class RemoteAuthSourceImpl implements RemoteAuthSource {
  final http.Client client;

  RemoteAuthSourceImpl({required this.client});

  @override
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    print("START FUNC: loginWithEmailAndPassword()");
    final res = await client.post(
      Uri.http(API, "/login", {}),
      body: {"email": email, "password": password},
    );

    if (res.statusCode == 200) {
      print(res.body);
      return;
    }
    print("END   FUNC: loginWithEmailAndPassword():   RES: ${res.statusCode}");
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
    final res =
        await client.put(Uri.http(API, "/player", {}), body: player.toJson());
    if (res.statusCode != 201) {
      throw Exception();
    }
  }

  @override
  Future<bool> verifyCodeSent(
      {required String code,
      required String email,
      required String notifyToken}) async {
    print("START FUNC: verifyCodeSent()");
    final res = await client.post(
        Uri.https(API, HTTP_VERIFY_CODE,
            {'Content-Type': 'application/json; charset=UTF-8'}),
        body: jsonEncode(
            {"otp": code, "email": email, "notify_token": notifyToken}));
    if (res.statusCode == 200) {
      print(res.body);
      return true;
    }

    print("END   FUNC: verifyCodeSent(): RES: ${res.statusCode}");
    return false;
  }

  @override
  Future<void> verifyEmail({required String email}) async {
    print("START FUNC: verifyEmail()");
    final res = await client.post(Uri.parse(API + HTTP_REGISTER),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({"email": email}));
    if (res.statusCode == 200) {
      print(res.body);
      return;
    }

    print("END   FUNC: verifyEmail(): RES: ${res.statusCode}");
    throw Exception();
  }

  @override
  Future<void> verifyGymCode({required String gymCode}) async {
    final res = await client.post(Uri.parse(FAKE_API + "/Auth/verify_gym"),
        body: {"gym_code": gymCode});
    if (res.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<Player> getPlayerInfo() async {
    final res = await client.get(Uri.https(FAKE_API + HTTP_PLAYER_INFO));
    if (res.statusCode == 200) {
      final temp = jsonDecode(res.body);
      return PlayerModel.fromJson(temp);
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
}
