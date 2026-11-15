import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:uniceps/app/services/app_configs_service.dart';

class NotificationService {
  NotificationService({required AppConfigsService configsService}) : _configsService = configsService;

  final AppConfigsService _configsService;
  var _uniqueNotificationCounter = 999;

  Future<void> handleForegroundNotification(RemoteMessage message) async {
    // final locale = await AppLocalizations.delegate.load(_configsService.configs.appLanguage);
    showNotification(
      id: ++_uniqueNotificationCounter,
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      onlyAlertOnce: false,
    );
  }

  // static final Map<String, String Function(AppLocalizations)> _map = {
  //   'orderShipped': (l) => l.exercises,
  //   'anotherKey': (l) => l.skip,
  // };

  // String translateKey(String key, AppLocalizations localizations) {
  //   // Usage (Single line):
  //   return _map[key]?.call(localizations) ?? key;
  // }

  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidInit = AndroidInitializationSettings('ic_stat');

    const InitializationSettings initSettings = InitializationSettings(android: androidInit);

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    bool onlyAlertOnce = false,
    bool ongoing = false,
    bool autoCancel = true,
    bool usesChronometer = false,
    String? payload,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      styleInformation: BigTextStyleInformation(body),
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: onlyAlertOnce,
      ongoing: ongoing, // 👈 makes it non-dismissible
      autoCancel: autoCancel, // 👈 prevents swipe dismissal
      usesChronometer: usesChronometer,
    );

    await _notificationsPlugin.show(id, title, body, NotificationDetails(android: androidDetails), payload: payload);
  }

  static Future<void> close(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  static Future<void> closeAll() async {
    await _notificationsPlugin.cancelAll();
  }
}
