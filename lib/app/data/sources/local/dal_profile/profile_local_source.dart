import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IProfileLocalSource {
  // Profile Responsibility
  Future<PlayerModel> getProfileData();
  Future<void> savePlayerData(PlayerModel model);
}

class ProfileLocalSource implements IProfileLocalSource {
  const ProfileLocalSource({
    required this.prefs,
    required this.logger,
  });

  final Logger logger;
  final SharedPreferences prefs;
  final title = "ProfileLocalSource";

  @override
  Future<PlayerModel> getProfileData() async {
    logger.t("$title --> getProfileData");
    final res = prefs.getString('Profile');
    if (res != null) {
      logger.t("NOT NULL: $res");
      return PlayerModel.fromJson(jsonDecode(res));
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> savePlayerData(PlayerModel model) async {
    logger.t("$title --> saveProfileData");
    await prefs.setString('Profile', jsonEncode(model.toJson()));
  }
}
