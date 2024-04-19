import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quran_app/constants/api_keys.dart';
import 'package:quran_app/helpers/rtdb_helper.dart';

class FCMHelper {
  static late FirebaseMessaging _messaging;
  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static late AndroidNotificationChannel _androidNotificationChannel;
  static void init() async {
    _messaging = FirebaseMessaging.instance;
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      ),
    );
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidNotificationChannel);
  }

  static void requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  static Future<void> handleForegroundMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        _flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
                android: AndroidNotificationDetails(
              "channel id",
              "channel name",
              channelDescription: "channel description",
              importance: Importance.max,
              priority: Priority.high,
            )));
        print("Notification received");
        RTDBHelper.writeNotification(notification);
        print("Notification written to RTDB successfully");
      }
    });
  }

  Future<void> saveTokenToDatabase(String token) async {
    // Assume user is logged in for this example
    String userId = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'tokens': FieldValue.arrayUnion([token]),
    });
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      debugPrint("Message handled");
      // Navigator.pushNamed(context, '/chat',
      //   arguments: ChatArguments(message),
      // );
    }
  }

  static Future<String?> getFCMToken() async {
    return _messaging.getToken(
      vapidKey: webPushCertificate,
    );
  }

  static void subscribeToTopic({required String topic}) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  static void unsubscribeFromTopic({required String topic}) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }
}
