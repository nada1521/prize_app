import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_close_button.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_items_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:flutter/material.dart';

class SportWishlsitAddItems extends StatelessWidget {
  const SportWishlsitAddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add items',
          style: AppTextStyles.appBarHeadTitleTextStyle(context),
        ),
        automaticallyImplyLeading: false,
        leading: AppCloseButton(),
        centerTitle: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BuildProductsItemsWidget()),
          SliverToBoxAdapter(child: verticalSpace(10)),
          BuildProductGrid(),
        ],
      ),
    );
  }
}
