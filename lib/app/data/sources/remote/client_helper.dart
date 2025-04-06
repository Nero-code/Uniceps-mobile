import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/sources/remote/token_service.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

class ClientHelper {
  const ClientHelper(
      {required Client client, required TokenService tokenService})
      : _tokenService = tokenService,
        _client = client;

  final Client _client;
  final TokenService _tokenService;
  final dataNodeInResponse = 'data';

  ///  For more custom behaivuar
  Client get client => _client;
  TokenService get tokenService => _tokenService;

  Future<T> getHandler<T extends BaseDTO>(
      String urlPart, T Function(Map<String, dynamic> json) fromJson,
      [Map<String, String>? queryParams]) async {
    final Response res;
    // try {
    res = await _client.get(Uri.https("$API", "$urlPart", queryParams),
        headers: await getHeader());
    // } catch (e) {
    //   print("caught Exception in getHandler ${e.toString()}");
    //   if (e is DioException) _catchException(e);
    //   throw Exception(e);
    // }
    if (kDebugMode) {
      print("getHandler code: ${res.statusCode}");
      print("getHandler body: ${res.body}");
    }

    return fromJson((res.body as Map)[dataNodeInResponse]);
  }

  Future<List<T>> getListHandler<T extends BaseDTO>(
      String urlPart, T Function(Map<String, dynamic>) fromJson,
      [Map<String, String>? queryParams]) async {
    print("getListHandler: ${API + urlPart}");
    final Response res;
    // try {
    res = await _client.get(Uri.https("$API", "$urlPart", queryParams),
        headers: await getHeader());
    // } catch (e) {
    //   print(e.toString());
    //   if (e is DioException) _catchException(e);
    //   throw Exception();
    // }
    if (kDebugMode) {
      print("getListHandler code: ${res.statusCode}");
      print("getListHandler body: ${res.body}");
    }

    final data = jsonDecode(res.body)[dataNodeInResponse] as Iterable;
    if (data.isEmpty) {
      throw EmptyResponseException();
    }

    return data.map((e) => fromJson(e)).toList();
  }

  Future<T?> postHandler<T extends BaseDTO>(
    String urlPart,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic> json)? fromJson,
    void Function(Map<String, dynamic> body)? orElse,
  }) async {
    print(API + urlPart);

    final res = await _client.post(
      Uri.https("$API" "$urlPart"),
      headers: await getHeader(),
      body: body,
    );

    _mapStatusToError(res);
    // } catch (e) {
    //   if (e is DioException) _catchException(e);
    //   rethrow;
    // }
    // print(res.realUri);
    print("postHandler code: ${res.statusCode}");
    print("postHandler body: ${res.body}");

    if (res.statusCode == HttpStatus.created) {
      if (fromJson != null) {
        // return fromJson(jsonDecode(
        //     (res.body))[dataNodeInResponse]);

        return fromJson(jsonDecode(res.body)[dataNodeInResponse]);
      }
      if (orElse != null) {
        orElse(res.body as Map<String, dynamic>);
      }
    }

    return null;
  }

  Future<void> putHandler(
    String urlPart,
    Map<String, dynamic> body,
  ) async {
    final res = await _client.put(
      Uri.https("$API" "$urlPart"),
      headers: await getHeader(),
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

  Future<void> deleteHandler(
    String urlPart,
    Map<String, dynamic> body,
  ) async {
    final Response res;

    // try {
    res = await _client.delete(Uri.https("$API" "$urlPart"),
        headers: await getHeader(), body: body);
    // } catch (e) {
    //   if (e is DioException) _catchException(e);
    //   rethrow;
    // }
    print("deleteHandler code: ${res.statusCode}");
    print("deleteHandler body: ${res.body}");

    // switch (res.statusCode) {
    //   case HttpStatus.noContent:
    //     return;
    //   case HttpStatus.ok:
    //     return;
    //   case HttpStatus.created:
    //     return;
    //   case HttpStatus.badRequest:
    //     throw DuplicateActionException();
    //   case HttpStatus.notFound:
    //     throw DuplicateActionException();
    //   case HttpStatus.badGateway:
    //     throw ServerDownException();
    //   default:
    //     throw Exception(res.body);
    // }
  }

  // String mapStatusCodeToAction(http.Response res) {
  //   switch (res.statusCode) {
  //     case HttpStatus.ok:
  //       return res.body;
  //     case HttpStatus.created:
  //       return res.body;
  //     case HttpStatus.badRequest:
  //       throw DuplicateActionException();
  //     case HttpStatus.notFound:
  //       throw DuplicateActionException();
  //     case HttpStatus.badGateway:
  //       throw ServerDownException();
  //     default:
  //       throw Exception(res.body);
  //   }
  // }

  Future<Map<String, String>> getHeader() async {
    final session = await _tokenService.session;
    if (session == null) {
      throw SessionGenerationException();
    }
    return {
      // 'Content-Type': 'application/json; charset=UTF-8',
      // "charset": "utf-8",
      // "Accept-Charset": "utf-8",
      // 'Accept': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${session.accessToken}",
    };
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
