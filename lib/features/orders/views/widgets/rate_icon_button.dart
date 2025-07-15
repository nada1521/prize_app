import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class RateIconButton extends StatelessWidget {
  const RateIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColors.darkModeTanOrange.withOpacity(.15),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                SvgPicture.asset(AppSvgs.rateStar),
                horizontalSpace(5),
                Text(
                  LocaleKeys.my_order_screen_rate.tr(),
                  style:
                      AppTextStyles.appEmptyFillColorButtonTextStyle(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
