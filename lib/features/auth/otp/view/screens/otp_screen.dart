import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_back_button.dart';
import 'package:prize/core/widgets/dialog/base/pop_up_dialog.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/auth/otp/view/widgets/didnot_receive_code_widget.dart';
import 'package:prize/features/auth/otp/view/widgets/otp_recover_password_successfully.dart';
import 'package:prize/features/auth/otp/view/widgets/otp_registered_successfully_widget.dart';
import 'package:prize/features/auth/signup/view/widgets/pinput_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.isRecoverPassword});

  final bool isRecoverPassword;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              Text(
                LocaleKeys.auth_otp_label.tr(),
                style: AppTextStyles.headTitle24w600TextStyle(context),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: LocaleKeys.auth_otp_we_have_sent_code_to_phone_number.tr(),
                    style: AppTextStyles.bodyTitle18w400TextStyle(context),
                  ),

                  // number or email
                  TextSpan(
                    text: ' +96631514289490',
                    style: AppTextStyles.numbersTextStyle(context),
                  ),
                ]),
              ),
              verticalSpace(24),
              FilledRoundedPinPut(),
              verticalSpace(20),
              DidnotReceiveCodeWidget(),
              verticalSpace(20),
              AppSubmitButton(
                onTap: () {
                  // Navigation To screen after validation
                  if (widget.isRecoverPassword) {
                    showPopup(context, OtpRecoverPasswordSuccessfullyWidget());
                  } else {
                    showPopup(context, OtpRegisteredSuccessfullyWidget());
                  }
                },
                title: LocaleKeys.auth_otp_verify.tr(),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
