import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/sources/services/client_helper.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class NoTokenHttpClientHelper implements ClientHelper {
  const NoTokenHttpClientHelper({required Client client}) : _client = client;

  final Client _client;
  // final dataNodeInResponse = 'data';

  ///  For more custom behaivuar
  Client get client => _client;

  @override
  Future<T> getHandler<T extends BaseDTO>(String api, String urlPart,
      T Function(Map<String, dynamic> json) fromJson,
      [Map<String, String>? queryParams]) async {
    final Response res;
    // try {
    res = await _client.get(Uri.https(api, urlPart, queryParams));
    // } catch (e) {
    //   print("caught Exception in getHandler ${e.toString()}");
    //   if (e is DioException) _catchException(e);
    //   throw Exception(e);
    // }
    if (kDebugMode) {
      print("getHandler code: ${res.statusCode}");
      print("getHandler body: ${res.body}");
    }

    return fromJson(jsonDecode(res.body));
  }

  @override
  Future<List<T>> getListHandler<T extends BaseDTO>(
      String api, String urlPart, T Function(Map<String, dynamic>) fromJson,
      [Map<String, String>? queryParams]) async {
    print("getListHandler: ${api + urlPart}");
    final Response res;
    // try {
    res = await _client.get(Uri.https(api, urlPart, queryParams));
    // } catch (e) {
    //   print(e.toString());
    //   if (e is DioException) _catchException(e);
    //   throw Exception();
    // }
    if (kDebugMode) {
      print("getListHandler code: ${res.statusCode}");
      print("getListHandler body: ${res.body}");
    }

    final data = jsonDecode(res.body) as Iterable;
    if (data.isEmpty) {
      throw EmptyResponseException();
    }

    return data.map((e) => fromJson(e)).toList();
  }

  @override
  Future<T?> postHandler<T extends BaseDTO>(
    String api,
    String urlPart,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic> json)? fromJson,
    void Function(Map<String, dynamic> body)? orElse,
  }) async {
    if (kDebugMode) print(api + urlPart);

    final res = await _client.post(
      Uri.https("$api" "$urlPart"),
      body: body,
    );

    _mapStatusToError(res);
    // } catch (e) {
    //   if (e is DioException) _catchException(e);
    //   rethrow;
    // }
    // print(res.realUri);
    if (kDebugMode) {
      print("postHandler code: ${res.statusCode}");
      print("postHandler body: ${res.body}");
    }

    if (res.statusCode == HttpStatus.created) {
      if (fromJson != null) {
        // return fromJson(jsonDecode(
        //     (res.body))[dataNodeInResponse]);

        return fromJson(jsonDecode(res.body));
      }
      if (orElse != null) {
        orElse(res.body as Map<String, dynamic>);
      }
    }

    return null;
  }

  @override
  Future<void> putHandler(
    String api,
    String urlPart,
    Map<String, dynamic> body,
  ) async {
    final res = await _client.put(
      Uri.https("$api" "$urlPart"),
      body: body,
    );
    _mapStatusToError(res);
    // } catch (e) {
    //   if (e is DioException) _catchException(e);
    //   rethrow;
    // }

    print("putHandler code: ${res.statusCode}");
    print("putHandler body: ${res.body}");
  }

  @override
  Future<void> deleteHandler(
    String api,
    String urlPart,
    Map<String, dynamic> body,
  ) async {
    final Response res;

    // try {
    res = await _client.delete(Uri.https("$api" "$urlPart"), body: body);
    // } catch (e) {
    //   if (e is DioException) _catchException(e);
    //   rethrow;
    // }
    if (kDebugMode) {
      print("deleteHandler code: ${res.statusCode}");
      print("deleteHandler body: ${res.body}");
    }
  }
}

void _mapStatusToError(Response res) {
  print("_mapStatusToError: ${res.body}");
  switch (res.statusCode) {
    case HttpStatus.notFound:
      throw EmptyResponseException();
    case HttpStatus.badRequest:
      throw BadRequestException();
    case HttpStatus.badGateway:
      throw ServerDownException();
    default:
      throw Exception('Unknown Error');
  }
}
