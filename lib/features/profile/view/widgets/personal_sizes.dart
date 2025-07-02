import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class PersonalSizes extends StatelessWidget {
  PersonalSizes({super.key});

  final List<String> sizes = [
    "${LocaleKeys.profile_screen_personal_size_shoes_size.tr()} 30",
    "${LocaleKeys.profile_screen_personal_size_pants_size.tr()} 40",
    "${LocaleKeys.profile_screen_personal_size_favourite_color.tr()} blue",
    "${LocaleKeys.profile_screen_personal_size_t_shirt_size.tr()} XL",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 5.h,
      children: sizes.map((text) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppWidgetColor.fillWidgetByLightBackgroundColor(context)
                .withOpacity(.25),
            borderRadius: BorderRadius.circular(12.r),
            border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
