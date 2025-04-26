import 'package:flutter/material.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///   Error widget without image or refresh
class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({
    super.key,
    required this.f,
    this.callback,
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
    // print("Error Widget ${f.runtimeType}");
    final local = AppLocalizations.of(context)!;
    switch (f.runtimeType) {
      case const (NoGymSpecifiedFailure):
        return local.noGymSpecified;
      case const (NoTrainingProgramFailure):
        return local.noTrainingProgram;
      case const (ServerFailure):
        return local.errServerException;

      //  E M P T Y   F A I L U R E S
      case const (EmptyGymsListFailure):
        return local.emptyGymsList;
      case const (EmptyMeasureFailure):
        return local.emptyMeasurements;
      case const (EmptySubsFailure):
        return local.emptySubscriptions;
      case const (NotAMemberOfGymFailure):
        return local.noGymSpecified;
      case const (EmptyExercisesFailure):
        return local.emptyExcercises;
      case const (EmptyCacheFailure):
        return local.empty;
      case const (OfflineFailure):
        return local.errNoInternet;
      case const (DatabaseFailure):
        return local.error;
      case const (NoInternetConnectionFailure):
        return local.errNoInternet;
      case const (NotFoundFailure):
        return local.empty;
      // case NoAttendenceFoundFailure:

      case const (GeneralPurposFailure):
      default:
        return local.errUnknown;
    }
  }
}
