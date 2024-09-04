import 'package:flutter/material.dart';

@immutable
abstract class Failure {
  String getErrorMessage();
}

class GeneralPurposFailure extends Failure {
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
class AuthFailure extends Failure {
  final String _errorMessage;

  AuthFailure({required String errorMessage}) : _errorMessage = errorMessage;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

class OfflineFailure extends Failure {
  final String _errorMessage;
  OfflineFailure({required String errorMessage}) : _errorMessage = errorMessage;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

class InvalidCodeFailure extends Failure {
  final String _errorMessage;
  InvalidCodeFailure({required String errMsg}) : _errorMessage = errMsg;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

////////////////////////////////////////////////////////////////////////////////
///   D A T A B A S E   F A I L U R E S
////////////////////////////////////////////////////////////////////////////////

class EmptyCacheFailure extends Failure {
  final String errorMessage;

  EmptyCacheFailure({required this.errorMessage});
  @override
  String getErrorMessage() {
    return errorMessage;
  }
}

class DatabaseFailure extends Failure {
  final String errorMsg;

  DatabaseFailure({required this.errorMsg});

  @override
  String getErrorMessage() => errorMsg;
}

class NoInternetConnectionFailure extends Failure {
  final String errMsg;
  NoInternetConnectionFailure({required this.errMsg});
  @override
  String getErrorMessage() => errMsg;
}

class ServerFailure extends Failure {
  final String errMsg;
  ServerFailure({required this.errMsg});

  @override
  String getErrorMessage() => errMsg;
}

class NotFoundFailure extends Failure {
  final String errMsg;
  NotFoundFailure({required this.errMsg});

  @override
  String getErrorMessage() => errMsg;
}

class NoGymSpecifiedFailure extends Failure {
  final String errMsg;
  NoGymSpecifiedFailure({required this.errMsg});

  @override
  String getErrorMessage() => errMsg;
}
