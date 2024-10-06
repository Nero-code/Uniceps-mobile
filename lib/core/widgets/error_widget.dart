import 'package:flutter/material.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///   Error widget without image or refresh
class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({
    super.key,
    required this.f,
    required this.callback,
    this.gapSize = 5.0,
  });

  final Failure f;
  final VoidCallback? callback;
  final double gapSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(errorToTextMapper(context, f)),
        SizedBox(height: gapSize),
        if (callback != null)
          IconButton(
            onPressed: callback,
            icon: const Icon(Icons.refresh_rounded),
          ),
      ],
    );
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
