import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/app_outline_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/dialog/base/pop_up_dialog.dart';
import 'package:prize/features/complete_profile/data/models/product_model.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/details_item_bottom_sheet_widget.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/your_profile_completed_successfully_pop_up_widget.dart';
import 'package:prize/features/complete_profile/wishlist/view/screens/sport_wishlsit_add_items.dart';
import 'package:prize/features/complete_profile/wishlist/view/widgets/empty_sport_wishlist_widget.dart';
import 'package:prize/features/complete_profile/wishlist/logic/adding_product_to_wishlist_cubit/adding_product_to_wishlist_cubit.dart';
import 'package:prize/features/product_details/views/screens/product_details_screen.dart';

class SportWishlistWidget extends StatefulWidget {
  const SportWishlistWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<SportWishlistWidget> createState() => _SportWishlistWidgetState();
}

class _SportWishlistWidgetState extends State<SportWishlistWidget> {
  @override
  Widget build(BuildContext context) {
    final selectedProducts =
        context.watch<AddingProductToWishlistCubit>().state.selectedProducts;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: selectedProducts.isNotEmpty
                ? SizedBox.shrink()
                : EmptySportWishlistWidget(),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          selectedProducts.isNotEmpty
              ? BuildProductGrid(
                  itemCard: selectedProducts,
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
                )
              : SliverToBoxAdapter(child: SizedBox())
        ],
      ),
      bottomNavigationBar: selectedProducts.isEmpty
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppFillBckgroundButton(
                    onTap: () {
                      AppNavigator.pushSlideX(context, SportWishlsitAddItems());
                    },
                    title: LocaleKeys
                        .complete_profile_sport_wishlist_add_items_to_wishlist
                        .tr(),
                  ),
                  verticalSpace(10),
                  AppOutLineButton(
                    onTap: () {
                      showPopup(context,
                          YourProfileCompletedSuccessfullyPopUpWidget());
                    },
                    title: LocaleKeys
                        .complete_profile_create_wishlist_widget_save_and_Confirm
                        .tr(),
                  ),
                ],
              ),
            ),
    );
  }
}
