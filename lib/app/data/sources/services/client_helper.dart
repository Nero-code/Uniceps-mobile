abstract class ClientHelper {
  Future<T> getHandler<T>(String api, String urlPart,
      T Function(Map<String, dynamic> json) fromJson,
      [Map<String, String>? queryParams]);

  Future<List<T>> getListHandler<T>(
      String api, String urlPart, T Function(Map<String, dynamic>) fromJson,
      [Map<String, String>? queryParams]);

  Future<T?> postHandler<T>(
      String api, String urlPart, Map<String, dynamic> body,
      {T Function(Map<String, dynamic> json)? fromJson,
      void Function(Map<String, dynamic> body)? orElse});

  Future<void> putHandler(
      String api, String urlPart, Map<String, dynamic> body);
  Future<void> deleteHandler(
      String api, String urlPart, Map<String, dynamic> body);
}
