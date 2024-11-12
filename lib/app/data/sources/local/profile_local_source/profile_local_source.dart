import 'package:uniceps/app/domain/models/auth_models/player_model.dart';

abstract class IProfileSource {
  // Profile Responsibility
  Future<PlayerModel> getProfileData();
  Future<void> savePlayerData(PlayerModel model);
}
