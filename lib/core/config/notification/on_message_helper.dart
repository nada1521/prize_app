// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:prize/core/utils/constants.dart';
// import 'package:prize/features/notification/bloc/notification_cubit.dart';
//
// import 'on_message_actions/user_states.dart';
//
// abstract class OnMessageHelper {
//   /// This method is Executed when the user tap on one of these messages:
//   /// - local notification
//   /// - initial message (at Startup)
//   /// - onMessageOpenedApp
//   ///
//   /// #### This function is responsible for getting data when user taps on a notification.
//   static void onMessageClicked(
//     Map<String, dynamic>? data, {
//     NotificationType? notificationType,
//     bool clicked = true,
//   }) async {
//     try {
//       if (data?.isNotEmpty == true) {
//         final type = notificationType ?? checkTypeFromNotification(data);
//         debugPrint("🔔 onMessageClicked: $data | type: $type");
//
//         switch (type) {
//           case NotificationType.doctorAppointmentStarted:
//             onDoctorAppointmentStarted(data, clicked: clicked);
//           case NotificationType.doctorAppointmentFinished:
//             onDoctorAppointmentFinished(data, clicked: clicked);
//           case NotificationType.doctorAppointmentApproved:
//           case NotificationType.doctorAppointmentRejected:
//           case NotificationType.labAppointmentApproved:
//           case NotificationType.labAppointmentRejected:
//           case NotificationType.labAppointmentStarted:
//           case NotificationType.rayAppointmentApproved:
//           case NotificationType.rayAppointmentRejected:
//           case NotificationType.rayAppointmentStarted:
//           case NotificationType.medicalHistoryUpdate:
//           case NotificationType.healthStatusUpdate:
//           case NotificationType.ambulanceState:
//           case NotificationType.insuranceUpdate:
//           case NotificationType.news:
//           case NotificationType.family:
//           case NotificationType.walletPaymentApproved:
//           case NotificationType.walletPaymentRejected:
//           case NotificationType.newInvoice:
//           case NotificationType.invoiceStatus:
//           case NotificationType.paymentApproved:
//           case NotificationType.paymentRejected:
//           case NotificationType.general:
//             _getRemoteNotifications();
//           // Do nothing
//         }
//       }
//     } catch (_) {
//       if (kDebugMode) rethrow;
//     }
//   }
//
//   /// This method is Executed when the user received a notification
//   /// and the app is **opened** or **terminated**:
//   /// - onMessage
//   /// - onBackgroundMessage
//   ///
//   /// #### This function is responsible for getting data when a notification is received.
//   static void onMessageReceived(Map<String, dynamic>? data) async {
//     debugPrint('- onMessageReceived - data: $data');
//     _getRemoteNotifications();
//     onMessageClicked(data, clicked: false);
//   }
//
//   static void _getRemoteNotifications() {
//     try {
//       getContext().read<NotificationCubit>().getNotifications(ifNotExists: false);
//     } catch (_) {}
//   }
//
//   static NotificationType checkTypeFromNotification(
//     Map<String, dynamic>? data, {
//     String? notifBody,
//   }) {
//     NotificationType? type;
//     try {
//       final typeData = data?['type'];
//       debugPrint('type data: $typeData');
//       debugPrint('data runtime type: ${typeData.runtimeType}');
//       final body = notifBody ?? data?['body'] ?? data?['description'];
//       if (typeData != null) {
//         type = NotificationType.fromString(typeData);
//       } else if (body?.contains("doctor") == true || body?.contains("ready") == true) {
//         return NotificationType.doctorAppointmentStarted;
//       } else if (body?.contains("doctor") == true || body?.contains("completed") == true) {
//         return NotificationType.doctorAppointmentFinished;
//       }
//     } catch (_) {}
//
//     return type ?? NotificationType.general;
//   }
// }
