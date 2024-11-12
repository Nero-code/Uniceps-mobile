import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:uniceps/app/domain/models/profile_models/attendence_model.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/exceptions.dart';

abstract class IAttendenceRemoteSource {
  Future<List<AttendenceModel>> getAllAttendance(String gymId, String pid);
}

class AttendenceAPISource implements IAttendenceRemoteSource {
  const AttendenceAPISource(http.Client client, Box<Map> userBox, Logger logger)
      : _client = client,
        _userBox = userBox,
        _logger = logger;

  final http.Client _client;
  final Box<Map<dynamic, dynamic>> _userBox;
  final Logger _logger;

  @override
  Future<List<AttendenceModel>> getAllAttendance(
      String gymId, String pid) async {
    if (pid.isEmpty) {
      throw NoAttendenceLogFoundException();
    }
    final res = await _client.get(
      Uri.parse("$API$HTTP_PRESENCE/$gymId/$pid"),
      headers: {
        ...HEADERS,
        "x-access-token": _userBox.get(HIVE_USER_BOX)!["token"],
      },
    );
    _logger.t("attenence code: ${res.statusCode}");

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List<dynamic>;
      final list = <AttendenceModel>[];
      for (var i in data) {
        list.add(AttendenceModel.fromJson(i));
      }
      _logger.t(list);

      return list;
    } else if (res.statusCode == 204) {
      throw NoAttendenceLogFoundException();
    }

    throw ServerException();
  }
}
