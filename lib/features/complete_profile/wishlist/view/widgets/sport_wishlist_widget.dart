import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/app_disable_button.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/dialog/base/pop_up_dialog.dart';
import 'package:prize/features/complete_profile/view/widgets/product/build_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:prize/features/complete_profile/view/widgets/bottom_sheets_and_pop_up_widgets/your_profile_completed_successfully_pop_up_widget.dart';

class SportWishlistWidget extends StatelessWidget {
  const SportWishlistWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(child: EmptySportWishlistWidget()),
          BuildProductGrid(
            itemCard: productsWithoutOffer,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppFillBckgroundButton(
              onTap: () {},
              title: LocaleKeys
                  .complete_profile_sport_wishlist_add_items_to_wishlist
                  .tr(),
            ),
            verticalSpace(10),
            AppOutLineButton(
              onTap: () {
                showPopup(
                    context, YourProfileCompletedSuccessfullyPopUpWidget());
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
