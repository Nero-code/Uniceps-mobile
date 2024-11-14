import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/models/auth_models/player_model.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IProfileSource {
  // Profile Responsibility
  Future<PlayerModel> getProfileData();
  Future<void> savePlayerData(PlayerModel model);
}

class ProfileLocalSource implements IProfileSource {
  const ProfileLocalSource({
    required this.playerBox,
    required this.logger,
  });

  final Box<Map<dynamic, dynamic>> playerBox;
  final Logger logger;

  final title = "ProfileLocalSource";

  @override
  Future<PlayerModel> getProfileData() async {
    logger.t("$title --> getProfileData");
    final res = playerBox.get(HIVE_PROFILE_BOX);
    if (res != null) {
      logger.d("NOT NULL: $res");
      return PlayerModel.fromJson(res);
    }
    throw EmptyCacheExeption();
  }

  @override
  Future<void> savePlayerData(PlayerModel model) async {
    logger.t("$title --> saveProfileData");
    return await playerBox.put(HIVE_PROFILE_BOX, model.toJson());
  }
}
