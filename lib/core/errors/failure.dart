import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.aOffline() = _AOffline;
  const factory AuthFailure.invalidEmailFailure() = _InvalidEmailFailure;
  const factory AuthFailure.invalidCodeFailure() = _InvalidCodeFailure;
  const factory AuthFailure.unauthorizedFailure() = _UnauthorizedFailure;
}

@freezed
class MembershipFailure with _$MembershipFailure {
  const factory MembershipFailure.mmOffline() = _MmOffline;
  const factory MembershipFailure.cantGetPlan() = _CantGetPlan;
}

@freezed
class MeasurementFailure with _$MeasurementFailure {
  const factory MeasurementFailure.msOffline() = _MsOffline;
  const factory MeasurementFailure.noRecords() = _NoRecords;
  const factory MeasurementFailure.msDbFailure() = _MsDbFailure;
}

@freezed
class PerformanceFailure with _$PerformanceFailure {
  const factory PerformanceFailure.noValues() = _NoValues;
  const factory PerformanceFailure.invalidValues() = _InvalidValues;
}

@freezed
class FileParseFailure with _$FileParseFailure {
  const factory FileParseFailure.fOffline() = _FOffline;
  const factory FileParseFailure.noFileSelected() = _NoFileSelected;
  const factory FileParseFailure.unsupportedVersion() = _UnsupportedVersion;
  const factory FileParseFailure.parserMismatch() = _ParserMismatch;
  const factory FileParseFailure.corruptedFile() = _CorruptedFile;
}

@freezed
abstract class LibSyncFailure with _$LibSyncFailure {
  const factory LibSyncFailure.libOffline({required int currentTotalCount}) = _LibOffline;
  const factory LibSyncFailure.libNotFound({required int currentTotalCount}) = _LibNotFound;
  const factory LibSyncFailure.libUnknown({required int currentTotalCount}) = _LibUnknown;
}

@freezed
abstract class IngredientFailure with _$IngredientFailure {
  const factory IngredientFailure.iOffline() = _IOffline;
  const factory IngredientFailure.emptyIngredientBucket() = _EmptyIngredientBucket;
  const factory IngredientFailure.databaseFailure({required String message}) = _IngredientDatabaseFailure;
}

@freezed
abstract class DietLogFailure with _$DietLogFailure {
  const factory DietLogFailure.noLogsToday() = _NoLogsToday;
  const factory DietLogFailure.noLogsEver() = _noLogsEver;
  const factory DietLogFailure.databaseFailure({required String message}) = _DietLogDatabaseFailure;
}

@freezed
class ExerciseFailure with _$ExerciseFailure {
  const factory ExerciseFailure.eOffline() = _EOffline;
  const factory ExerciseFailure.emptyExercises() = _EmptyExercises;
  const factory ExerciseFailure.exerciseNotFound() = _ExerciseNotFound;
  const factory ExerciseFailure.serverFailure({required String message}) = _ExerciseServerFailure;
  const factory ExerciseFailure.databaseFailure({required String message}) = _ExerciseDatabaseFailure;
}

@freezed
class PremadeFailure with _$PremadeFailure {
  const factory PremadeFailure.pOffline() = _POffline;
  const factory PremadeFailure.emptyPremade() = _EmptyPremade;
  const factory PremadeFailure.fetchFailed() = _FetchFailed;
}

@immutable
abstract class Failure {
  String getErrorMessage();
}

class GeneralPurposeFailure implements Failure {
  final String _errorMessage;

  const GeneralPurposeFailure({required String errorMessage}) : _errorMessage = errorMessage;

  @override
  String getErrorMessage() {
    return _errorMessage;
  }
}

// //////////////////////////////////////////////////////////////////////////////
//    A U T H   F A I L U R E S
// //////////////////////////////////////////////////////////////////////////////
// class AuthFailure implements Failure {
//   final String _errorMessage;

//   AuthFailure({required String errorMessage}) : _errorMessage = errorMessage;

//   @override
//   String getErrorMessage() {
//     return _errorMessage;
//   }
// }

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

class AuthUnauthorizedFailure implements Failure {
  final String errMsg;
  const AuthUnauthorizedFailure(this.errMsg);
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
