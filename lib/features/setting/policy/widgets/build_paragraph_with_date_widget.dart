// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';

import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class BuildParagraphWithDateWidget extends StatelessWidget {
  const BuildParagraphWithDateWidget({
    super.key,
    required this.headTitle,
    required this.lastUpdateDate,
    required this.bodyTitle,
  });

  final String headTitle;
  final String lastUpdateDate;
  final String bodyTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headTitle,
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            fontSize: 20,
          ),
        ),
        Text(
          "${LocaleKeys.setting_screen_policy_settings_items_last_update.tr()} $lastUpdateDate",
          style: AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
            fontSize: 14,
          ),
        ),
        verticalSpace(15),
        Text(
          bodyTitle,
          style: AppTextStyles.smallBodyTitle12w400TextStyle(context).copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
