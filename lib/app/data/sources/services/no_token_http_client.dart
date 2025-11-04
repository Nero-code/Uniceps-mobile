import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';

class NoTokenHttpClientHelper implements ClientHelper {
  const NoTokenHttpClientHelper({required Client client}) : _client = client;

  final Client _client;
  // final dataNodeInResponse = 'data';

  ///  For more custom behaivuar
  Client get client => _client;

  @override
  Future<T> getHandler<T>(String api, String urlPart,
      T Function(Map<String, dynamic> json) fromJson,
      {bool needsHeader = true, Map<String, String>? queryParams}) async {
    final res = await _client.get(Uri.https(api, urlPart, queryParams));

    if (kDebugMode) {
      print("getHandler code: ${res.statusCode}");
      print("getHandler body: ${res.body}");
    }
    handleHttpStatus(res);

    return fromJson(jsonDecode(res.body));
  }

  @override
  Future<List<T>> getListHandler<T>(
      String api, String urlPart, T Function(Map<String, dynamic>) fromJson,
      {bool needsHeader = true, Map<String, String>? queryParams}) async {
    print("getListHandler: ${api + urlPart}");
    final res = await _client.get(Uri.https(api, urlPart, queryParams));

    if (kDebugMode) {
      print("getListHandler code: ${res.statusCode}");
      print("getListHandler body: ${res.body}");
    }
    handleHttpStatus(res);
    final data = jsonDecode(res.body) as Iterable;
    if (data.isEmpty) {
      throw NoContentException();
    }

    return data.map((e) => fromJson(e)).toList();
  }

  @override
  Future<T?> postHandler<T>(
    String api,
    String urlPart,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic> json)? fromJson,
    void Function(Map<String, dynamic> body)? orElse,
    bool needsHeader = true,
  }) async {
    if (kDebugMode) print(api + urlPart);

    final res = await _client.post(
      Uri.https("$api" "$urlPart"),
      body: jsonEncode(body),
    );

    handleHttpStatus(res);

    if (kDebugMode) {
      print("postHandler code: ${res.statusCode}");
      print("postHandler body: ${res.body}");
    }

    if (res.statusCode == HttpStatus.created) {
      if (fromJson != null) {
        return fromJson(jsonDecode(res.body));
      }
      if (orElse != null) {
        orElse(res.body as Map<String, dynamic>);
      }
    }

    return null;
  }

  @override
  Future<void> putHandler(String api, String urlPart, Map<String, dynamic> body,
      {bool needsHeader = true}) async {
    final res = await _client.put(
      Uri.https("$api" "$urlPart"),
      body: body,
    );
    handleHttpStatus(res);

    print("putHandler code: ${res.statusCode}");
    print("putHandler body: ${res.body}");
  }

  @override
  Future<void> deleteHandler(
      String api, String urlPart, Map<String, dynamic> body,
      {bool needsHeader = true}) async {
    final res = await _client.delete(Uri.https("$api" "$urlPart"), body: body);

    if (kDebugMode) {
      print("deleteHandler code: ${res.statusCode}");
      print("deleteHandler body: ${res.body}");
    }
  }
}

String handleHttpStatus(Response res) {
  switch (res.statusCode) {
    case 200:
      return 'OK';
    case 201:
      return 'Created';
    case 204:
      throw NoContentException();
    case 400:
      throw BadRequestException();
    case 401:
      throw Exception('Unauthorized — please login again');
    case 403:
      throw Exception('Forbidden — you don’t have access');
    case 404:
      throw Exception('Not found — resource does not exist');
    case 500:
      throw Exception('Server error — try again later');
    case 503:
      throw Exception('Service temporarily unavailable');
    default:
      throw Exception('Unhandled status code: ${res.statusCode}');
  }
}
