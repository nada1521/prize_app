import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_normal_paragraph_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_bullet_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_date_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> informationWeCollect = [
      {
        "title": LocaleKeys
            .setting_screen_privacy_policy_title_personal_information
            .tr(),
        "description": LocaleKeys
            .setting_screen_privacy_policy_description_personal_information
            .tr(),
      },
      {
        "title": LocaleKeys.setting_screen_privacy_policy_title_usage_data.tr(),
        "description": LocaleKeys
            .setting_screen_privacy_policy_description_usage_data
            .tr(),
      },
      {
        "title": LocaleKeys
            .setting_screen_privacy_policy_title_device_information
            .tr(),
        "description": LocaleKeys
            .setting_screen_privacy_policy_description_device_information
            .tr(),
      },
      {
        "title": LocaleKeys.setting_screen_privacy_policy_title_cookies.tr(),
        "description":
            LocaleKeys.setting_screen_privacy_policy_description_cookies.tr(),
      },
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.setting_screen_privacy_policy_privacy_policy.tr(),
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        children: [
          verticalSpace(25),
          BuildParagraphWithDateWidget(
            headTitle:
                LocaleKeys.setting_screen_privacy_policy_privacy_policy.tr(),
            lastUpdateDate:
                LocaleKeys.setting_screen_privacy_policy_last_update_date.tr(),
            bodyTitle: LocaleKeys
                .setting_screen_privacy_policy_privacy_body_titel
                .tr(),
          ),
          verticalSpace(25),
          BuildParagraphWithBulletWidget(
            index: 1,
            paragraphTitle: LocaleKeys
                .setting_screen_privacy_policy_information_we_collect
                .tr(),
            paragraphData: informationWeCollect,
          ),
          verticalSpace(25),
          BuildNormalParagraphWidget(
            index: 2,
            headTitle: LocaleKeys
                .setting_screen_privacy_policy_how_we_use_your_information
                .tr(),
            bodyTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
          )
        ],
      ),
    );
  }
}
