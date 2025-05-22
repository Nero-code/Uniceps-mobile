import 'package:uniceps/app/data/models/base_dto.dart';

abstract class ClientHelper {
  Future<T> getHandler<T extends BaseDTO>(String api, String urlPart,
      T Function(Map<String, dynamic> json) fromJson,
      [Map<String, String>? queryParams]);

  Future<List<T>> getListHandler<T extends BaseDTO>(
      String api, String urlPart, T Function(Map<String, dynamic>) fromJson,
      [Map<String, String>? queryParams]);

  Future<T?> postHandler<T extends BaseDTO>(
      String api, String urlPart, Map<String, dynamic> body,
      {T Function(Map<String, dynamic> json)? fromJson,
      void Function(Map<String, dynamic> body)? orElse});

  Future<void> putHandler(
      String api, String urlPart, Map<String, dynamic> body);
  Future<void> deleteHandler(
      String api, String urlPart, Map<String, dynamic> body);
}
