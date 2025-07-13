import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_cart_cubit/adding_product_to_cart_cubit.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key, this.isCouponValid});

  final bool? isCouponValid;
  @override
  Widget build(BuildContext context) {
    final selectedProducts =
        context.watch<AddingProductToCartCubit>().state.selectedProducts;

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
                "(${selectedProducts.length} items)",
                style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                    .copyWith(
                  color: AppColors.periwinkle,
                ),
              ),
            ],
          ),
          verticalSpace(16),
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
                    selectedProducts.first.newPrice,
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
          verticalSpace(16),
          if (isCouponValid != null && isCouponValid!)
            Row(
              children: [
                Text(
                  "Coupon:",
                  style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                      .copyWith(
                    color: AppColors.periwinkle,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  AppSvgs.currency,
                  width: 20.w,
                  height: 20.h,
                  color: AppColors.greenColor,
                ),
                horizontalSpace(8),
                Text(
                  "-20",
                  style:
                      AppTextStyles.meduimBody16W500BlackAndWhiteTitleTextStyle(
                              context)
                          .copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greenColor,
                  ),
                )
              ],
            ),
          verticalSpace(10),
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
                    selectedProducts.fold<double>(0.0, (total, product) {
                      if (isCouponValid != null && isCouponValid!) {
                        return total +
                            double.tryParse(product.newPrice)! -
                            20.0;
                      } else {
                        return total + double.tryParse(product.newPrice)!;
                      }
                    }).toStringAsFixed(2),
                    style: AppTextStyles
                            .meduimBody16W500BlackAndWhiteTitleTextStyle(
                                context)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
