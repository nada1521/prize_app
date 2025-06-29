// import 'package:prize/core/dependency_injection.dart';
// import 'package:prize/core/utils/helper/navigation/push_and_finish.dart';
// import 'package:prize/core/utils/resources/app_colors.dart';
// import 'package:prize/core/utils/resources/app_size.dart';
// import 'package:prize/core/widgets/dialog/app_dialog.dart';
// import 'package:prize/core/widgets/main/app_button.dart';
// import 'package:prize/core/widgets/main/snk_bar.dart';
// // import 'package:prize/features/auth/bloc/auth_cubit/auth_cubit.dart';
// // import 'package:prize/features/auth/bloc/login_cubit/login_cubit.dart';
// // import 'package:prize/features/auth/view/screens/login_screen.dart';
// import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:prize/features/splash/bloc/settings_cubit.dart';

// import 'customs/html_viewer_widget.dart';

// class TermsAndConditionViewPage extends StatelessWidget {
//   const TermsAndConditionViewPage({
//     super.key,
//     this.deleteAccount = false,
//   });

//   final bool deleteAccount;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: HtmlViewerWidget(
//                 title: LocaleKeys.common_terms_and_conditions.tr(),
//                 html: getSettings().termsAndConditions,
//               ),
//             ),
//             // button
//             if (deleteAccount) ...[
//               const Divider(),
//               // BlocProvider<LoginCubit>(
//               //   create: (context) => DI.di<LoginCubit>(),
//               //   child: Padding(
//               //     padding: const EdgeInsets.symmetric(
//               //       vertical: AppSize.padding5,
//               //       horizontal: AppSize.padding12,
//               //     ),
//               //     child: Row(
//               //       children: [
//               //         const Icon(Icons.check, color: AppColors.greenColor),
//               //         const SizedBox(width: AppSize.padding16),
//               //         Expanded(
//               //             child: Text(LocaleKeys
//               //                 .auth_delete_account_flow_accept_terms_to_delete_account
//               //                 .tr())),
//               //         const SizedBox(width: AppSize.padding12),
//                       // BlocConsumer<LoginCubit, LoginState>(
//                       //   listener: _listener,
//                       //   listenWhen: (p, c) =>
//                       //       p.deleteAccountStatus != c.deleteAccountStatus,
//                       //   builder: (context, state) {
//                       //     return AppButton(
//                       //       title: LocaleKeys.action_delete.tr(),
//                       //       fit: false,
//                       //       horizontalContentPadding: AppSize.padding16 + 2,
//                       //       loading: state.deleteAccountStatus.isLoading,
//                       //       onPressed: () async {
//                       //         await _onSubmit(context);
//                       //       },
//                       //     );
//                       //   },
//                       //   buildWhen: (p, c) =>
//                       //       p.deleteAccountStatus != c.deleteAccountStatus,
//                       // ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _onSubmit(BuildContext context) async {
//     // todo: implement delete account
//     SnkBar.showToastNotImplemented();
//     // context.read<LoginBloc>().add(DeleteAccountEvent());
//   }

//   void _listener(BuildContext context, LoginState state) async {
//     if (state.deleteAccountStatus.isSuccess) {
//       SnkBar.showSuccess(
//         LocaleKeys.common_message_done_successfully.tr(),
//         icon:
//             const Icon(Icons.person_off_rounded, color: AppColors.successColor),
//       );

//       context.read<AuthCubit>().logout();
//       pushAndFinish(context, const LoginScreen());
//     } else if (state.deleteAccountStatus.isError) {
//       await AppDialog.showWarning(
//         description: state.deleteAccountFailure?.message,
//         buttons: [
//           DialogButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             title: LocaleKeys.action_ok.tr(),
//           ),
//         ],
//       );
//     }
//   }
// }
