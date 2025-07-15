import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/home/view/widgets/appbar/home_features_appbar.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/all_mothers_day_gifts_widget.dart';
import 'package:prize/features/orders/views/widgets/order_widget.dart';
import 'package:prize/features/orders/views/widgets/orders_states_tab_bar_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "My Orders",
        showBackButton: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: OrdersStatesTabBarWidget(
              tabItems: {
                "In progress": ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => OrderWidget(
                    order: inProgressOrders[index],
                  ),
                  itemCount: inProgressOrders.length,
                ),
                "Delivered": Column(),
                "Cancelled": Column(),
              },
            ),
          ),
          SliverToBoxAdapter(
            child: HomeFeaturesAppbar(
              featureLable: LocaleKeys.cart_screen_recently_viewed.tr(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              height: 350.h,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                child: AllMothersDayGiftsWidget(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: HomeFeaturesAppbar(
              featureLable: LocaleKeys.cart_screen_birthday_gifts.tr(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              height: 350.h,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                child: AllMothersDayGiftsWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
