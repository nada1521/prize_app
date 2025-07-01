import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_replacement.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_disable_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/screens/complete_profile_screen.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';

class ConfirmOrderToCartBottomSheetWidget extends StatelessWidget {
  const ConfirmOrderToCartBottomSheetWidget(
      {super.key, required this.itemData});
  final ProductModel itemData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Container(
        height: 400.h,
        color: AppWidgetColor.fillBackgroundColor(context),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppWidgetColor.fillWidgetColor(context),
                  ),
                )
              ],
            ),
            verticalSpace(15),
            Row(
              children: [
                Image.asset(
                  AppImages.successImage,
                  width: 32.w,
                  height: 32.h,
                ),
                horizontalSpace(5),
                ShowProductImageWidget(
                  imageUrl: itemData.image,
                  height: 56.h,
                  maxHeight: 56.h,
                  imageScale: 1,
                  width: 50.w,
                ),
                verticalSpace(8),
                ShowProductTitleWidget(
                  title: itemData.title,
                  maxLines: 2,
                  textHeight: 50.h,
                  maxHeight: 60.h,
                  style: AppTextStyles.smallHeadTitle22w400TextStyle(context)
                      .copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppWidgetColor.fillIconButtonWidgetColor(context),
                borderRadius: BorderRadius.circular(16.r),
                shape: BoxShape.rectangle,
              ),
              height: 50.h,
              child: Row(
                children: [
                  Text("Total",
                      style: AppTextStyles
                              .meduimBody16W500DarkAndLightThemeTitleTextStyle(
                                  context)
                          .copyWith(
                        fontSize: 16,
                      )),
                  Spacer(),
                  ShowProductPriceWidget(
                    newPrice: "500",
                    oldPrice: "",
                  )
                ],
              ),
            ),
            verticalSpace(10),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppOutLineButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: LocaleKeys.confirm_order_see_more_items.tr(),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: AppFillBckgroundButton(
                    onTap: () {
                      pushReplacement(context, CompleteProfileScreen());
                    },
                    title: LocaleKeys.confirm_order_view_wishlist.tr(),
                  ),
                ),
              ],
            ),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
