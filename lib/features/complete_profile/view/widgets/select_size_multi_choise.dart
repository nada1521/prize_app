import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class SelectSizeMultiChoise extends StatefulWidget {
  const SelectSizeMultiChoise({super.key});

  @override
  State<SelectSizeMultiChoise> createState() => _SelectSizeMultiChoiseState();
}

class _SelectSizeMultiChoiseState extends State<SelectSizeMultiChoise> {
  String tag = '2XL';
  final List<String> sizes = ['2XL', 'XL', 'L', 'M', 'S'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.complete_profile_size.tr(),
          style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
        ),
        ChipsChoice<String>.single(
          value: tag,
          onChanged: (val) => setState(() => tag = val),
          choiceItems: C2Choice.listFrom<String, String>(
            source: sizes,
            value: (i, v) => v,
            label: (i, v) => v,
          ),
          choiceBuilder: (choice, index) {
            return GestureDetector(
              onTap: () {
                choice.select!(
                  choice.value == tag,
                );
              },
              child: Container(
                width: 60.w,
                height: 40.h,
                margin: EdgeInsetsDirectional.only(
                  end: 10.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
                alignment: Alignment.center,
                decoration: AppWidgetColor.multiSelectChoiseDecoration(
                  context,
                  choice.selected,
                ),
                child: Text(choice.label,
                    style: AppTextStyles.multiSelectChoiseDecorationTextStyle(
                        isSelectd: choice.selected, context: context)),
              ),
            );
          },
        ),
      ],
    );
  }
}
