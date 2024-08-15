import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/data/models/user_model.dart';

//  Box("User"):
//  {
//    "user":{
//      "token": String,
//      "id": String,
//    }
//  }
//
//
//  Box("Player"):
//
//    "player_info": {
//
//    }
//

abstract class LocalAuthSource {
  Future<UserModel> getUser();
  Future<void> saveUser(UserModel model);
  Future<bool> isLoggedIn();
  Future<void> localLogout();
  Future<PlayerModel> getPlayerInfo();
  Future<void> savePlayerInfo(PlayerModel playerModel);
}

class LocalAuthSourceImple implements LocalAuthSource {
  final Box<Map<String, dynamic>> userBox;
  final Box<Map<String, dynamic>> playerBox;

  const LocalAuthSourceImple({required this.userBox, required this.playerBox});

  @override
  Future<UserModel> getUser() async {
    final res = userBox.get(HIVE_USER_BOX);
    if (res == null) {
      throw EmptyCacheExeption();
    }
    return UserModel.fromJson(res);
  }

  @override
  Future<void> saveUser(UserModel model) async {
    await userBox.put(HIVE_USER_BOX, model.toJson());
  }

  @override
  Future<PlayerModel> getPlayerInfo() async {
    final playerInfo = playerBox.get(HIVE_PROFILE_BOX);
    if (playerInfo == null) {
      throw EmptyCacheExeption();
    }
    return PlayerModel.fromJson(playerInfo);
  }

  @override
  Future<void> savePlayerInfo(PlayerModel playerModel) async {
    return await playerBox.put(HIVE_PROFILE_BOX, playerModel.toJson());
  }

  @override
  Future<bool> isLoggedIn() async {
    print("Inside Local isLoggedIn ");
    final user = userBox.get(HIVE_USER_BOX);

    print("User in Box: $user");
    if (user == null || !user.containsKey("token")) throw EmptyCacheExeption();
    return true;
  }

  @override
  Future<void> localLogout() async {
    await userBox.clear();
  }
}
