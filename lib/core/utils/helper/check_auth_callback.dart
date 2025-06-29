// import 'package:prize/core/utils/helper/navigation/navigation_manager.dart';
// import 'package:prize/features/auth/bloc/auth_cubit/auth_cubit.dart';
// import 'package:prize/features/auth/view/screens/login_screen.dart';
// import 'package:prize/core/utils/helper/navigation/push_to.dart';
// import 'package:prize/core/widgets/bottom_sheet/show_simple_bottom_sheet.dart';
// import 'package:prize/core/widgets/main/app_button.dart';
// import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// Future<void> checkAuthCallback(void Function() callback) async {
//   final context = NavigatorManager.navigatorKey.currentContext!;
//   if (context.read<AuthCubit>().state.isAuthenticated) {
//     callback.call();
//   } else {
//     await showActionBottomSheet(
//       title: LocaleKeys.auth_message_not_logged_in.tr(),
//       subTitle: LocaleKeys.auth_message_login_first_to_continue.tr(),
//       button: AppButton(
//         onPressed: () async {
//           Navigator.pop(context);
//           pushTo(NavigatorManager.navigatorKey.currentContext!, const LoginScreen());
//         },
//         title: LocaleKeys.auth_label_login.tr(),
//       ),
//     );
//   }
// }
