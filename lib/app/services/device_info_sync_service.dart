import 'package:device_info_plus/device_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/sources/services/internet_client/client_helper.dart';
import 'package:uniceps/core/constants/constants.dart';

class DeviceInfoSyncService {
  static const syncFlag = '_syncFlag';
  final SharedPreferences _preferences;
  final InternetConnectionChecker _checker;
  final ClientHelper _client;
  final Logger _logger;

  const DeviceInfoSyncService({
    required SharedPreferences preferences,
    required InternetConnectionChecker checker,
    required ClientHelper client,
    required Logger logger,
  }) : _preferences = preferences,
       _checker = checker,
       _client = client,
       _logger = logger;

  Future<void> checkStatusThenSync() async {
    final lastSync = _preferences.getString(syncFlag);
    if (lastSync != null && lastSync == APP_VERSION) {
      return;
    }

    final platform = 'Android';
    final androidInfo = await DeviceInfoPlugin().androidInfo;

    // ----------------
    // Retry Mechanism
    int maxAttempts = 5;
    int attempt = 1;
    int delay = 0;
    while (!await _checker.hasConnection) {
      if (attempt >= maxAttempts) return;
      _logger.t('no internet retrying attempt: $attempt');
      delay += attempt * 2;
      await Future.delayed(Duration(seconds: delay));
      attempt++;
    }
    // ----------------

    try {
      _logger.i('Syncing device info');
      await _client.postHandler(API_V2, HTTP_DEVICE_INFO, {
        "deviceToken": androidInfo.device,
        "deviceId": androidInfo.id,
        "platform": platform,
        "appVersion": APP_VERSION,
        "deviceModel": androidInfo.model,
        "osVersion": "${androidInfo.version.sdkInt}",
      });
      await _preferences.setString(syncFlag, APP_VERSION);
      _logger.t('Sync device Done!');
    } catch (e) {
      _logger.e('Error while syncing device info!', error: e);
      return;
    }
  }
}
