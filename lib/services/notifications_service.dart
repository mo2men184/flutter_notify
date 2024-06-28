import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class NotificationsService extends GetxService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final RxBool isFCM = true.obs;

  Future<void> initialize() async {
    await _initializeLocalNotifications();
    await _initializeFCM();
    await _initializeOneSignal();
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _initializeFCM() async {
    await _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (isFCM.value) {
        _handleMessage(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (isFCM.value) {
        _handleMessage(message);
      }
    });
  }

  Future<void> _initializeOneSignal() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    OneSignal.initialize("YOUR_ONESIGNAL_APP_ID");

    OneSignal.User.pushSubscription.addObserver((state) {
      print(OneSignal.User.pushSubscription.optedIn);
      print(OneSignal.User.pushSubscription.id);
      print(OneSignal.User.pushSubscription.token);
      print(state.current.jsonRepresentation());
    });

    OneSignal.Notifications.addClickListener((event) {
      if (!isFCM.value) {
        _handleOneSignalMessage(event.notification);
      }
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      if (!isFCM.value) {
        event.preventDefault();
        event.notification.display();
        _handleOneSignalMessage(event.notification);
      }
    });
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    // Handle FCM message
    RemoteNotification? notification = message.notification;
    if (notification != null) {
      _showNotification(notification.title ?? '', notification.body ?? '');
    }
  }

  Future<void> _handleOneSignalMessage(OSNotification notification) async {
    // Handle OneSignal message
    _showNotification(notification.title ?? '', notification.body ?? '');
  }

  Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'default_channel',
      'Default',
      channelDescription: 'Default channel for notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  void switchProvider(bool useFCM) {
    isFCM.value = useFCM;
  }
}
