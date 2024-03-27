import 'package:dartz/dartz.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';

abstract class RemotAuthSource {
  Future<Unit> requestEmailVerficationCode({
    required String email,
    required String password,
  });
  Future<bool> verifyCodeSent({required String code});
  Future<Unit> verifyGymCode({required String gymCode});
  Future<Unit> uploadPlayerInfo({required PlayerModel player});
  Future<Unit> requestPasswordChange(String newPass);
  Future<bool> isLoggedIn();
}

class RemoteAuthSourceImpl {}
