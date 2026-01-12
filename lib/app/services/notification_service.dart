import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
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
