import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/wishlist/view/screens/sport_wishlsit_add_items.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class EmptyShoppingCartWidget extends StatelessWidget {
  const EmptyShoppingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 60.h),
      decoration: BoxDecoration(
        color: AppWidgetColor.fillBackgroundColor(context),
      ),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 100.w, maxHeight: 100.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppWidgetColor.fillWidgetColor(context),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SvgPicture.asset(
                AppSvgs.emptyCart,
              ),
            ),
          ),
          verticalSpace(15),
          Text(
            LocaleKeys.cart_screen_shopping_cart.tr(),
            style: AppTextStyles.bodyTitle18w400TextStyle(context).copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(15),
          AppSubmitButton(
            onTap: () {
              AppNavigator.pushSlideX(context, SportWishlsitAddItems());
            },
            title: LocaleKeys.core_go_shopping.tr(),
          )
        ],
      ),
    );
  }
}
