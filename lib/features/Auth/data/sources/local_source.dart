import 'package:dartz/dartz.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/data/models/user_model.dart';

abstract class LocalAuthSource {
  Future<Unit> isLoggedIn();
  Future<Unit> getCredentials();
  Future<Unit> saveCredentials({required UserModel userModel});
  Future<Unit> getPlayerInfo();
  Future<Unit> savePlayerInfo({required PlayerModel playerModel});
}

class LocalAuthSourceImple {
  // final database hive;
}
