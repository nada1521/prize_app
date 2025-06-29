import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/details_item_bottom_sheet_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/product_action_buttons_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_rating_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.itemData , this.onTap});

  final ProductModel itemData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {
        showBottomSheet(
          context: context,
          builder: (context) => DetailsItemBottomSheetWidget(
            itemData: itemData,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product image
            Expanded(
              flex: 3,
              child: ShowProductImageWidget(
                height: 150.h,
                maxHeight: 160.h,
                imageUrl: itemData.image,
                imageScale: 4,
                isOffer: itemData.isOffer,
              ),
            ),
            // product title
            ShowProductTitleWidget(
              title: itemData.title,
              maxLines: 2,
              textHeight: 45.h,
              maxHeight: 50.h,
            ),
            // price widget
            ShowProductPriceWidget(
              newPrice: itemData.newPrice,
              oldPrice: itemData.oldPrice,
            ),
            verticalSpace(8),
            // rating widget
            ShowProductRatingWidget(
              rating: '4.1',
            ),
            verticalSpace(4),
            // icon Buttons
            Expanded(
              child: ProductActionsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
