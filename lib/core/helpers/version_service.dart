import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/services/internet_client/http_client_helper.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/helpers/version.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class VersionService {
  static const versionFlag = 'VersionFlag';

  const VersionService({required HttpClientHelper clientHelper, required SharedPreferences prefs})
    : _prefs = prefs,
      _clientHelper = clientHelper;
  final HttpClientHelper _clientHelper;
  final SharedPreferences _prefs;

  Future<Version> checkAppUpdates() async {
    try {
      final res = await _clientHelper.getHandler(ApiRoutes.domain, ApiRoutes.version, Version.fromJson);
      await _prefs.setString(versionFlag, jsonEncode(res.toJson()));
    } catch (e) {
      logger.t(e.toString());
    }

    final versionString = _prefs.getString(versionFlag);
    if (versionString == null) return Version.current();
    return Version.fromJson(jsonDecode(versionString));
  }
}
