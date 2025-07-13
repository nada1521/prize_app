import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_normal_paragraph_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_bullet_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_date_widget.dart';

class WarrantyPolicyScreen extends StatelessWidget {
  const WarrantyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> informationWeCollect = [
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_title_informatiom
            .tr(),
        "description": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_desc_personal_information
            .tr(),
      },
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_usage_data
            .tr(),
        "description": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_desc_usage_data
            .tr(),
      },
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_device_information
            .tr(),
        "description": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_desc_device_information
            .tr(),
      },
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_cookies_and_technologies
            .tr(),
        "description": LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_information_we_collect_desc_cookies_and_technologies
            .tr(),
      },
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys
            .setting_screen_policy_settings_items_warranty_policy_warranty_policy
            .tr(),
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        children: [
          verticalSpace(25),
          BuildParagraphWithDateWidget(
              headTitle: LocaleKeys
                  .setting_screen_policy_settings_items_warranty_policy_warranty_policy
                  .tr(),
              lastUpdateDate: "22 Mar 2025",
              bodyTitle: LocaleKeys
                  .setting_screen_policy_settings_items_warranty_policy_body_title_warranty_policy
                  .tr()),
          verticalSpace(25),
          BuildParagraphWithBulletWidget(
            index: 1,
            paragraphTitle: LocaleKeys
                .setting_screen_policy_settings_items_warranty_policy_information_we_collect_title_informatiom
                .tr(),
            paragraphData: informationWeCollect,
            hintText: LocaleKeys
                .setting_screen_policy_settings_items_warranty_policy_hint_text
                .tr(),
          ),
          verticalSpace(25),
          BuildNormalParagraphWidget(
            index: 2,
            headTitle: LocaleKeys
                .setting_screen_policy_settings_items_warranty_policy_how_We_use_your_information
                .tr(),
            bodyTitle: LocaleKeys
                .setting_screen_policy_settings_items_warranty_policy_body_title_how_are_information
                .tr(),
          )
        ],
      ),
    );
  }
}
