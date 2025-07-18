import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/generated/locale_keys.g.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.h,
      ),
      decoration: BoxDecoration(
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.OrderDetails_delivery_address.tr(),
            style: AppTextStyles.meduimBody16W500BlackAndWhiteTitleTextStyle(
                context),
          ),
          verticalSpace(14),
          Text(LocaleKeys.core_home.tr()),
          verticalSpace(8),
          Row(
            children: [
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: SvgPicture.asset(
                  AppSvgs.userAvatar,
                  fit: BoxFit.cover,
                  color: AppColors.moreLighterDarkPeriwinkle,
                ),
              ),
              horizontalSpace(10),
              Text("Ahmed Mohamed"),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              SvgPicture.asset(
                AppSvgs.outlineLocation,
                color: AppColors.moreLighterDarkPeriwinkle,
              ),
              horizontalSpace(10),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 250.w,
                ),
                child: Text(
                  "123 Avenue de l'Indépendance Nouakchott, Mauritania",
                  style:
                      AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(context)
                          .copyWith(
                    fontSize: 14,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              SvgPicture.asset(AppSvgs.callCallingOutline),
              horizontalSpace(10),
              Text("+222 3334444"),
            ],
          )
        ],
      ),
    );
  }
}
