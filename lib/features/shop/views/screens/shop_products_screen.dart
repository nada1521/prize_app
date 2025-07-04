import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_items_widget.dart';

class ShopProductsScreen extends StatelessWidget {
  const ShopProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.nav_title_shop_title.tr(),
        showBackButton: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: verticalSpace(10),
          ),
          SliverToBoxAdapter(
            child: BuildProductsItemsWidget(),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(10),
          ),
          BuildProductGrid(
            itemCard: productsWitOffer,
          ),
        ],
      ),
    );
  }
}
