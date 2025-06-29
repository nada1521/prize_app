// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:prize/core/dependency_injection.dart';
// import 'package:prize/core/routing/app_router.dart';
// import 'package:prize/core/utils/extensions/navigation_extension.dart';
// import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
// import 'package:prize/core/widgets/bottom_sheet/show_simple_bottom_sheet.dart';
// import 'package:prize/core/widgets/dialog/app_dialog.dart';
// import 'package:prize/core/widgets/main/app_button.dart';
// import 'package:prize/features/auth/bloc/auth_cubit/auth_cubit.dart';
// import 'package:prize/features/auth/bloc/login_cubit/login_cubit.dart';
// import 'package:prize/features/profile/bloc/profile_cubit.dart';

// /// Common function to handle logout through the app.
// Future<void> logout() async {
//   await showActionBottomSheet(
//     title: LocaleKeys.auth_label_logout.tr(),
//     subTitle: LocaleKeys.auth_message_want_logout.tr(),
//     button: BlocProvider<LoginCubit>(
//       create: (context) => DI.di<LoginCubit>(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) async {
//           if (state.logoutStatus.isSuccess) {
//             // clear profile data
//             context.read<ProfileCubit>().clearProfile();
//             // logout from the app
//             context.read<AuthCubit>().logout();
//             // navigate to the target screen
//             context.pushNamedFinish(AppRoutes.login);
//           } else if (state.logoutStatus.isError) {
//             await AppDialog.showError(
//               title: LocaleKeys.common_errors_error_occurred.tr(),
//               description: state.logoutFailure?.message ?? '',
//               buttons: [
//                 DialogButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   title: LocaleKeys.action_ok.tr(),
//                 ),
//               ],
//             );
//           }
//         },
//         listenWhen: (p, c) => p.logoutStatus != c.logoutStatus,
//         builder: (context, state) {
//           return AppButton(
//             title: LocaleKeys.action_confirm.tr(),
//             loading: state.logoutStatus.isLoading,
//             onPressed: () {
//               context.read<LoginCubit>().logout();
//             },
//           );
//         },
//         buildWhen: (p, c) => p.logoutStatus != c.logoutStatus,
//       ),
//     ),
//   );
// }
