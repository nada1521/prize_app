import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_divder_widget.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/features/complete_profile/view/widgets/product/show_product_image_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/data/models/order_state_and_translation.dart';
import 'package:prize/features/orders/views/screens/orders_details_screen.dart';
import 'package:prize/features/orders/views/widgets/order_id_and_date_widget.dart';
import 'package:prize/features/orders/views/widgets/order_state_widget.dart';
import 'package:prize/features/orders/views/widgets/rate_icon_button.dart';
import 'package:prize/features/shop/views/screens/shop_products_screen.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushTo(
          context,
          OrdersDetailsScreen(
            order: order,
          )),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        margin: EdgeInsetsDirectional.only(
          bottom: 16.h,
        ),
        decoration: BoxDecoration(
          border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                OrderIDAndDateWidget(order: order),
                Spacer(),
                OrderStateWidget(
                  orderState: order.orderState,
                ),
                horizontalSpace(8),
                InkWell(
                  child: Icon(Icons.arrow_forward_ios_sharp),
                )
              ],
            ),
            verticalSpace(8),
            AppDivderWidget(),
            Row(
              children: [
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        ShowProductImageWidget(
                          width: 40.w,
                          image: AssetImage(order
                              .orderProductDataModel[index].productImageUrl),
                          imageUrl: "",
                        ),
                        if (order.orderProductDataModel[index].productCount !=
                            1)
                          Positioned(
                            right: 5.w,
                            child: Container(
                              width: 16.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.errorRed,
                              ),
                              child: FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  child: Text(
                                    "x${order.orderProductDataModel[index].productCount.toString()}",
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
                    itemCount: order.orderProductDataModel.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.lightModeGray,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Row(
                children: [
                  FittedBox(child: Text(LocaleKeys.core_total.tr())),
                  Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppSvgs.currency,
                        color: AppWidgetColor.fillWithOppositeColor(context),
                      ),
                      FittedBox(
                          child: Text(
                        "1443",
                        style: AppTextStyles
                                .headTitle14w500WhiteAndDarkBlueTextStyle(
                                    context)
                            .copyWith(
                          fontSize: 14,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            if (order.orderState == OrderState.delivered)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(16),
                  Row(
                    children: [
                      Expanded(
                        child: AppOutLineButton(
                            onTap: () {
                              pushTo(context, ShopProductsScreen());
                            },
                            title: LocaleKeys.OrderDetails_order_again.tr(),
                            icon: SvgPicture.asset(AppSvgs.refreshIcon)),
                      ),
                      if (order.orderState == OrderState.cancelled)
                        Expanded(
                          child: Row(
                            children: [
                              horizontalSpace(16),
                              RateIconButton(),
                            ],
                          ),
                        )
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
