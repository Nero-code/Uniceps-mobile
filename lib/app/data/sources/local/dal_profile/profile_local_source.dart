import 'dart:convert';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/models/auth_models/profile_model.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/helpers/file_helper.dart';

abstract class IProfileLocalSource {
  // Profile Responsibility
  Future<ProfileModel> getProfileData();

  Future<void> saveProfileData(ProfileModel model);
  Future<void> deleteProfileData();

  Future<void> changeProfilePic(Uint8List image);
  Future<void> deleteProfilePic();
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
      final profile = ProfileModel.fromJson(jsonDecode(res));
      final photo = await FileHelper.getProfileImage();
      return profile.copyWith(photo: photo);
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> saveProfileData(ProfileModel model) async {
    logger.t("$title --> saveProfileData");
    await prefs.setString(_profileKey, jsonEncode(model.toJson()));
    if (model.photo != null) {
      await FileHelper.saveProfileImage(model.photo!);
    }
  }

  @override
  Future<void> deleteProfileData() async {
    logger.t("$title --> deleteProfileData");
    await prefs.remove(_profileKey);
    await FileHelper.deleteProfileImage();
  }

  @override
  Future<void> changeProfilePic(Uint8List image) async {
    logger.t("$title --> changeProfilePic");
    await FileHelper.saveProfileImage(image);
  }

  @override
  Future<void> deleteProfilePic() async {
    logger.t("$title --> deleteProfilePic");
    await FileHelper.deleteProfileImage();
  }
}
