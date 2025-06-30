import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/views/widgets/empty_shopping_cart_widget.dart';
import 'package:prize/features/cart/views/widgets/show_cart_products_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/empty_sport_wishlist_widget.dart';
import 'package:prize/features/home/view/widgets/appbar/home_features_appbar.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/all_mothers_day_gifts_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        OrangeAppbarWidget(
          title: "Cart (${"0"})",
          showBackButton: false,
        ),
        SliverToBoxAdapter(
          child: ShowCartProductsWidget(),
        ),
        SliverToBoxAdapter(
          child: EmptyShoppingCartWidget(),
        ),
        SliverToBoxAdapter(
          child: HomeFeaturesAppbar(featureLable: "Recently viewed"),
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
          child: HomeFeaturesAppbar(featureLable: "Birthday gifts"),
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
    );
  }
}
