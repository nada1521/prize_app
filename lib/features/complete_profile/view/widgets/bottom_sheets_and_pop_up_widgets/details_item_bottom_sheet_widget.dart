import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_close_button.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/confirm_order_successfully_bottom_sheet_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/select_size_multi_choise.dart';
import 'package:prize/features/complete_profile/view/widgets/show_available_colors_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_rating_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class DetailsItemBottomSheetWidget extends StatefulWidget {
  const DetailsItemBottomSheetWidget({super.key, required this.itemData});

  final ProductModel itemData;
  @override
  State<DetailsItemBottomSheetWidget> createState() =>
      _DetailsItemBottomSheetWidgetState();
}

class _DetailsItemBottomSheetWidgetState
    extends State<DetailsItemBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Stack(
        children: [
          Container(
            color: AppWidgetColor.fillBackgroundColor(context),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Details',
                        style: AppTextStyles.headTitle24w600TextStyle(context)
                            .copyWith(
                          fontSize: 16,
                        ),
                      ),
                      AppCloseButton(),
                    ],
                  ),

                  // product image
                  ShowProductImageWidget(
                    height: 282.h,
                    maxHeight: 282.h,
                    width: double.infinity,
                    imageUrl: widget.itemData.image,
                    imageScale: 2.5,
                  ),
                  verticalSpace(10),

                  ShowProductRatingWidget(
                    rating: '4.1',
                  ),
                  ShowProductTitleWidget(
                    title: widget.itemData.title,
                    maxLines: 3,
                    textHeight: 50.h,
                    maxHeight: 60.h,
                    style: AppTextStyles.smallHeadTitle22w400TextStyle(context)
                        .copyWith(
                      fontSize: 14,
                    ),
                  ),
                  ShowProductPriceWidget(
                    newPrice: widget.itemData.newPrice,
                    oldPrice: widget.itemData.oldPrice,
                  ),
                  verticalSpace(10),
                  ShowAvailableColorsWidget(),
                  verticalSpace(10),
                  SelectSizeMultiChoise(),
                  verticalSpace(60),
                ],
              ),
            ),
          ),

          // Adding items to wishlist button
          Positioned(
            bottom: 5,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              color: AppWidgetColor.fillBackgroundColor(context),
              child: AppSubmitButton(
                onTap: () {
                  final double height = MediaQuery.of(context).size.height;
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: height / 4,
                      child: ConfirmOrderSuccessfullyBottomSheetWidget(
                        itemData: widget.itemData,
                      ),
                    ),
                  );
                },
                title: LocaleKeys
                    .complete_profile_sport_wishlist_add_items_to_wishlist
                    .tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
