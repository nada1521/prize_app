import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/auth/signup/view/screens/signup_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: LocaleKeys.auth_prompt_not_have_account.tr(),
            style: AppTextStyles.questionTextTextStyle(context),
          ),
          TextSpan(
            text: ' ${LocaleKeys.auth_label_sign_up.tr()}',
            style: AppTextStyles.navigationTextTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigation To LoginScreen
                pushTo(context, SignupScreen());
              },
          ),
        ],
      ),
    );
  }
}
