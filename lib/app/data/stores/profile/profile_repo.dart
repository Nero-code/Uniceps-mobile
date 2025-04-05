import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_profile/profile_remote_source.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/contracts/profile_repo/i_profile_service.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';

class ProfileRepoImpl implements IProfileService {
  const ProfileRepoImpl({
    required this.local,
    required this.remote,
    required this.checker,
    required this.logger,
  });

  final IProfileLocalSource local;
  final IProfileRemoteSource remote;
  final InternetConnectionChecker checker;
  final Logger logger;

  @override
  Future<Either<Failure, Player>> getProfileData() async {
    logger.d("ProfileBloc --> Repo --> getProfileData");
    logger.d(await checker.hasConnection);

    if (await checker.hasConnection) {
      try {
        logger.d("REMOTE_S --> ");
        final res = await remote.getPlayerInfo();
        await local.savePlayerData(res);
        logger.d("profile res: $res");
        return Right(res);
      } on ClientException {
        logger.i("Internet Exception");
        try {
          final res = await local.getProfileData();
          logger.i("found in local");
          return Right(res);
        } catch (e) {
          logger.i("nothing found");
          return Left(NoInternetConnectionFailure(errMsg: ""));
        }
      } on ServerException {
        logger.e("profile repo remote server exception");
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        logger.f("profile repo remote unknown exception", error: e.toString());
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    } else {
      // return Left(NoInternetConnectionFailure(errMsg: ""));

      try {
        logger.d("before: local getProfileData");
        final res = await local.getProfileData();
        logger.d("after getProfileData: ${res.toJson()}");
        return Right(res);
      } on EmptyCacheExeption {
        logger.d("No RECORD");
        return const Left(EmptyCacheFailure(errorMessage: "No records"));
      } catch (e) {
        logger.d("Error: $e");
        return Left(
          GeneralPurposFailure(
              errorMessage: "unknown Error!"
                  "\n"
                  "Error: ${e.runtimeType} > ${e.toString()}"),
        );
      }
    }
  }

  @override
  Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
      {required bool isCreate}) async {
    logger.t("REPO: Submit profile");
    if (await checker.hasConnection) {
      try {
        logger.t("SubmitProfile --> submitting profile data:");

        final uid =
            await remote.submitProfileData(playerModel, isCreate: isCreate);

        logger.t("SubmitProfile --> parsing PlayerModel");

        final pm = PlayerModel.fromJson({...playerModel.toJson(), "uid": uid});

        logger.t("SubmitProfile --> saving player data");

        await local.savePlayerData(pm);

        logger.t("SubmitProfile --> DONE");

        return Right(playerModel);
      } on ClientException {
        return Left(NoInternetConnectionFailure(errMsg: ""));
      } on ServerException {
        logger.e("Submit Profile --> ServerEXception");
        return Left(ServerFailure(errMsg: "Server Error"));
      } catch (e) {
        logger.f("Submit Profile --> GeneralEXception", error: e);
        return Left(GeneralPurposFailure(errorMessage: e.toString()));
      }
    }
    return Left(NoInternetConnectionFailure(errMsg: "Offline"));
  }
}
