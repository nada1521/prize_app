// import 'package:firebase_messaging/firebase_messaging.dart' show FirebaseMessaging;
//
// import 'on_message_helper.dart' show OnMessageHelper;
//
// abstract class NotificationReceiverChecker {
//   static final Set<NotificationReceiverPlace> _places = {};
//
//   static Future<void> checkInitialMessage({
//     required NotificationReceiverPlace place,
//     void Function(Map<String, dynamic> data)? callback,
//   }) async {
//     if (_places.contains(place)) {
//       return;
//     }
//     final remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (remoteMessage != null) {
//       _places.add(place);
//       if (callback != null) {
//         callback(remoteMessage.data);
//       } else {
//         OnMessageHelper.onMessageClicked(remoteMessage.data, clicked: false);
//       }
//     }
//   }
// }
//
// enum NotificationReceiverPlace {
//   home,
// }
