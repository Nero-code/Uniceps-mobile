import 'package:flutter/material.dart';

@immutable
abstract class Failure {
  String getErrorMessage();
}

class GeneralPurposFailure implements Failure {
  final String _errorMessage;

  GeneralPurposFailure({required String errorMessage})
      : _errorMessage = errorMessage;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

////////////////////////////////////////////////////////////////////////////////
///   A U T H   F A I L U R E S
////////////////////////////////////////////////////////////////////////////////
class AuthFailure implements Failure {
  final String _errorMessage;

  AuthFailure({required String errorMessage}) : _errorMessage = errorMessage;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

class OfflineFailure implements Failure {
  final String _errorMessage;
  OfflineFailure({required String errorMessage}) : _errorMessage = errorMessage;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

class InvalidCodeFailure implements Failure {
  final String _errorMessage;
  InvalidCodeFailure({required String errMsg}) : _errorMessage = errMsg;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

class AuthUnautherizedFailure implements Failure {
  final String errMsg;
  const AuthUnautherizedFailure(this.errMsg);
  @override
  String getErrorMessage() => errMsg;
}

////////////////////////////////////////////////////////////////////////////////
///   D A T A B A S E   F A I L U R E S
////////////////////////////////////////////////////////////////////////////////

class EmptyCacheFailure implements Failure {
  final String errorMessage;

  const EmptyCacheFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class EmptyMeasureFailure implements Failure {
  final String errorMessage;

  const EmptyMeasureFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class EmptySubsFailure implements Failure {
  final String errorMessage;

  const EmptySubsFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class EmptyGymsListFailure implements Failure {
  final String errorMessage;

  const EmptyGymsListFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class EmptyTrainingDaysFailure implements Failure {
  final String errorMessage;

  const EmptyTrainingDaysFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class NotAMemberOfGymFailure implements Failure {
  final String errorMessage;

  const NotAMemberOfGymFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class EmptyExercisesFailure implements Failure {
  final String errorMessage;

  const EmptyExercisesFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class DatabaseFailure implements Failure {
  final String errorMsg;

  DatabaseFailure({required this.errorMsg});

  @override
  String getErrorMessage() => errorMsg;
}

class NoInternetConnectionFailure implements Failure {
  final String errMsg;
  NoInternetConnectionFailure({required this.errMsg});
  @override
  String getErrorMessage() => errMsg;
}

class ServerFailure implements Failure {
  final String errMsg;
  ServerFailure({required this.errMsg});

  @override
  String getErrorMessage() => errMsg;
}

class NotFoundFailure implements Failure {
  final String errMsg;
  NotFoundFailure({required this.errMsg});

  @override
  String getErrorMessage() => errMsg;
}

class NoGymSpecifiedFailure implements Failure {
  final String errMsg;
  NoGymSpecifiedFailure({required this.errMsg});

  @override
  String getErrorMessage() => errMsg;
}

class NoTrainingProgramFailure implements Failure {
  final String errMsg;
  const NoTrainingProgramFailure(this.errMsg);

  @override
  String getErrorMessage() {
    return errMsg;
  }
}

class NoAttendenceFoundFailure implements Failure {
  final String errMsg;
  const NoAttendenceFoundFailure(this.errMsg);

  @override
  String getErrorMessage() => errMsg;
}

class MethodNotAllowedFailure implements Failure {
  final String errMsg;
  const MethodNotAllowedFailure(this.errMsg);

  @override
  String getErrorMessage() => errMsg;
}
