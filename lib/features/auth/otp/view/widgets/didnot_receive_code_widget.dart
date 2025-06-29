import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DidnotReceiveCodeWidget extends StatefulWidget {
  const DidnotReceiveCodeWidget({super.key});

  @override
  State<DidnotReceiveCodeWidget> createState() =>
      _DidnotReceiveCodeWidgetState();
}

class _DidnotReceiveCodeWidgetState extends State<DidnotReceiveCodeWidget> {
  @override
  Widget build(BuildContext context) {
    final double time = 00.00;
    return Row(
      children: [
        Text('00:00', style: AppTextStyles.numbersTextStyle(context)),
        Spacer(),
        RichText(
          text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
            TextSpan(
              text: LocaleKeys.auth_otp_did_not_receive_code.tr(),
              style: AppTextStyles.questionTextTextStyle(context),
            ),
            TextSpan(
              text: ' ${LocaleKeys.auth_otp_resend_again.tr()}',
              style: time == 0.00
                  ? AppTextStyles.navigationTextUnderlineTextStyle.copyWith(
                      fontSize: 14,
                    )
                  : AppTextStyles.deActiveNavigationUnderlineTextTextStyle(
                      context),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ]),
        ),
      ],
    );
  }
}
