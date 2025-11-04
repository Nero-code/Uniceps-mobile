import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/app/data/sources/services/token_service_simple.dart';

class HttpClientHelper implements ClientHelper {
  const HttpClientHelper(
      {required Client client, required SimpleTokenService tokenService})
      : _tokenService = tokenService,
        _client = client;

  final Client _client;
  final SimpleTokenService _tokenService;
  // final dataNodeInResponse = 'data';

  ///  For more custom behaivuar
  Client get client => _client;
  SimpleTokenService get tokenService => _tokenService;

  @override
  Future<T> getHandler<T>(String api, String urlPart,
      T Function(Map<String, dynamic> json) fromJson,
      {bool needsHeader = true, Map<String, String>? queryParams}) async {
    final res = await _client.get(
      Uri.https(api, urlPart, queryParams),
      headers: await getHeader(needsHeader),
    );

    if (kDebugMode) {
      print("getHandler code: ${res.statusCode}\n" "URL: ${api + urlPart}");
      print("getHandler body: ${res.body}");
    }
    handleHttpStatus(res);

    return fromJson(jsonDecode(res.body));
  }

  @override
  Future<List<T>> getListHandler<T>(
      String api, String urlPart, T Function(Map<String, dynamic>) fromJson,
      {bool needsHeader = true, Map<String, String>? queryParams}) async {
    final res = await _client.get(
      Uri.https(api, urlPart, queryParams),
      headers: await getHeader(needsHeader),
    );

    if (kDebugMode) {
      print("getListHandler code: ${res.statusCode}\n" "URL: ${api + urlPart}");
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
      Uri.https(api, urlPart),
      headers: await getHeader(needsHeader),
      body: jsonEncode(body),
    );

    if (kDebugMode) {
      print("getListHandler code: ${res.statusCode}\n" "URL: ${api + urlPart}");
      print("getListHandler body: ${res.body}");
    }

    handleHttpStatus(res);

    if (res.statusCode == HttpStatus.ok ||
        res.statusCode == HttpStatus.created) {
      if (fromJson != null) {
        return fromJson(jsonDecode(res.body));
      }
      if (orElse != null) {
        orElse(jsonDecode(res.body));
      }
    }

    return null;
  }

  @override
  Future<void> putHandler(String api, String urlPart, Map<String, dynamic> body,
      {bool needsHeader = true}) async {
    final res = await _client.put(
      Uri.https("$api" "$urlPart"),
      headers: await getHeader(needsHeader),
      body: body,
    );
    handleHttpStatus(res);

    if (kDebugMode) {
      print("putHandler code: ${res.statusCode}");
      print("putHandler body: ${res.body}");
    }
  }

  @override
  Future<void> deleteHandler(
      String api, String urlPart, Map<String, dynamic> body,
      {bool needsHeader = true}) async {
    final res = await _client.delete(Uri.https("$api" "$urlPart"),
        headers: await getHeader(needsHeader), body: body);

    if (kDebugMode) {
      print("deleteHandler code: ${res.statusCode}");
      print("deleteHandler body: ${res.body}");
    }
  }

  Future<Map<String, String>> getHeader(bool needToken) async {
    // final session = await _tokenService.session;
    // return {'Authorization': "Bearer ${session!.accessToken}"};
    // final a = await _tokenService.getAccessToken();
    return {
      if (needToken)
        'Authorization': "Bearer ${await _tokenService.getAccessToken()}",
      'content-type': 'application/json;charset=utf-8',
      'accept': 'application/json',
    };
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
