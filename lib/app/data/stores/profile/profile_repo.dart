import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/auth_models/profile_model.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_profile/profile_remote_source.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/app/domain/contracts/profile/i_profile_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class ProfileRepo implements IProfileService {
  const ProfileRepo({required this.localSource, required this.remoteSource});

  final IProfileLocalSource localSource;
  final IProfileRemoteSource remoteSource;

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final res = await localSource.getProfileData();
      return Right(res);
    } catch (e) {
      return const Left(EmptyCacheFailure(errorMessage: ""));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(Profile model) async {
    try {
      await localSource.savePlayerData(ProfileModel.fromEntity(model));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, String>> changeProfilePicture(String path) async {
    // TODO: implement changeProfilePicture
    throw UnimplementedError();
  }
}
