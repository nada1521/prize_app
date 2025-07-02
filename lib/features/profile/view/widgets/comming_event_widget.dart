import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/view/widgets/other_events/days_left_widget.dart';

class CommingEventWidget extends StatelessWidget {
  const CommingEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppWidgetColor.fillBackgroundColor(context),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppSvgs.calendarProfileCommingEvent),
          horizontalSpace(10),
          Text(
            LocaleKeys.profile_screen_birthday.tr(),
            style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          DaysLeftWidget(),
        ],
      ),
    );
  }
}
