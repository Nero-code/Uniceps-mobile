import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/auth_models/user_model.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

/// Abstraction for **account management** locally.
///
/// Authentication is not a part of the account creation process but it depends
/// on local storage to store the Authenticated User.
abstract class IAccountLocalSource {
  Future<UserModel> getUser();
  Future<void> saveUser(UserModel model);
  Future<bool> isLoggedIn();
  Future<void> localLogout();
}

class AccountLocalSourceImpl implements IAccountLocalSource {
  final Box<Map<dynamic, dynamic>> userBox;
  final Future<void> Function() resetBottun;
  final Logger logger;
  final FirebaseMessaging firebaseMessaging;

  const AccountLocalSourceImpl({
    required this.userBox,
    required this.resetBottun,
    required this.logger,
    required this.firebaseMessaging,
  });

  ///
  @override
  Future<UserModel> getUser() async {
    logger.d("Inside Local getUser!");
    // logger.d("${userBox.get(HIVE_USER_BOX)}");
    final res = userBox.get(HIVE_USER_BOX);
    logger.d(res);
    if (res == null || res.isEmpty) {
      throw EmptyCacheExeption();
    }
    return UserModel.fromJson(res);
  }

  @override
  Future<void> saveUser(UserModel model) async {
    logger.d("LOCAL SAVE USER: clear count: ${await userBox.clear()}");
    logger.d("Model: ${model.toJson()}\n ${model.toJson().runtimeType}");
    await userBox.put(HIVE_USER_BOX, model.toJson());
    logger.d("DATA SAVED! ${userBox.get(HIVE_USER_BOX)}");
  }

  @override
  Future<bool> isLoggedIn() async {
    logger.d("check 1: Inside Local isLoggedIn ");

    logger.d(userBox.get(HIVE_USER_BOX)?.toString());
    final user = userBox.get(HIVE_USER_BOX);

    logger.d("User in Box: $user");
    if (user == null || !user.containsKey("token")) throw EmptyCacheExeption();
    final notify = await firebaseMessaging.getToken();
    if (notify != user['notify']) {
      user.addAll({'notify': notify});
      userBox.put(HIVE_USER_BOX, user);
    }
    return true;
  }

  @override
  Future<void> localLogout() async {
    await firebaseMessaging.deleteToken();
    await resetBottun();
  }
}
