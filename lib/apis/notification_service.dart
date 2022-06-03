import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static int idNotification = 0;

  //Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestIOSPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> init() async {
    //Initialization Settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    //Initialization Settings for iOS
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'channel ID',
    'channel name',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  static const IOSNotificationDetails _iosNotificationDetails =
      IOSNotificationDetails(
          // presentAlert: bool?,
          // presentBadge: bool?,
          // presentSound: bool?,
          // badgeNumber: int?
          // attachments: List<IOSNotificationAttachment>?
          // subtitle: String?,
          //     threadIdentifier: String?
          );

  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(
          android: _androidNotificationDetails, iOS: _iosNotificationDetails);

  Future<void> showNotification({String? payload}) async {
    await flutterLocalNotificationsPlugin.show(
      idNotification,
      'Hello!',
      'This is a test notification',
      platformChannelSpecifics,
      payload: payload,
    );
    idNotification++;
  }

  Future<void> scheduleNotification(
      id, tz.TZDateTime dateTime, String title, String body) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      dateTime,
      platformChannelSpecifics,
      payload: 'scheduled payload',
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelNotifications() async {
    // await flutterLocalNotificationsPlugin.cancel(NOTIFICATION_ID);
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
