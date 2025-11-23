import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/contracts/profile_repo/i_profile_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class ProfileRepo implements IProfileService {
  const ProfileRepo({required this.localSource, required this.logger});

  final IProfileLocalSource localSource;
  final Logger logger;

  @override
  Future<Either<Failure, Player>> getProfile() async {
    try {
      final res = await localSource.getProfileData();
      return Right(res);
    } catch (e) {
      return const Left(EmptyCacheFailure(errorMessage: ""));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(Player model) async {
    try {
      await localSource.savePlayerData(PlayerModel.fromEntity(model));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }
}
