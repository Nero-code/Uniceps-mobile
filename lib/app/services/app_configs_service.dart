import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/domain/contracts/profile/i_measurement_service.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/helpers/configs.dart';

class AppConfigsService {
  static const _configsKeyInPrefs = 'AppConfigs';
  AppConfigsService({required SharedPreferences prefs, required IMeasurementContract measurementContract})
    : _measurementContract = measurementContract,
      _prefs = prefs;
  final SharedPreferences _prefs;

  final IMeasurementContract _measurementContract;

  late Configs _configs;
  Configs get configs => _configs;

  Future<Configs> getAppConfigs() async {
    final confJson = _prefs.getString(_configsKeyInPrefs);

    if (confJson == null) {
      // Get Language
      final systemLang = PlatformDispatcher.instance.locale.languageCode;
      final defaultAppLanguage = Lang.values.firstWhere(
        (lang) => lang.code.toLowerCase() == systemLang.toLowerCase(),
        orElse: () => Lang.en,
      );

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
    Locale? dietLibLanguage,
    ThemeMode? mode,
    Goal? goal,
    ActivityLevel? activityLevel,
  }) async {
    _configs = _configs.copyWith(
      appLanguage: appLanguage,
      exerciseLibLanguage: exerciseLibLanguage,
      dietLibLanguage: dietLibLanguage,
      mode: mode,
      goal: goal,
      activityLevel: activityLevel,
    );
    await _prefs.setString(_configsKeyInPrefs, jsonEncode(_configs.toJson()));
    return _configs;
  }

  Future<double?> getCaloriesGoal() async {
    if (_configs.activityLevel == null) return null;
    final res = await _measurementContract.getCalories();
    return (res ?? 0) * (_configs.activityLevel?.multiplier ?? 0);
  }
}
