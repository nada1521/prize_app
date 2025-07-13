import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_normal_paragraph_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_bullet_widget.dart';
import 'package:prize/features/setting/policy/widgets/build_paragraph_with_date_widget.dart';

class ReturnAndExchangeScreen extends StatelessWidget {
  const ReturnAndExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> useOfTheService = [
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_return_and_exchange_use_of_the_service_title_one
            .tr(),
        "description": "",
      },
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_return_and_exchange_use_of_the_service_title_tow
            .tr(),
        "description": "",
      },
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_return_and_exchange_use_of_the_service_title_three
            .tr(),
        "description": "",
      },
      {
        "title": LocaleKeys
            .setting_screen_policy_settings_items_return_and_exchange_use_of_the_service_title_four
            .tr(),
        "description": "",
      },
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys
            .setting_screen_policy_settings_items_return_and_exchange_return_and_exchange
            .tr(),
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        children: [
          verticalSpace(25),
          BuildParagraphWithDateWidget(
              headTitle: LocaleKeys
                  .setting_screen_policy_settings_items_return_and_exchange_return_and_exchange
                  .tr(),
              lastUpdateDate: "22 Mar 2025",
              bodyTitle: LocaleKeys
                  .setting_screen_policy_settings_items_terms_and_condition_body_title_terms_and_condition
                  .tr()),
          verticalSpace(25),
          BuildNormalParagraphWidget(
              index: 1,
              headTitle: LocaleKeys
                  .setting_screen_policy_settings_items_terms_and_condition_acceptance_of_terms
                  .tr(),
              bodyTitle: LocaleKeys
                  .setting_screen_policy_settings_items_terms_and_condition_body_title_acceptance_of_terms
                  .tr()),
          verticalSpace(25),
          BuildParagraphWithBulletWidget(
            index: 2,
            paragraphTitle: LocaleKeys
                .setting_screen_policy_settings_items_terms_and_condition_use_of_the_service
                .tr(),
            paragraphData: useOfTheService,
            hintText: LocaleKeys
                .setting_screen_policy_settings_items_return_and_exchange_you_agree_to
                .tr(),
          ),
          verticalSpace(25),
          BuildNormalParagraphWidget(
              index: 1,
              headTitle: LocaleKeys
                  .setting_screen_policy_settings_items_terms_and_condition_intellectual_property
                  .tr(),
              bodyTitle: LocaleKeys
                  .setting_screen_policy_settings_items_terms_and_condition_body_title_intellectual_property
                  .tr()),
        ],
      ),
    );
  }
}
