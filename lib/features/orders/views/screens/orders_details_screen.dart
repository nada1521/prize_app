import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/views/widgets/order_summary_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/data/models/order_state_and_translation.dart';
import 'package:prize/features/orders/views/widgets/delivery_address_widget.dart';
import 'package:prize/features/orders/views/widgets/items_summary_widget.dart';
import 'package:prize/features/orders/views/widgets/order_id_and_date_widget.dart';
import 'package:prize/features/orders/views/widgets/order_state_widget.dart';
import 'package:prize/features/orders/views/widgets/popup/rate_widget.dart';
import 'package:prize/features/orders/views/widgets/tracking_order_widget.dart';
import 'package:prize/features/shop/views/screens/shop_products_screen.dart';
import 'package:prize/generated/locale_keys.g.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key, required this.order});

  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.OrderDetails_order_details.tr(),
        showBackButton: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
              margin: EdgeInsetsDirectional.only(top: 10.h, bottom: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppWidgetColor.fillWidgetColor(context),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: SvgPicture.asset(
                        AppSvgs.ordersCube,
                        width: 40.w,
                        height: 30.h,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  OrderIDAndDateWidget(order: order),
                  Spacer(),
                  OrderStateWidget(orderState: order.orderState),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TrackingOrderWidget(
              order: order,
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(10),
          ),
          SliverToBoxAdapter(
            child: DeliveryAddressWidget(),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(10),
          ),
          SliverToBoxAdapter(
            child: ItemsSummaryWidget(
              order: order,
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(10),
          ),
          SliverToBoxAdapter(
            child: OrderSummaryWidget(),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: returnBottomNavigationBar(order.orderState, context),
      ),
    );
  }

  Widget returnBottomNavigationBar(
    OrderState state,
    BuildContext context,
  ) {
    switch (state) {
      case OrderState.delivered:
        return Row(
          children: [
            Expanded(
              child: AppOutLineButton(
                onTap: () {},
                title: LocaleKeys.OrderDetails_order_again.tr(),
                icon: SvgPicture.asset(AppSvgs.refreshIcon),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: AppFillBckgroundButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => RateWidget(),
                  );
                },
                title: LocaleKeys.my_order_screen_rate.tr(),
                textStyle:
                    AppTextStyles.appFillColorButton16w500TextStyle(context)
                        .copyWith(
                  color: AppColors.darkModeTanOrange,
                ),
                icon: SvgPicture.asset(AppSvgs.starOutline),
                color: AppColors.darkModeTanOrange.withOpacity(.2),
              ),
            ),
          ],
        );
      case OrderState.cancelled:
        return AppOutLineButton(
          onTap: () {
            pushTo(context, ShopProductsScreen());
          },
          title: LocaleKeys.OrderDetails_order_again.tr(),
          icon: SvgPicture.asset(AppSvgs.refreshIcon),
        );
      default:
        return SizedBox.shrink();
    }
  }
}
