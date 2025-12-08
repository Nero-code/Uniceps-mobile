import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';import 'package:uniceps/l10n/app_localizations.dart';

///   Error widget with image to identify error
class ReloadScreenWidget extends StatelessWidget {
  const ReloadScreenWidget({
    super.key,
    required this.f,
    required this.callBack,
    this.gapSize = 5,
  });
  final Failure f;
  final VoidCallback? callBack;
  final double gapSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).width * 0.5,
              image: AssetImage(
                errorImageMapper(f),
              ),
            ),
          ),
          SizedBox(height: gapSize),
          Text(errorToTextMapper(context, f)),
          SizedBox(height: gapSize),
          if (callBack != null)
            IconButton(
                onPressed: callBack, icon: const Icon(Icons.refresh_rounded)),
        ],
      ),
    );
  }

  String errorImageMapper(Failure f) {
    switch (f.runtimeType) {
      case const (NoGymSpecifiedFailure):
        return IMG_EMPTY_2;

      case const (NoTrainingProgramFailure):
        return IMG_NO_PROGRAM;

      case const (ServerFailure):
        return IMG_SERVER_DOWN;

      //  E M P T Y   F A I L U R E S
      // case NoAttendenceFoundFailure:
      case const (NotAMemberOfGymFailure):
        return IMG_NO_PROGRAM;
      case const (NoAttendenceFoundFailure):
        return IMG_NO_ATTENDENCE;
      case const (EmptyMeasureFailure):
        return IMG_NO_MEASUREMENTS;
      case const (EmptyGymsListFailure):
        return IMG_EMPTY;
      case const (EmptyTrainingDaysFailure):
      case const (EmptySubsFailure):
      case const (EmptyCacheFailure):
        return IMG_EMPTY_2;

      // case NoInternetConnectionFailure:
      // case const (OfflineFailure):
      //   return IMG_NO_INTERNET;
      case const (DatabaseFailure):
        return IMG_VOID;

      case const (NotFoundFailure):
        return IMG_BLANK;

      case const (AuthFailure):
        return IMG_DESKTOP;

      case const (GeneralPurposFailure):
        return IMG_WARNING;

      default:
        return IMG_WARNING;
    }
  }

  String errorToTextMapper(BuildContext context, Failure f) {
    final local = AppLocalizations.of(context)!;
    switch (f.runtimeType) {
      case const (NoGymSpecifiedFailure):
        return local.noGymSpecified;
      case const (NoTrainingProgramFailure):
        return local.noTrainingProgram;
      case const (ServerFailure):
        return local.errServerException;

      //
      case const (NoAttendenceFoundFailure):
        return local.emptyAttendence;

      //  E M P T Y   F A I L U R E S
      case const (EmptyGymsListFailure):
        return local.emptyGymsList;
      //
      case const (EmptyMeasureFailure):
        return local.emptyMeasurements;
      //
      case const (EmptySubsFailure):
        return local.emptySubscriptions;
      //
      case const (NotAMemberOfGymFailure):
        return local.noGymSpecified;
      //
      case const (EmptyExercisesFailure):
        return local.emptyExcercises;
      //
      case const (EmptyCacheFailure):
        return local.empty;
      //
      // case const (OfflineFailure):
      //   return local.errNoInternet;
      //
      case const (DatabaseFailure):
        return local.error;
      //
      case const (NoInternetConnectionFailure):
        return local.errNoInternet;
      //
      case const (NotFoundFailure):
        return local.empty;
      // case NoAttendenceFoundFailure:

      case const (GeneralPurposFailure):
      default:
        return local.errUnknown;
    }
  }
}
