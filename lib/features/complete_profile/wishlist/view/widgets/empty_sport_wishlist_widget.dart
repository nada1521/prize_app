import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';
import 'package:prize/features/complete_profile/wishlist/view/screens/sport_wishlsit_add_items.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptySportWishlistWidget extends StatelessWidget {
  const EmptySportWishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 100.w, maxHeight: 100.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.outline,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SvgPicture.asset(AppSvgs.gift),
            ),
          ),
          verticalSpace(15),
          Text(
            '${LocaleKeys.complete_profile_sport_wishlist_wishlist_empty.tr()} \n ${LocaleKeys.complete_profile_sport_wishlist_get_to_wishing.tr()}',
            style: Theme.of(context)
                .textTheme
                .font16RegularDarkPeriwinkle(context)
                .copyWith(
                  fontSize: 18,
                ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(15),
          AppSubmitButton(
              onTap: () {
                AppNavigator.pushSlideX(context, SportWishlsitAddItems());
              },
              title: LocaleKeys
                  .complete_profile_sport_wishlist_add_items_to_wishlist
                  .tr())
        ],
      ),
    );
  }
}
