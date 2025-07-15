import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class OrderSuccessfullyPlacedWidget extends StatelessWidget {
  const OrderSuccessfullyPlacedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
      height: 290.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.successImage,
            width: 120.w,
            height: 120.h,
          ),
          verticalSpace(8),
          FittedBox(
            child: Text(
              LocaleKeys.cart_screen_order_successfully.tr(),
              style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
                fontSize: 20,
              ),
            ),
          ),
          verticalSpace(8),
          Text(
            "${LocaleKeys.cart_screen_order_id.tr()} #82569841.",
            style: AppTextStyles.bodyTitle14w500PeriwinkleTextStyle(context)
                .copyWith(
              fontSize: 18,
            ),
          ),
          verticalSpace(24),
          AppSubmitButton(
              onTap: () {}, title: LocaleKeys.cart_screen_track_your_order.tr())
        ],
      ),
    );
  }
}
