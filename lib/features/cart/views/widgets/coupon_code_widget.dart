import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/core/widgets/app_text_form_field.dart';

class CouponCodeWidget extends StatelessWidget {
  const CouponCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppWidgetColor.fillWidgetByLightBackgroundColor(context)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppWidgetColor.outlineWidgetColor,
                  width: 1,
                ),
              ),
              child: AppTextFormField(
                hintText: LocaleKeys.cart_screen_coupon_code.tr(),
                validator: (data) {},
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
                  child: SvgPicture.asset(
                    AppSvgs.ticket,
                    width: 16.w,
                    height: 16.h,
                  ),
                ),
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            flex: 1,
            child: AppOutLineButton(
              width: 50.w,
              height: 50.h,
              onTap: () {},
              title: LocaleKeys.cart_screen_apply.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
