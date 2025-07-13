import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Order summary",
                style: AppTextStyles.headTitle14w500WhiteAndDarkBlueTextStyle(
                        context)
                    .copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              horizontalSpace(10),
              Text(
                "(2 items)",
                style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                    .copyWith(
                  color: AppColors.periwinkle,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "subtotal:",
                style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                    .copyWith(
                  color: AppColors.periwinkle,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    AppSvgs.currency,
                    width: 20.w,
                    height: 20.h,
                    color: AppColors.darkModeBackground,
                  ),
                  horizontalSpace(8),
                  Text(
                    "644",
                    style: AppTextStyles
                            .meduimBody16W500BlackAndWhiteTitleTextStyle(
                                context)
                        .copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
          verticalSpace(5),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    "Total:",
                    style: AppTextStyles
                            .meduimBody16W500BlackAndWhiteTitleTextStyle(
                                context)
                        .copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  horizontalSpace(8),
                  Text(
                    "(inclusive of VAT)",
                    style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                        .copyWith(
                      color: AppColors.periwinkle,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    AppSvgs.currency,
                    width: 20.w,
                    height: 20.h,
                  ),
                  horizontalSpace(8),
                  Text(
                    "644",
                    style: AppTextStyles
                            .meduimBody16W500BlackAndWhiteTitleTextStyle(
                                context)
                        .copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
