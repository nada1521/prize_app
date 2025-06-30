import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class DaysLeftWidget extends StatelessWidget {
  const DaysLeftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 38.h,
      decoration: BoxDecoration(
        color: AppColors.errorRed.withOpacity(.2),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 5.w, start: 5.w),
            child: SvgPicture.asset(
              AppSvgs.clock,
              width: 14.w,
              height: 14.h,
            ),
          ),
          FittedBox(
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 5.w, start: 5.w),
              child: Text(LocaleKeys.home_upcomming_events_events_title_7_days.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
