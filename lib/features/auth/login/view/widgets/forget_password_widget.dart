import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/bottom_sheet/select_otp_method.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            showSelectOtpMethodBottomSheet(context);
          },
          child: Text(
            LocaleKeys.auth_prompt_forgot_password.tr(),
            style: AppTextStyles.navigationTextTextStyle,
          ),
        ),
      ],
    );
  }
}
