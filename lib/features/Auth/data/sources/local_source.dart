import 'package:firebase_messaging/firebase_messaging.dart';
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
  final Box<Map<dynamic, dynamic>> userBox, playerBox;
  final Future<void> Function() resetBottun;
  const LocalAuthSourceImple({
    required this.userBox,
    required this.playerBox,
    required this.resetBottun,
  });

  @override
  Future<UserModel> getUser() async {
    print("Inside Local getUser!");
    // print("${userBox.get(HIVE_USER_BOX)}");
    final res = userBox.get(HIVE_USER_BOX);
    print(res);
    if (res == null || res.isEmpty) {
      throw EmptyCacheExeption();
    }
    return UserModel.fromJson(res);
  }

  @override
  Future<void> saveUser(UserModel model) async {
    print("LOCAL SAVE USER: clear count: ${await userBox.clear()}");
    print("Model: ${model.toJson()}\n ${model.toJson().runtimeType}");
    await userBox.put(HIVE_USER_BOX, model.toJson());
    print("DATA SAVED! ${userBox.get(HIVE_USER_BOX)}");
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
    print(playerModel.toJson());
    return await playerBox.put(
      HIVE_PROFILE_BOX,
      playerModel.toJson(),
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    print("check 1: Inside Local isLoggedIn ");

    print(userBox.get(HIVE_USER_BOX)?.toString());
    final user = userBox.get(HIVE_USER_BOX);

    print("User in Box: $user");
    if (user == null || !user.containsKey("token")) throw EmptyCacheExeption();
    final notify = await FirebaseMessaging.instance.getToken();
    if (notify != user['notify']) {
      user.addAll({'notify': notify});
      userBox.put(HIVE_USER_BOX, user);
    }
    return true;
  }

  @override
  Future<void> localLogout() async {
    await FirebaseMessaging.instance.deleteToken();
    await resetBottun();
  }
}
