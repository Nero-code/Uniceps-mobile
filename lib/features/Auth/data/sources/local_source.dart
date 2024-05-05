import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';

abstract class LocalAuthSource {
  Future<String> getUserToken();
  Future<bool> isLoggedIn();
  Future<PlayerModel> getPlayerInfo();
  Future<Unit> savePlayerInfo({required PlayerModel playerModel});
}

class LocalAuthSourceImple implements LocalAuthSource {
  final Box<Map<String, dynamic>> userBox;

  const LocalAuthSourceImple({required this.userBox});

  @override
  Future<String> getUserToken() async {
    final res = userBox.get("token");
    if (res == null) {
      throw EmptyCacheExeption();
    }
    return res['token'];
  }

  @override
  Future<PlayerModel> getPlayerInfo() async {
    final playerInfo = userBox.get("player_info");
    if (playerInfo == null) {
      throw EmptyCacheExeption();
    }
    return PlayerModel.fromJson(playerInfo);
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = userBox.get("token");
    if (token == null) return false;
    return true;
  }

  @override
  Future<Unit> savePlayerInfo({required PlayerModel playerModel}) async {
    await userBox.put("player_info", playerModel.toJson());
    return unit;
  }
}
