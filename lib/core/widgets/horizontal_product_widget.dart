import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_price_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_title_widget.dart';

class HorizontalProductWidget extends StatelessWidget {
  const HorizontalProductWidget(
      {super.key, required this.productPath, required this.productCount});

  final String productPath;
  final int productCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      // height: 300.h,
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  ShowProductImageWidget(
                    width: 92.w,
                    height: 92.h,
                    image: AssetImage(
                      productPath,
                    ),
                    imageUrl: "",
                  ),
                  if (productCount != 1)
                    Positioned(
                      right: 5.w,
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.errorRed,
                        ),
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            child: Text(
                              "x${productCount.toString()}",
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Defacto",
                      style: AppTextStyles
                              .meduimBody16W500DarkAndLightThemeTitleTextStyle(
                                  context)
                          .copyWith(
                        fontSize: 14,
                      )),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 170.w,
                    ),
                    child: ShowProductTitleWidget(
                      title: productsWitOffer.first.title,
                      maxLines: 2,
                      textHeight: 45.h,
                      maxHeight: 40.h,
                      style:
                          AppTextStyles.smallHeadTitle12w400TextStyle(context)
                              .copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  // price widget
                  ShowProductPriceWidget(
                    newPrice: productsWitOffer.first.newPrice,
                    oldPrice: productsWitOffer.first.oldPrice,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
