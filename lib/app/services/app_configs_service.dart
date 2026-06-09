import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/helpers/configs.dart';

class AppConfigsService {
  AppConfigsService({required SharedPreferences prefs}) : _prefs = prefs;
  final SharedPreferences _prefs;
  final String _configsKeyInPrefs = 'AppConfigs';

  late Configs _configs;
  Configs get configs => _configs;

  Future<Configs> getAppConfigs() async {
    final confJson = _prefs.getString(_configsKeyInPrefs);

    if (confJson == null) {
      // Get Language
      final systemLang = PlatformDispatcher.instance.locale.languageCode;
      final defaultAppLanguage = Lang.values.firstWhere((lang) => lang.code == systemLang, orElse: () => Lang.en);

      _configs = Configs.initial(language: defaultAppLanguage.code);
      await _prefs.setString(_configsKeyInPrefs, jsonEncode(_configs.toJson()));
    } else {
      _configs = Configs.fromJson(jsonDecode(confJson));
    }

    return _configs;
  }

  Future<Configs> changeAppConfigs({
    Locale? appLanguage,
    Locale? exerciseLibLanguage,
    ThemeMode? mode,
    Goal? goal,
    ActivityLevel? activityLevel,
  }) async {
    _configs = _configs.copyWith(
      appLanguage: appLanguage,
      exerciseLibLanguage: exerciseLibLanguage,
      mode: mode,
      goal: goal,
      activityLevel: activityLevel,
    );
    await _prefs.setString(_configsKeyInPrefs, jsonEncode(_configs.toJson()));
    return _configs;
  }
}
