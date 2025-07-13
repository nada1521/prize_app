import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/help_center/view/widgets/chat_with_us_widget.dart';
import 'package:prize/features/setting/help_center/view/widgets/expanded_widget.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys
            .setting_screen_info_settings_items_customer_support_help_center
            .tr(),
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        shrinkWrap: true,
        children: [
          ChatWithUsWidget(),
          verticalSpace(10),
          ExpandedWidget(),
        ],
      ),
    );
  }
}
