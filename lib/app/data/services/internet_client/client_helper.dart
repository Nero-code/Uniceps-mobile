abstract class ClientHelper {
  Future<T> getHandler<T>(String api, String urlPart,
      T Function(Map<String, dynamic> json) fromJson,
      {bool needsHeader = true, Map<String, String>? queryParams});

  Future<List<T>> getListHandler<T>(
      String api, String urlPart, T Function(Map<String, dynamic>) fromJson,
      {bool needsHeader = true, Map<String, String>? queryParams});

  Future<T?> postHandler<T>(
      String api, String urlPart, Map<String, dynamic> body,
      {T Function(Map<String, dynamic> json)? fromJson,
      void Function(Map<String, dynamic> body)? orElse,
      bool needsHeader = true});

  Future<void> putHandler(String api, String urlPart, Map<String, dynamic> body,
      {bool needsHeader = true});
  Future<void> deleteHandler(
      String api, String urlPart, Map<String, dynamic> body,
      {bool needsHeader = true});
}

// //////////////////////////////////////// //
//                                          //
//   AI Generated - do not change by hand   //
//                                          //
// //////////////////////////////////////// //

final class NoContentException implements Exception {
  final String message;
  NoContentException([this.message = 'No content available']);
  @override
  String toString() => 'NoContentException: $message';
}

final class BadRequestException implements Exception {
  final String message;
  BadRequestException([this.message = 'Bad request']);
  @override
  String toString() => 'BadRequestException: $message';
}

final class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = 'Unauthorized']);
  @override
  String toString() => 'UnauthorizedException: $message';
}

final class ForbiddenException implements Exception {
  final String message;
  ForbiddenException([this.message = 'Access forbidden']);
  @override
  String toString() => 'ForbiddenException: $message';
}

final class NotFoundException implements Exception {
  final String message;
  NotFoundException([this.message = 'Resource not found']);
  @override
  String toString() => 'NotFoundException: $message';
}

final class ServerErrorException implements Exception {
  final String message;
  ServerErrorException([this.message = 'Server error']);
  @override
  String toString() => 'ServerErrorException: $message';
}

final class ServiceUnavailableException implements Exception {
  final String message;
  ServiceUnavailableException([this.message = 'Service unavailable']);
  @override
  String toString() => 'ServiceUnavailableException: $message';
}

final class UnknownHttpException implements Exception {
  final int statusCode;
  final String message;
  UnknownHttpException(this.statusCode, [this.message = 'Unknown HTTP error']);
  @override
  String toString() => 'UnknownHttpException($statusCode): $message';
}
