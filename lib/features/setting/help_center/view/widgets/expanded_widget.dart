import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({super.key});

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  final List<Map<String, String>> faqItems = [
    {
      'question':LocaleKeys.setting_screen_info_settings_items_customer_support_question_one.tr(),
      'answer':
    LocaleKeys.setting_screen_info_settings_items_customer_support_answer_q_one.tr()  },
    {
      'question': LocaleKeys
          .setting_screen_info_settings_items_customer_support_question_tow
          .tr(),
      'answer':
         LocaleKeys.setting_screen_info_settings_items_customer_support_answer_q_tow.tr()   },
    {
      'question': LocaleKeys
          .setting_screen_info_settings_items_customer_support_question_three
          .tr(),
      'answer': LocaleKeys
          .setting_screen_info_settings_items_customer_support_answer_q_three
          .tr()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: faqItems.map((item) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
          child: ExpansionTile(
            title: Text(
              item['question']!,
              style: AppTextStyles.bodyTitle18w400TextStyle(context).copyWith(
                fontSize: 16,
              ),
            ),
            trailing: SvgPicture.asset(
              AppSvgs.arrowDown,
              color: AppWidgetColor.fillWithGrayAndDiColor(context),
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 5.w, vertical: 5.h),
                child: Text(item['answer']!,
                    style: AppTextStyles
                        .smallBodyTitle12w400WithContrastColorTextStyle(
                            context)),
              ),
            ],
            onExpansionChanged: (bool expanded) {},
          ),
        );
      }).toList(),
    );
  }
}
