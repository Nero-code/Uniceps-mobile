import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(android: androidInit);

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
      ongoing: true, // 👈 makes it non-dismissible
      autoCancel: false, // 👈 prevents swipe dismissal
    );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(android: androidDetails),
      payload: payload,
    );
  }

  static Future<void> closeAll() async {
    await _notificationsPlugin.cancelAll();
  }
}
