import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/views/widgets/empty_shopping_cart_widget.dart';
import 'package:prize/features/cart/views/widgets/show_cart_products_widget.dart';
import 'package:prize/features/home/view/widgets/appbar/home_features_appbar.dart';
import 'package:prize/features/home/view/widgets/mothers_day_gifts/all_mothers_day_gifts_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: " ${LocaleKeys.cart_screen_cart_title.tr()} 0 ",
        showBackButton: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ShowCartProductsWidget(),
          ),
          SliverToBoxAdapter(
            child: EmptyShoppingCartWidget(),
          ),
          SliverToBoxAdapter(
            child: HomeFeaturesAppbar(
                featureLable: LocaleKeys.cart_screen_recently_viewed.tr()),
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
                featureLable: LocaleKeys.cart_screen_birthday_gifts.tr()),
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
