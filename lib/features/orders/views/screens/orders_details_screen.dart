import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/views/widgets/coupon_code_widget.dart';
import 'package:prize/features/cart/views/widgets/order_summary_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/views/widgets/delivery_address_widget.dart';
import 'package:prize/features/orders/views/widgets/items_summary_widget.dart';
import 'package:prize/features/orders/views/widgets/order_id_and_date_widget.dart';
import 'package:prize/features/orders/views/widgets/order_state_widget.dart';
import 'package:prize/features/orders/views/widgets/tracking_order_widget.dart';
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
    );
  }
}
