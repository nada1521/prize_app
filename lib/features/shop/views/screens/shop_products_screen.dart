import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/complete_profile/data/models/category_model.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_items_widget.dart';
import 'package:prize/features/product_details/views/screens/product_details_screen.dart';

class ShopProductsScreen extends StatefulWidget {
  const ShopProductsScreen({super.key});

  @override
  State<ShopProductsScreen> createState() => _ShopProductsScreenState();
}

class _ShopProductsScreenState extends State<ShopProductsScreen> {
  CategorysNames categorysNames = CategorysNames.flashSale;

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
            child: BuildProductsItemsWidget(
                onTap: (value) => {
                      setState(() {
                        categorysNames = value;
                      })
                    }),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(10),
          ),
          BuildProductGrid(
            itemCard: categorysNames != CategorysNames.specialOffers
                ? productsWithoutOffer
                : productsWitOffer,
            productOnTap: (product) {
              pushTo(
                context,
                ProductDetailsScreen(product: product),
              );
            },
          ),
        ],
      ),
    );
  }
}
