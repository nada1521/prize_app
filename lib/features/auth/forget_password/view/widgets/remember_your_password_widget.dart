import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';
import 'package:prize/features/auth/login/view/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RememberYourPasswordWidget extends StatelessWidget {
  const RememberYourPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: LocaleKeys.auth_forget_password_remember_your_password.tr(),
              style: Theme.of(context)
                  .textTheme
                  .font14RegularDarkPeriwinkle(context),
            ),
            TextSpan(
              text: ' ${LocaleKeys.auth_label_login.tr()}',
              style: Theme.of(context).textTheme.font14RegularOrange(context),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigation To LoginScreen
                  AppNavigator.pushSlideX(context, LoginScreen());
                },
            ),
          ],
        ),
      ),
    );
  }
}
