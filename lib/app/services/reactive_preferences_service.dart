import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ReactivePreferencesService {
  final SharedPreferences _prefs;
  final _keyController = StreamController<String>.broadcast();

  ReactivePreferencesService(this._prefs);

  /// Stream of keys that have been modified through this service
  Stream<String> get onKeyChanged => _keyController.stream;

  /// Listen to changes for a specific key
  Stream<String> listenToKey(String key) {
    return onKeyChanged.where((changedKey) => changedKey == key);
  }

  // --- Wrapper methods that trigger the stream ---

  Future<bool> setString(String key, String value) async {
    final result = await _prefs.setString(key, value);
    if (result) _keyController.add(key);
    return result;
  }

  Future<bool> setInt(String key, int value) async {
    final result = await _prefs.setInt(key, value);
    if (result) _keyController.add(key);
    return result;
  }

  Future<bool> setBool(String key, bool value) async {
    final result = await _prefs.setBool(key, value);
    if (result) _keyController.add(key);
    return result;
  }

  Future<bool> setDouble(String key, double value) async {
    final result = await _prefs.setDouble(key, value);
    if (result) _keyController.add(key);
    return result;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final result = await _prefs.setStringList(key, value);
    if (result) _keyController.add(key);
    return result;
  }

  Future<bool> remove(String key) async {
    final result = await _prefs.remove(key);
    if (result) _keyController.add(key);
    return result;
  }

  // --- Standard getters ---

  String? getString(String key) => _prefs.getString(key);
  int? getInt(String key) => _prefs.getInt(key);
  bool? getBool(String key) => _prefs.getBool(key);
  double? getDouble(String key) => _prefs.getDouble(key);
  List<String>? getStringList(String key) => _prefs.getStringList(key);
  bool containsKey(String key) => _prefs.containsKey(key);

  void dispose() {
    _keyController.close();
  }
}
