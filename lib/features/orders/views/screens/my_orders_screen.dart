import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/home/view/widgets/appbar/home_features_appbar.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/all_mothers_day_gifts_widget.dart';
import 'package:prize/features/orders/data/models/order_model.dart';
import 'package:prize/features/orders/data/models/order_state_and_translation.dart';
import 'package:prize/features/orders/views/widgets/empty_orders_widget.dart';
import 'package:prize/features/orders/views/widgets/order_widget.dart';
import 'package:prize/features/orders/views/widgets/orders_states_tab_bar_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderModel> inProgressOrder = orders
        .where((order) => order.orderState == OrderState.inProgress)
        .toList();
    final List<OrderModel> deliveredOrder = orders
        .where((order) => order.orderState == OrderState.delivered)
        .toList();
    final List<OrderModel> canceledOrder = orders
        .where((order) => order.orderState == OrderState.cancelled)
        .toList();
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.core_my_orders.tr(),
        showBackButton: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: OrdersStatesTabBarWidget(
              tabItems: {
                LocaleKeys.my_order_screen_in_progress.tr(): ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => inProgressOrder.isEmpty
                      ? EmptyOrdersWidget()
                      : OrderWidget(
                          order: inProgressOrder[index],
                        ),
                  itemCount: inProgressOrder.length,
                ),
                LocaleKeys.my_order_screen_delivered.tr(): ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => deliveredOrder.isEmpty
                      ? EmptyOrdersWidget()
                      : OrderWidget(order: deliveredOrder[index]),
                  itemCount: deliveredOrder.length,
                ),
                LocaleKeys.my_order_screen_cancelled.tr(): ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => canceledOrder.isEmpty
                      ? EmptyOrdersWidget()
                      : OrderWidget(order: canceledOrder[index]),
                  itemCount: canceledOrder.length,
                ),
              },
            ),
          ),
          // if (orders.isEmpty)
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  color:
                      AppWidgetColor.fillWidgetByLightBackgroundColor(context),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.w, vertical: 30.h),
                    child: EmptyOrdersWidget(),
                  ),
                ),
                verticalSpace(10),
                HomeFeaturesAppbar(
                  featureLable: LocaleKeys.cart_screen_recently_viewed.tr(),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 350.h,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                    child: AllMothersDayGiftsWidget(),
                  ),
                ),
                HomeFeaturesAppbar(
                  featureLable: LocaleKeys.cart_screen_birthday_gifts.tr(),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 350.h,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                    child: AllMothersDayGiftsWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
