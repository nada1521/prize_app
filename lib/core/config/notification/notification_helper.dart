// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:prize/core/utils/resources/app_colors.dart';
//
// import 'on_message_helper.dart';
//
// @pragma("vm:entry-point")
// abstract class NotificationHelper {
//   static final flutterLocalNotifications = FlutterLocalNotificationsPlugin();
//
//   /// initialize local notifications
//   static Future<void> initLocal() async {
//     try {
//       const androidIcon = 'ic_splash';
//       const androidSettings = AndroidInitializationSettings(androidIcon);
//       const iosSettings = DarwinInitializationSettings(
//         requestSoundPermission: true,
//         requestBadgePermission: true,
//         requestAlertPermission: true,
//       );
//       const initializationSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);
//       flutterLocalNotifications
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.requestNotificationsPermission();
//       await flutterLocalNotifications.initialize(
//         initializationSettings,
//         onDidReceiveNotificationResponse: _onClickLocalNotification,
//       );
//     } catch (e) {
//       debugPrint("> error occurred when init local notification: $e");
//       if (kDebugMode) rethrow;
//     }
//   }
//
//   /// initialize fcm
//   static Future<void> initFcmAndPermission() async {
//     try {
//       await _requestPermission();
//       final token = await FirebaseMessaging.instance.getToken();
//       debugPrint("> fcm: $token");
//     } catch (_) {}
//   }
//
//   static Future<AuthorizationStatus> _requestPermission() async {
//     final settings = await FirebaseMessaging.instance.requestPermission(
//       sound: true,
//       badge: true,
//       alert: true,
//       criticalAlert: true,
//       announcement: true,
//       carPlay: false,
//       // provisional: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//     } else {}
//     return settings.authorizationStatus;
//   }
//
//   static void initRemoteOnMessages() {
//     FirebaseMessaging.onMessage.listen(_onMessage);
//
//     FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
//
//     FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
//   }
//
//   /// This method is invoked when a user clicks on a notification
//   /// while the app is already **open** and running in the foreground.
//   static void _onMessageOpenedApp(RemoteMessage message) {
//     final type = OnMessageHelper.checkTypeFromNotification(message.data, notifBody: message.notification?.body);
//     debugPrint("🔔 onMessageOpenedApp: ${message.notification?.title} | ${message.data} | type: $type");
//     OnMessageHelper.onMessageClicked(message.data, notificationType: type);
//   }
//
//   /// Executed when app is opened
//   ///
//   /// Opens local notification with current payload
//   static void _onMessage(RemoteMessage message) {
//     debugPrint("🔔 onMessage: ${message.notification?.title} | ${message.data}");
//     OnMessageHelper.onMessageReceived(message.data);
//
//     // show message
//     final notification = message.notification;
//     if (notification?.title != null) {
//       NotificationHelper.showLocalNotification(
//         notification!.title!,
//         notification.body ?? '',
//         payload: jsonEncode(message.data),
//       );
//     }
//   }
//
//   static Future<void> _onClickLocalNotification(NotificationResponse response) async {
//     if (response.payload != null) {
//       final data = jsonDecode(response.payload!);
//       OnMessageHelper.onMessageClicked(data);
//     }
//   }
//
//   /// Executed when app is terminated or killed
//   @pragma('vm:entry-point')
//   static Future<dynamic> _onBackgroundMessage(RemoteMessage message) async {
//     debugPrint("🔔 onBackground: ${message.notification?.title} | ${message.data}");
//     OnMessageHelper.onMessageReceived(message.data);
//
//     // if (message.data['title_ar'] != null && message.data['description_ar'] != null) {
//     //   NotificationHelper.showLocalNotification(
//     //     navigatorKey.currentContext?.isArabic != false ? message.data['title_ar'] : message.data['title_en'],
//     //     navigatorKey.currentContext?.isArabic != false ? message.data['description_ar'] : message.data['description_en'],
//     //     payload: jsonEncode(message.data),
//     //   );
//     // }
//   }
//
//   /// Show local notification
//   static Future<void> showLocalNotification(
//     String title,
//     String body, {
//     String? payload,
//   }) async {
//     const androidDetails = AndroidNotificationDetails(
//       'main',
//       'al-rahma_main_channel',
//       playSound: true,
//       importance: Importance.max,
//       priority: Priority.max,
//       color: AppColor.primary,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);
//
//     return await flutterLocalNotifications.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }
// }
