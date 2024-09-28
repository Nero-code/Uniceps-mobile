import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

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
          Text(f.getErrorMessage()),
          SizedBox(height: gapSize),
          Text(errorToTextMapper(f)),
          SizedBox(height: gapSize),
          IconButton(
              onPressed: callBack, icon: const Icon(Icons.refresh_rounded)),
        ],
      ),
    );
  }
}

String errorImageMapper(Failure f) {
  switch (f.runtimeType) {
    case NoGymSpecifiedFailure:
      return "$PHOTOS_PATH" "";
    case NoTrainingProgramFailure:
      return "";
    case ServerFailure:
      return "";
    case EmptyCacheFailure:
      return "";
    case OfflineFailure:
      return "";
    case DatabaseFailure:
      return "";
    case NoInternetConnectionFailure:
      return "";
    case NotFoundFailure:
      return "";
    case NoAttendenceFoundFailure:
      return "";
    case AuthFailure:
      return "";

    case GeneralPurposFailure:
      return "";

    default:
      return "";
  }
}

String errorToTextMapper(Failure f) {
  return "";
}
