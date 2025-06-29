import 'package:prize/core/constant/app_urls.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text:
                " ${LocaleKeys.common_by_click_on_Sign_Up_you_agree_on_our.tr()} ",
            style: AppTextStyles.smallBodyTitle12w400TextStyle(context),
          ),
          TextSpan(
            text: LocaleKeys.common_terms_and_conditions.tr(),
            style: AppTextStyles.navigationTextUnderlineTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // Navigation To TermsAndConditionsScreen
                final Uri uri = Uri.parse(AppUrls.policyUrl);

                await launchUrl(
                  uri,
                  mode: LaunchMode.inAppBrowserView,
                  webViewConfiguration:
                      const WebViewConfiguration(enableJavaScript: true),
                );
              },
          ),
          TextSpan(
            text: ' ${LocaleKeys.common_and_the.tr()}',
            style: AppTextStyles.smallBodyTitle12w400TextStyle(context),
          ),
          TextSpan(
            text: ' ${LocaleKeys.common_privacy_policy.tr()}',
            style: AppTextStyles.navigationTextUnderlineTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // Navigation To TermsAndConditionsScreen
                final Uri uri = Uri.parse(AppUrls.policyUrl);

                await launchUrl(
                  uri,
                  mode: LaunchMode.inAppBrowserView,
                  webViewConfiguration:
                      const WebViewConfiguration(enableJavaScript: true),
                );
              },
          ),
        ],
      ),
    );
  }
}
