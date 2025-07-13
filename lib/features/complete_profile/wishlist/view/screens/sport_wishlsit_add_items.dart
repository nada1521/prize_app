import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_close_button.dart';
import 'package:prize/features/complete_profile/data/models/category_model.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/details_item_bottom_sheet_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_items_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:flutter/material.dart';

class SportWishlsitAddItems extends StatefulWidget {
  const SportWishlsitAddItems({super.key});

  @override
  State<SportWishlsitAddItems> createState() => _SportWishlsitAddItemsState();
}

class _SportWishlsitAddItemsState extends State<SportWishlsitAddItems> {
  CategorysNames categorysNames = CategorysNames.flashSale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.complete_profile_sport_wishlist_add_item.tr(),
          style: AppTextStyles.appBarHeadTitleTextStyle(context),
        ),
        automaticallyImplyLeading: false,
        leading: AppCloseButton(),
        centerTitle: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BuildProductsItemsWidget(
                onTap: (value) => {
                      setState(() {
                        categorysNames = value;
                      })
                    }),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          BuildProductGrid(
            productOnTap: (product) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SizedBox(
                  height: 600.h,
                  child: DetailsItemBottomSheetWidget(
                    itemData: product,
                  ),
                ),
              );
            },
            itemCard: categorysNames != CategorysNames.specialOffers
                ? productsWithoutOffer
                : productsWitOffer,
          ),
        ],
      ),
    );
  }
}
