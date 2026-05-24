import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/models/auth_models/profile_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IProfileLocalSource {
  // Profile Responsibility
  Future<ProfileModel> getProfileData();
  Future<void> savePlayerData(ProfileModel model);
}

class ProfileLocalSource implements IProfileLocalSource {
  const ProfileLocalSource({required this.prefs, required this.logger});

  final Logger logger;
  final SharedPreferences prefs;
  // final ReactivePreferencesService prefs;
  final title = "ProfileLocalSource";
  final _profileKey = 'Profile';

  @override
  Future<ProfileModel> getProfileData() async {
    logger.t("$title --> getProfileData");
    final res = prefs.getString(_profileKey);
    if (res != null) {
      logger.t("NOT NULL: $res");
      return ProfileModel.fromJson(jsonDecode(res));
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> savePlayerData(ProfileModel model) async {
    logger.t("$title --> saveProfileData");
    await prefs.setString(_profileKey, jsonEncode(model.toJson()));
  }
}
