import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:uniceps/app/data/models/auth_models/profile_model.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_profile/profile_remote_source.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/app/domain/contracts/profile/i_profile_service.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class ProfileRepo implements IProfileService {
  const ProfileRepo({required this.localSource, required this.remoteSource, required this.networkInfo});

  final IProfileLocalSource localSource;
  final IProfileRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Unit>> initializeProfile(Profile model) async {
    try {
      await localSource.saveProfileData(ProfileModel.fromEntity(model));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, Unit>> syncProfile() async {
    try {
      final profile = await localSource.getProfileData();
      await remoteSource.uploadProfile(profile);
      await localSource.saveProfileData(profile.copyWith(isSynced: true));
      return const Right(unit);
    } on ClientException {
      return Left(NoInternetConnectionFailure(errMsg: ''));
    } catch (e, s) {
      logger.e('Error syncProfile', error: e, stackTrace: s);
      return Left(ServerFailure(errMsg: ''));
    }
  }

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final res = await localSource.getProfileData();

      if (!res.isSynced) {
        if (await networkInfo.hasConnection) {
          await remoteSource.uploadProfile(res);
          final syncedRes = res.copyWith(isSynced: true);
          await localSource.saveProfileData(syncedRes);

          return Right(syncedRes.toEntity());
        }
      }
      return Right(res.toEntity());
    } catch (e,s) {
      logger.e('Error getProfile',error: e,stackTrace: s);
      return const Left(EmptyCacheFailure(errorMessage: ""));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(Profile model) async {
    try {
      final profile = ProfileModel.fromEntity(model);
      final res = await remoteSource.uploadProfile(profile);
      if (res) {
        await localSource.saveProfileData(profile);
        return const Right(unit);
      }
      return Left(ServerFailure(errMsg: ''));
    } on ClientException {
      return Left(NoInternetConnectionFailure(errMsg: ''));
    } catch (e, s) {
      logger.e('Error in saveProfile', error: e, stackTrace: s);
      return Left(ServerFailure(errMsg: ''));
    }
  }

  @override
  Future<Either<Failure, Unit>> changeProfilePicture(Uint8List image) async {
    try {
      await remoteSource.uploadPhoto(image);
      await localSource.changeProfilePic(image);
      return const Right(unit);
    } on ClientException {
      return Left(NoInternetConnectionFailure(errMsg: ''));
    } catch (e, s) {
      logger.e('Error in changeProfilePicture', error: e, stackTrace: s);
      return Left(ServerFailure(errMsg: ''));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProfilePicture() async {
    try {
      await remoteSource.deletePhoto();
      await localSource.deleteProfilePic();
      return const Right(unit);
    } on ClientException {
      return Left(NoInternetConnectionFailure(errMsg: ''));
    } catch (e, s) {
      logger.e('Error in deleteProfilePicture', error: e, stackTrace: s);
      return Left(ServerFailure(errMsg: ''));
    }
  }
}
