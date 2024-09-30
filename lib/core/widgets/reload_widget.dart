import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Image(image: AssetImage(errorImageMapper(f))),
          SizedBox(height: gapSize),
          Text(errorToTextMapper(context, f)),
          SizedBox(height: gapSize),
          IconButton(
              onPressed: callBack, icon: const Icon(Icons.refresh_rounded)),
        ],
      ),
    );
  }

  String errorImageMapper(Failure f) {
    switch (f.runtimeType) {
      case NoGymSpecifiedFailure:
        return "$PHOTOS_PATH" "$IMG_EMPTY_2";

      case NoTrainingProgramFailure:
        return "$PHOTOS_PATH" "$IMG_NO_PROGRAM";

      case ServerFailure:
        return "$PHOTOS_PATH" "$IMG_SERVER_DOWN";

      //  E M P T Y   F A I L U R E S
      // case NoAttendenceFoundFailure:
      case EmptyAttendenceFailure:
        return "$PHOTOS_PATH" "$IMG_NO_ATTENDENCE";
      case EmptyMeasureFailure:
        return "$PHOTOS_PATH" "$IMG_NO_MEASUREMENTS";
      case EmptyGymsListFailure:
        return "$PHOTOS_PATH" "$IMG_EMPTY";
      case EmptyTrainingDaysFailure:
      case EmptySubsFailure:
      case EmptyCacheFailure:
        return "$PHOTOS_PATH" "$IMG_EMPTY_2";

      // case NoInternetConnectionFailure:
      case OfflineFailure:
        return "$PHOTOS_PATH" "$IMG_NO_INTERNET";
      case DatabaseFailure:
        return "$PHOTOS_PATH" "$IMG_VOID";

      case NotFoundFailure:
        return "$PHOTOS_PATH" "$IMG_BLANK";

      case AuthFailure:
        return "$PHOTOS_PATH" "$IMG_DESKTOP";

      case GeneralPurposFailure:
        return "$PHOTOS_PATH" "$IMG_VOID";

      default:
        return "$PHOTOS_PATH" "$IMG_SERVER_DOWN";
    }
  }

  String errorToTextMapper(BuildContext context, Failure f) {
    final local = AppLocalizations.of(context)!;
    switch (f.runtimeType) {
      case NoGymSpecifiedFailure:
        return local.emptyGymsList;
      case NoTrainingProgramFailure:
        return local.empty;
      case ServerFailure:
        return local.errServerException;

      //  E M P T Y   F A I L U R E S
      case EmptyGymsListFailure:
        return local.emptyGymsList;
      case EmptyMeasureFailure:
        return local.emptyMeasurements;
      case EmptySubsFailure:
        return local.emptySubscriptions;
      case EmptyAttendenceFailure:
        return local.emptyAttendence;
      case EmptyExercisesFailure:
        return local.emptyExcercises;
      case EmptyCacheFailure:
        return local.empty;
      case OfflineFailure:
        return local.errNoInternet;
      case DatabaseFailure:
        return local.error;
      case NoInternetConnectionFailure:
        return local.errNoInternet;
      case NotFoundFailure:
        return local.empty;
      // case NoAttendenceFoundFailure:

      case GeneralPurposFailure:
      default:
        return "";
    }
  }
}
