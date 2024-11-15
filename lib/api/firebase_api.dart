import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../firebase_options.dart';
import 'dart:developer';

class FirebaseApi {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin = 
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Konfigurasi notifikasi lokal
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _localNotificationsPlugin.initialize(initializationSettings);

    // Mendapatkan dan mencetak token FCM, untuk testing (opsional)
    final fcmToken = await FirebaseMessaging.instance.getToken();
    log("FCMToken: $fcmToken");

    // Handler untuk pesan saat aplikasi berada di foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Pesan diterima saat aplikasi foreground: ${message.notification?.title}");
      _showNotification(message.notification?.title, message.notification?.body);
    });
  }

  static Future<void> _showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', // ID saluran notifikasi
      'your_channel_name', // Nama saluran notifikasi
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _localNotificationsPlugin.show(
      0, // ID notifikasi
      title,
      body,
      platformChannelSpecifics,
    );
  }
}